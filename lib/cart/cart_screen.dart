import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartshop/homeCtr.dart';
import 'package:smartshop/cart/cart_tile.dart';
import '../bindings.dart';
import '../generalWidgets.dart';
import '../main.dart';

class Cartscreen extends StatefulWidget {
  const Cartscreen({super.key});

  @override
  State<Cartscreen> createState() => _CartscreenState();
}

class _CartscreenState extends State<Cartscreen> {

  bool timerStarted = false;
  Timer? timer;
   int delay = 5000; // 5 seconds in milliseconds
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      initState: (_){

      },
      builder: (context) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 243, 241, 241),
          appBar: generalAppbar('My Cart',context),
          bottomSheet: Container(
            height: 280,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 15,
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 210, 209, 205),
                    hintText: "Enter Discount Code",
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                    suffixIcon: TextButton(
                      onPressed: () {},
                      child: const Text("Apply",
                          style: TextStyle(
                              color: Color.fromARGB(255, 241, 138, 12),
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ///subtotal
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "subtotal",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "DT ${homeCtr.subtotal.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
                const Divider(),
                const SizedBox(
                  height: 18,
                ),
                ///total
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "total",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "DT ${homeCtr.total.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    homeCtr.checkOut();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 246, 186, 248),
                    minimumSize: const Size(double.infinity, 55),
                  ),
                  child: const Text(
                    "Check out",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

            body: GetBuilder<HomeController>(
              builder: (context) {
                return Container(
                  height: MediaQuery.of(navKey.currentContext!).size.height/2,

                  child: homeCtr.myCart.isEmpty? Center(child: Text('Your Cart is Empty',style: TextStyle(fontSize: 16),)): ListView.separated(
                    padding: const EdgeInsets.all(20),
                    itemBuilder: (context, index) => CartTile(
                      item: homeCtr.myCart[index],
                      onDelete: () async {
                        homeCtr.myCart.removeAt(index); // Remove the item from the list
                        await authCtr.saveCart(homeCtr.myCart);///save cart

                        homeCtr.update();
                      },
                      onRemove: () {
                        if (homeCtr.myCart[index].quantity != 1) {
                          homeCtr.myCart[index].quantity--;
                          homeCtr.updateCartTotals();
                          homeCtr.update();

                          // Set up a timer


                          if (!timerStarted) {
                            timerStarted = true;
                            timer = Timer(Duration(milliseconds: delay), () async {
                              // This function will be called after 5 seconds
                              print('## save cart');
                              await authCtr.saveCart(homeCtr.myCart);///save cart

                              // Perform your action here, like showing a message or resetting the flag
                              timerStarted = false;
                            });
                          } else {
                            // If onRemove is called again within 5 seconds, cancel the previous timer
                            timer?.cancel();
                            print('## pressed before delay completed');

                            timer = Timer(Duration(milliseconds: delay), () async {
                              print('## save cart');
                              await authCtr.saveCart(homeCtr.myCart);///save cart

                              // Reset the flag if the timer is called again
                              timerStarted = false;
                            });
                          }

                        }
                      },
                      onAdd: () {
                        homeCtr.myCart[index].quantity++;
                        homeCtr.updateCartTotals();
                        homeCtr.update();


                        if (!timerStarted) {
                          timerStarted = true;
                          timer = Timer(Duration(milliseconds: delay), () async {
                            // This function will be called after 5 seconds
                            print('## save cart');
                            await authCtr.saveCart(homeCtr.myCart);///save cart

                            // Perform your action here, like showing a message or resetting the flag
                            timerStarted = false;
                          });
                        } else {
                          // If onRemove is called again within 5 seconds, cancel the previous timer
                          timer?.cancel();
                          print('## pressed before delay completed');

                          timer = Timer(Duration(milliseconds: delay), () async {
                            print('## save cart');
                            await authCtr.saveCart(homeCtr.myCart);///save cart

                            // Reset the flag if the timer is called again
                            timerStarted = false;
                          });
                        }
                      },
                    ),
                    separatorBuilder: (context, index) => const SizedBox(height: 20),
                    itemCount: homeCtr.myCart.length,
                  ),
                );
              }
            )

        );
      }
    );
  }
}
