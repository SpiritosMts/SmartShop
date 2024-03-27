import 'cloth.dart';

class UserModel {
  String id;
  String name;
  String email;
  String pwd;
  String phone;
  String address;
  bool verified;
  List cart;

  UserModel({
    this.id = '',
    this.name = '',
    this.email = '',
    this.pwd = '',
    this.phone = '',
    this.address = '',
    this.verified = false,
    this.cart = const [],

  });

  // Convert UserModel object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'pwd': pwd,
      'phone': phone,
      'address': address,
      'verified': verified,
      'cart': cart,

    };
  }

  // Create UserModel object from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      pwd: json['pwd'] ?? '',
      phone: json['phone'] ?? '',
      address: json['address'] ?? '',
      verified: json['verified'] ?? false,
      cart: json['cart'] ?? [],
    );
  }
}
