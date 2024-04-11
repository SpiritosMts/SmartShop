import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartshop/generalWidgets.dart';
import 'bindings.dart';
import 'models/cloth.dart';





class HomeController extends GetxController {

  Cloth selectedCloth = Cloth();
  int currentPage = 0;
  int itemsPerPage = 16;
  double subtotal = 0.0;
  double total = 0.0;
  List<Cloth> allClothes =[];
  List<Cloth> foundClothes =[];
  List<Cloth> myCart = [];

  selectCloth(Cloth cl){
    selectedCloth = cl;
    update();
  }


  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(milliseconds: 0), () async {
      print('## init homeCtr');
   await  getClothes();
    });
  }

  Future<void> getClothes() async {
    allClothes = await parseCsvData();
    foundClothes = allClothes;
  }


  void updateCartTotals(){
    double totalPrice = 0.0;
    for (var item in myCart) {
      totalPrice += item.price * item.quantity;
    }
    total = totalPrice;
  }

  Future<void> addToCart(Cloth clothToAdd,int qty) async {
    bool clothExists = false;
    clothToAdd.quantity = qty;
    for (var item in myCart) {
      if (item.id == clothToAdd.id) {
        clothExists = true;
        Fluttertoast.showToast(
          msg: "This item already exists",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        return; // Exit the method early if cloth exists
      }
    }
    // If cloth doesn't exist, add it to myCart
    if (!clothExists) {
      myCart.add(clothToAdd);
      ///update in database
      Fluttertoast.showToast(
          msg: "Item successfully added",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    update();
    await authCtr.saveCart(homeCtr.myCart);///save cart

    print('## my cart lentgh = ${myCart.length} / clothExists = $clothExists ');
  }

  void likeCloth(Cloth cl){

  }
  void checkOut(){

  }
  void filterByCateg(String categ){
    List<Cloth> categClothes = allClothes.where((cloth) => cloth.term == categ).toList();
    foundClothes = categClothes;
    print('## foundClothes = $categ');
    update();
  }

  void filterBySearch(String search){
    if(search.isEmpty) return;
    List<Cloth> searchClothes = allClothes.where((cloth) {
      bool found = (cloth.term.contains(search) || cloth.name.contains(search)|| cloth.category.contains(search));
      return found;
    }).toList();
    foundClothes = searchClothes;
    print('## foundClothes = $search');
    update();
  }





}