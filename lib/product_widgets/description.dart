import 'package:flutter/material.dart';

import '../models/cloth.dart';

class ProductDescription extends StatelessWidget {
  final Cloth? product;
  final String text;
  const ProductDescription({super.key, required this.text, this.product});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        width: 110,
        height: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(255, 246, 147, 33),
        ),
        alignment: Alignment.center,
        child: const Text(
          "Description",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      const SizedBox(height: 20),
      Text(
        text,
        style: const TextStyle(
          color: Colors.grey,
        ),
      )
    ]);
  }
}
