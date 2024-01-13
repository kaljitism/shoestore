import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(
            title,
          ),
          Text(
            price,
          ),
          Image.asset(imageUrl),
        ],
      ),
    );
  }
}
