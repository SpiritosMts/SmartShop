class Cloth {
  String name;
  String description;
  String image;
  String category;
  int quantity;
  double price;
  double rating;
  int reviews;
  String seller;
  bool liked;
  bool addedToCart;

  Cloth({
    this.name = '',
    this.description = '',
    this.image = '',
    this.category = '',
    this.quantity = 0,
    this.price = 0.0,
    this.seller = '',
    this.reviews = 0,
    this.rating = 0.0,
    this.addedToCart =false,
    this.liked   = false,
  });

  // Convert Cloth object to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'image': image,
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
    return Cloth(
      addedToCart: json['addedToCart'] ?? false ,
      liked: json['liked'] ?? false,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      image: json['image'] ?? '',
      seller: json['seller'] ?? '',
      category: json['category'] ?? '',
      quantity: json['quantity'] ?? 0,
      reviews: json['reviews'] ?? 0,
      price: json['price'] ?? 0.0,
      rating: json['rating'] ?? 0.0,
    );
  }
}
