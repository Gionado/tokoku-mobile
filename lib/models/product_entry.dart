// To parse this JSON data, do
//
//     final productEntry = productEntryFromJson(jsonString);

import 'dart:convert';

List<ProductEntry> productEntryFromJson(String str) => List<ProductEntry>.from(json.decode(str).map((x) => ProductEntry.fromJson(x)));

String productEntryToJson(List<ProductEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductEntry {
    String id;
    String name;
    int price;
    String description;
    String category;
    String thumbnail;
    bool isFeatured;
    int userId;
    String userUsername;

    ProductEntry({
        required this.id,
        required this.name,
        required this.price,
        required this.description,
        required this.category,
        required this.thumbnail,
        required this.isFeatured,
        required this.userId,
        required this.userUsername,
    });

    factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
        // Perhatikan bagian '??' di bawah ini untuk menangani Null
        id: json["id"].toString(), // Pastikan id jadi string
        name: json["name"] ?? "",
        price: json["price"] ?? 0, // Kalau harga null, anggap 0
        description: json["description"] ?? "",
        category: json["category"] ?? "",
        thumbnail: json["thumbnail"] ?? "",
        isFeatured: json["is_featured"] ?? false,
        userId: json["user_id"] ?? 0, // SUMBER ERROR UTAMA: Kalau user_id null, anggap 0
        userUsername: json["user_username"] ?? "Anonymous",
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "description": description,
        "category": category,
        "thumbnail": thumbnail,
        "is_featured": isFeatured,
        "user_id": userId,
        "user_username": userUsername,
    };
}
