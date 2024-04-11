

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../main.dart';


import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../bindings.dart';
import '../models/cloth.dart';
import '../models/user.dart';




UserModel get cUser => authCtr.cUser;

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  UserModel cUser = UserModel();
  late Rx<User?> firebaseUser;





  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 0), () {

    });
  }
  @override
  void onClose() {
    super.onClose();


  }




  Future<List<Cloth>> loadCart() async {
    List<Cloth> cart = [];

    try {
      // Retrieve the document containing the cart field from Firestore
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance.collection('users').doc(cUser.id).get();

      // Extract the cart field data from the document
      Map<String, dynamic>? data = documentSnapshot.data() as Map<String, dynamic>?;

      if (data != null) {
        // Use the null-aware operator to safely access the 'cart' field
        List<dynamic>? cartData = data['cart'] as List<dynamic>;
        print('cartData: ${cartData.length}');



        if (cartData != null) {
          // Print the type of 'colors' field
          print('Type of colors: ${cartData.first['colors'].runtimeType}');

          // Convert the cart field data back into a List<Cloth>
          cart = cartData.map((data) => Cloth.fromJson(data)).toList();
        }
      }
    } catch (e) {
      // Handle any errors
      print('Error loading cart: $e');
    }

    return cart;
  }
  Future<void> saveCart(List<Cloth> cart) async {
    print('## saving my cart...');

    // Convert the list of Cloth objects into a list of maps
    List<Map<String, dynamic>> cartData = cart.map((cloth) => cloth.toJson()).toList();

    try {
      // Save the converted list to the "cart" field in Firestore
      await  FirebaseFirestore.instance.collection('users').doc(cUser.id).set({'cart': cartData}, SetOptions(merge: true));
    } catch (e) {
      // Handle any errors
      print('Error saving cart: $e');
    }
  }

  /// refresh user props from database
  RefreshUserByEmail(email) async {
    debugPrint('## getting "${email}" data ...');

    final userSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .get();

    if (userSnapshot.docs.isNotEmpty) {
      final userData = userSnapshot.docs.first.data();
      UserModel usrFound = UserModel.fromJson(userData);
      cUser = usrFound;/// save user found to provider
      print('## cUser.myCart ${cUser.cart.length}');
      homeCtr.myCart =await loadCart();
      //homeCtr.myCart = testClothes;
      homeCtr.update();
      openMainScreen(navKey.currentContext!);/// go home

     // debugPrint('##'+(usrFound.toJson().toString()));
    } else {
      SnackBar(
        content: Text('User not found in database'),
        backgroundColor: Colors.red.withOpacity(.8),
      );
    }
  }





}