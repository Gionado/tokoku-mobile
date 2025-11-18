import 'package:flutter/material.dart';
import 'package:tokoku/screens/menu.dart';
import 'package:tokoku/screens/productlist_form.dart';
import 'package:tokoku/screens/product_entry_list.dart';
import 'package:tokoku/screens/login.dart'; // Import halaman login
import 'package:pbp_django_auth/pbp_django_auth.dart'; // Import pbp_django_auth
import 'package:provider/provider.dart'; // Import provider

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Tambahkan variabel request
    final request = context.watch<CookieRequest>();

    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF713F12),
            ),
            child: Column(
              children: [
                Text(
                  'Tokoku',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "Seluruh produk sepak bola terkini di sini!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.post_add),
            title: const Text('Add Product'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProductFormPage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: const Text('Product List'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProductEntryListPage()),
              );
            },
          ),
          
          // TOMBOL LOGOUT
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () async {
              // Ganti URL di bawah ini dengan URL aplikasi kamu
              // Perhatikan path '/auth/logout/' sesuai dengan app authentication
              final response = await request.logout(
                  "http://localhost:8000/auth/logout/"); 
              
              String message = response["message"];
              if (context.mounted) {
                if (response['status']) {
                  String uname = response["username"];
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("$message Sampai jumpa, $uname."),
                  ));
                  // Redirect ke halaman login dan hapus semua rute sebelumnya
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                    (route) => false,
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(message),
                  ));
                }
              }
            },
          ),
        ],
      ),
    );
  }
}