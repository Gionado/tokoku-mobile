import 'package:flutter/material.dart';
import 'package:tokoku/models/product_entry.dart';
import 'package:tokoku/widgets/left_drawer.dart';
import 'package:tokoku/widgets/product_entry_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:tokoku/screens/product_detail.dart';

class ProductEntryListPage extends StatefulWidget {
  // Tambahkan variabel ini untuk mengecek apakah ingin filter user atau tidak
  final bool filterUser; 
  final bool filterFeatured;

  // Defaultnya false (artinya menampilkan semua produk)
  const ProductEntryListPage({super.key, this.filterUser = false, this.filterFeatured = false,});

  @override
  State<ProductEntryListPage> createState() => _ProductEntryListPageState();
}

class _ProductEntryListPageState extends State<ProductEntryListPage> {
  Future<List<ProductEntry>> fetchProduct(CookieRequest request) async {
    String url;

    // Tentukan URL berdasarkan filter
    if (widget.filterUser) {
      // Jika tombol "My Products" yang ditekan
      url = 'http://localhost:8000/my-products-json/';
    } else {
      // Jika tombol "All Products" atau "Featured" yang ditekan
      url = 'http://localhost:8000/json/';
    }

    final response = await request.get(url);

    var data = response;
    List<ProductEntry> listProduct = [];
    for (var d in data) {
      if (d != null) {
        // 1. Kita ubah dulu JSON menjadi objek ProductEntry
        ProductEntry product = ProductEntry.fromJson(d);

        // 2. Cek apakah sedang mode Filter Featured?
        if (widget.filterFeatured) {
          // Jika iya, HANYA masukkan produk yang isFeatured == true
          if (product.isFeatured) {
            listProduct.add(product);
          }
        } else {
          // Jika tidak sedang filter featured, masukkan semua produk
          listProduct.add(product);
        }
      }
    }
    return listProduct;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        // Judul dinamis
        title: Text(widget.filterUser 
            ? 'My Products' 
            : (widget.filterFeatured ? 'Featured Products' : 'All Products')),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        actions: [
          if (!widget.filterUser && !widget.filterFeatured)
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: PopupMenuButton<String>(
                // Membuat tampilan tombol seperti TextButton tapi bisa didropdown
                child: Row(
                  children: const [
                    Icon(Icons.filter_list, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      "Filter Products",
                      style: TextStyle(
                        color: Colors.white, 
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                // Logika ketika salah satu menu dipilih
                onSelected: (String value) {
                  if (value == 'featured') {
                    // Ke Featured Products
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProductEntryListPage(
                          filterUser: false,
                          filterFeatured: true,
                        ),
                      ),
                    );
                  } else if (value == 'my_products') {
                    // Ke My Products
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProductEntryListPage(
                          filterUser: true,
                          filterFeatured: false,
                        ),
                      ),
                    );
                  }
                },
                // Daftar isi dropdown
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'featured',
                    child: Row(
                      children: [
                        Icon(Icons.workspace_premium, color: Colors.amber), // Ikon bintang/premium
                        SizedBox(width: 8),
                        Text('Featured Products'),
                      ],
                    ),
                  ),
                  const PopupMenuItem<String>(
                    value: 'my_products',
                    child: Row(
                      children: [
                        Icon(Icons.person, color: Colors.blue),
                        SizedBox(width: 8),
                        Text('My Products'),
                      ],
                    ),
                  ),
                ],
              ),
            ),

          // Tampilkan tombol balik ke All Products
          if (widget.filterUser || widget.filterFeatured)
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: TextButton.icon(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProductEntryListPage(
                        filterUser: false,
                        filterFeatured: false,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.shopping_bag_outlined, color: Colors.white),
                label: const Text(
                  "Show All",
                  style: TextStyle(color: Colors.white),
                ),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
              ),
            ),
        ],
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProduct(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.filterUser 
                        ? 'You haven\'t added any products yet.'
                        : 'There are no products in Tokoku yet.',
                      style: TextStyle(
                        fontSize: 20, 
                        color: Theme.of(context).colorScheme.primary, 
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => ProductEntryCard(
                  product: snapshot.data![index],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailPage(
                          product: snapshot.data![index],
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          }
        },
      ),
    );
  }
}