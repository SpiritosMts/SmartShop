import 'package:flutter/material.dart';

import '../generalWidgets.dart';

class Cloth {
  String id;
  String name;
  String description;
  List<String> images;
  String category;
  int quantity;
  double price;
  double rating;
  int reviews;
  String seller;
  String term;
  bool liked;
  bool addedToCart;
  List<Color> colors; // Change the type to List<Color>

  Cloth({
    this.id = '',
    this.name = '',
    this.description = '',
    this.term = '',
    this.images = const [],
    this.category = '',
    this.quantity = 0,
    this.price = 0.0,
    this.seller = '',
    this.reviews = 0,
    this.rating = 0.0,
    this.colors = const [],
    this.addedToCart =false,
    this.liked   = false,
  });

  // Convert Cloth object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'colors': colorsToHex(colors),
      'description': description,
      'term': term,
      'images': images,
      'addedToCart': addedToCart,
      'liked': liked,
      'category': category,
      'quantity': quantity,
      'price': price,
      'seller': seller,
      'reviews': reviews,
      'rating': rating,
    };
  }

  // Create Cloth object from JSON
  factory Cloth.fromJson(Map<String, dynamic> json) {

   // List<String> colorsHex = json['colors'] as List<String>;
    //print('## colors: $colorsHex');
    return Cloth(
      addedToCart: json['addedToCart'] ?? false ,
      liked: json['liked'] ?? false,
      id: json['id'] ?? '',
      term: json['term'] ?? '',
      name: json['name'] ?? '',
      colors: json['colors'] != null ? hexToColors(List<String>.from(json['colors'] as List<dynamic>)) : [],
      description: json['description'] ?? '',
      images: List<String>.from(json['images'] ?? []),
      seller: json['seller'] ?? '',
      category: json['category'] ?? '',
      quantity: json['quantity'] ?? 0,
      reviews: json['reviews'] ?? 0,
      price: json['price'] ?? 0.0,
      rating: json['rating'] ?? 0.0,
    );
  }
}
