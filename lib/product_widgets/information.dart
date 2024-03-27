import 'package:flutter/material.dart';
import 'package:smartshop/screeens/product.dart';

class ProductInformation extends StatelessWidget {
  final Product? product; // Declare product as nullable
  const ProductInformation({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product?.title ?? "",
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "DT ${product?.price.toString() ?? 'No price'}",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 20,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 245, 152, 52),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 2,
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.star,
                            size: 20,
                            color: Color.fromARGB(255, 240, 239, 237),
                          ),
                          Text(
                            product?.rate.toString() ?? "No rating",
                            style: const TextStyle(
                              color: Color.fromARGB(255, 241, 240, 237),
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      "(320 Reviews)",
                      style: TextStyle(
                        color: Color.fromARGB(255, 164, 161, 163),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: "Seller: "),
                  TextSpan(
                    text: "tarqul isalm",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
