import 'package:flutter/material.dart';
import 'package:smartshop/screeens/home_slider.dart';
import 'package:smartshop/screeens/homebar.dart';
import 'package:smartshop/screeens/category.dart';
import 'package:smartshop/screeens/product.dart';
import 'package:smartshop/screeens/productcard.dart';
import 'package:smartshop/screeens/search_field.dart';

class Screens extends StatefulWidget {
  const Screens({super.key});

  @override
  State<Screens> createState() => _ScreensState();
}

class _ScreensState extends State<Screens> {
  int currentSlide = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 244, 246),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HomeAppBar(),
                    const SizedBox(height: 20),
                    const SearchField(),
                    const SizedBox(height: 20),
                    Homeslider(
                      onchange: (value) {
                        setState(() {
                          currentSlide = value;
                        });
                      },
                      currentSlide: currentSlide,
                    ),
                    const SizedBox(height: 40),
                    const Categoryy(),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Marhbe bik bahdhena ",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text("see all "),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                        ),
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          return Productcard(product: products[index]);
                        })
                  ])),
        ),
      ),
    );
  }
}
