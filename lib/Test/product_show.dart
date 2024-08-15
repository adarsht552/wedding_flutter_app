// lib/screens/product_list_screen.dart

import 'package:flutter/material.dart';
import 'package:wedding/Test/api/product_show_api.dart';
import 'package:wedding/Test/model/model_product.dart';


class ProductListScreen extends StatelessWidget {
  final ProductService productService = ProductService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Products')),
      body: FutureBuilder<List<Product>>(
        future: productService.fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No products found'));
          } else {
            final products = snapshot.data!;
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ListTile(
                  leading: Image.network(product.image), // Display product image
                  title: Text(product.name),
                  subtitle: Text('\$${product.price}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
