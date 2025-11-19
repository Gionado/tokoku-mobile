import 'package:flutter/material.dart';
import 'package:tokoku/widgets/left_drawer.dart';
import 'package:tokoku/widgets/product_card.dart';
import 'package:tokoku/screens/login.dart'; // Import Login
import 'package:pbp_django_auth/pbp_django_auth.dart'; // Import CookieRequest
import 'package:provider/provider.dart'; // Import Provider

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final String nama = "Gionado Gunawan";
  final String npm = "2406496196";
  final String kelas = "E";

  final List<ItemHomepage> items = [
    ItemHomepage("All Products", Icons.shopping_cart, Colors.blue),
    ItemHomepage("My Products", Icons.all_inbox, Colors.green),
    ItemHomepage("Add Product", Icons.add_box_outlined, Colors.red),
    ItemHomepage("Featured", Icons.workspace_premium, const Color(0xFF713F12)),
  ];

  @override
  Widget build(BuildContext context) {
    // 1. Ambil request dari provider
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TokoKu',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: const IconThemeData(color: Colors.white),
        
        // Tombol Logout Kanan Atas) 
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0), // Memberi jarak dari pinggir kanan
            child: TextButton.icon(
              onPressed: () async {
                final response = await request.logout(
                    "https://gionado-gunawan-tokoku.pbp.cs.ui.ac.id/auth/logout/"); // Sesuaikan URL
                String message = response["message"];
                if (context.mounted) {
                  if (response['status']) {
                    String uname = response["username"];
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("$message Sampai jumpa, $uname."),
                    ));
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
              // Ikon Logout
              icon: const Icon(Icons.logout, color: Colors.white),
              // Tulisan "Logout"
              label: const Text(
                "Logout",
                style: TextStyle(color: Colors.white),
              ),
              // Efek sentuhan
              style: TextButton.styleFrom(
                foregroundColor: Colors.white, 
              ),
            ),
          ),
        ],
      ),
      drawer: const LeftDrawer(), 
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            ),
            const SizedBox(height: 16.0),
            Center(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Selamat datang di TokoKu',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  GridView.count(
                    primary: true,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    children: items.map((ItemHomepage item) {
                      return ItemCard(item);
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color;

  ItemHomepage(this.name, this.icon, this.color);
}

class InfoCard extends StatelessWidget {
  final String title;
  final String content;

  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Container(
        width: MediaQuery.of(context).size.width / 3.5,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(content),
          ],
        ),
      ),
    );
  }
}