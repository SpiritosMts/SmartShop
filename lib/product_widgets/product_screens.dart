import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartshop/bindings.dart';
import 'package:smartshop/homeCtr.dart';
import 'package:smartshop/product_widgets/addtocartBtn.dart';
import 'package:smartshop/product_widgets/appbar.dart';
import 'package:smartshop/product_widgets/description.dart';
import 'package:smartshop/product_widgets/image_slider.dart';
import 'package:smartshop/product_widgets/information.dart';

import '../models/cloth.dart';

class ProductInfo extends StatefulWidget {

  @override
  State<ProductInfo> createState() => _ProductScreensState();
}

class _ProductScreensState extends State<ProductInfo> {
  int currentImage = 0;
  int currentColor = 0;
  int currentNumber = 1;


  Cloth cl = Cloth();
  @override
  void initState() {
    super.initState();
    cl = homeCtr.selectedCloth;
  }

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
        body: GetBuilder<HomeController>(
          builder: (context) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Productappbar(),///
                    ImageSlider(
                      onChange: (index) => {
                        setState(()
                          {currentImage = index;}
                    )

                      },
                      currentImage: currentImage,
                      imageUrls: cl.images,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        cl.images.length,
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
                          ProductInformation(),
                          const SizedBox(height: 20),
                          const Text(
                            "Colors",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: List.generate(
                              cl.colors.length,
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
                                        : cl.colors[index],
                                    border: currentColor == index
                                        ? Border.all(
                                            color: cl.colors[index],
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
                                      color: cl.colors[index],
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          ProductDescription(text: cl.description),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        ));
  }
}
