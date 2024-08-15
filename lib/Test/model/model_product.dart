// lib/models/product.dart

class Product {
  final String id;
  final String name;
  final double price;
  final String description;
  final String category;
  final int stock;
  final String image;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.category,
    required this.stock,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'],
      name: json['name'],
      price: json['price'].toDouble(),
      description: json['description'],
      category: json['category'],
      stock: json['stock'],
      image: json['image'],
    );
  }
}
