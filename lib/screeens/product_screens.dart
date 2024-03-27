import 'package:flutter/material.dart';
import 'package:smartshop/product_widgets/addtocart.dart';
import 'package:smartshop/product_widgets/appbar.dart';
import 'package:smartshop/product_widgets/description.dart';
import 'package:smartshop/product_widgets/image_slider.dart';
import 'package:smartshop/product_widgets/information.dart';
import 'package:smartshop/screeens/product.dart';

class Productscreens extends StatefulWidget {
  final Product? product;
  const Productscreens({super.key, this.product});

  @override
  State<Productscreens> createState() => _ProductScreensState();
}

class _ProductScreensState extends State<Productscreens> {
  int currentImage = 0;
  int currentColor = 0;
  int currentNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 192, 190, 188),
        floatingActionButton: AddToCart(
          currentNumber: currentNumber,
          onAdd: () {
            setState(() {
              currentNumber++;
            });
          },
          onRemove: () {
            if (currentNumber != 1) {
              setState(() {
                currentNumber--;
              });
            }
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Productappbar(),
                Imageslider(
                  onChange: (index) => {
                    setState(() {
                      currentImage = index;
                    })
                  },
                  currentImage: currentImage,
                  image: widget.product!.image,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    5,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: currentImage == index ? 15 : 8,
                      height: 8,
                      margin: const EdgeInsets.only(right: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.black,
                        ),
                        color: currentImage == index
                            ? Colors.black
                            : Colors.transparent,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                    color: Color.fromARGB(255, 250, 249, 247),
                  ),
                  padding: const EdgeInsets.only(
                      left: 20, top: 20, right: 20, bottom: 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductInformation(product: widget.product),
                      const SizedBox(height: 20),
                      const Text(
                        "Colors",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: List.generate(
                          widget.product!.colors.length,
                          (index) => GestureDetector(
                            onTap: () {
                              setState(() {
                                currentColor = index;
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: currentColor == index
                                    ? Colors.white
                                    : widget.product!.colors[index],
                                border: currentColor == index
                                    ? Border.all(
                                        color: widget.product!.colors[index],
                                      )
                                    : null,
                              ),
                              padding: currentColor == index
                                  ? const EdgeInsets.all(2)
                                  : null,
                              margin: const EdgeInsets.only(right: 15),
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: widget.product!.colors[index],
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ProductDescription(text: widget.product!.description),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
