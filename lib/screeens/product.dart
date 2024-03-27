import 'package:flutter/material.dart';

class Product {
  final String title;
  final String description;
  final String image;
  final double price;
  final List<Color> colors;
  final String category;
  final double rate;

  Product({
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    required this.colors,
    required this.category,
    required this.rate,
  });
}

final List<Product> products = [
  Product(
    title: "Heels",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed, consectetur adipiscing elit,piscing elit, sedLorem ipsum dolor sit amet, consectetur adipiscing elit, sedLorem ipsum dolor sit amet, consectetur adipiscing elit, sedLorem ipsum dolor sit amet, consectetur adipiscing elit, sed Lorem ipsum dolor sit amet, consectetur adipiscing elit, sedLorem ipsum dolor sit amet, ",
    image: "assets/images/purpleHeels.png",
    price: 120,
    colors: [
      const Color.fromARGB(255, 89, 5, 83),
      Colors.blue,
      Colors.orange,
    ],
    category: "Heels",
    rate: 4.8,
  ),
  Product(
    title: "Woman dress",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed s",
    image: "assets/images/orangeblouses.png",
    price: 120,
    colors: [
      Colors.brown,
      Colors.red,
      Colors.pink,
    ],
    category: "Woman Fashion",
    rate: 4.8,
  ),
  Product(
    title: "Jackets",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed ",
    image: "assets/images/Jacketgirl.png",
    price: 150,
    colors: [
      Colors.black,
      Colors.blue,
    ],
    category: "jackets",
    rate: 4.8,
  ),
  Product(
    title: "bags",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed mlldnhjbghsvxfcfscvggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb",
    image: "assets/images/ValentinoBag.png",
    price: 55,
    colors: [
      Colors.black,
    ],
    category: "bags",
    rate: 4.8,
  ),
];
