import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartshop/bindings.dart';
import 'package:smartshop/home/home_slider.dart';
import 'package:smartshop/home/homebar.dart';
import 'package:smartshop/homeCtr.dart';
import 'package:smartshop/screeens/category.dart';
import 'package:smartshop/screeens/search_field.dart';
import 'clothCard.dart';

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
      body: GetBuilder<HomeController>(
        builder: (context) {
          return SafeArea(
            child:homeCtr.allClothes.isEmpty? Center(child: CircularProgressIndicator()): SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //
                        // categs in images
                        // load 20 by 20
                        // search item
                        // put in db(maybe)
                         HomeAppBar(),
                        const SizedBox(height: 20),
                         SearchField(),
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
                         Categoryy(),
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
                              onPressed: () {
                                homeCtr.foundClothes = homeCtr.allClothes;
                                homeCtr.update();
                              },
                              child: const Text("see all "),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                      // homeCtr.allClothes.isEmpty ? Center(child: CircularProgressIndicator()):
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    itemCount: (homeCtr.currentPage + 1) * homeCtr.itemsPerPage,
                    itemBuilder: (context, index) {
                      // Check if the current index is within the bounds of foundClothes
                      if (index < homeCtr.foundClothes.length) {
                        return clothCard(homeCtr.foundClothes[index]);
                      } else {
                        // Return an empty container for indices beyond foundClothes length
                        return Container();
                      }
                    },
                  ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                            child: TextButton(
                              onPressed: () {
                                homeCtr.currentPage++;
                                homeCtr.update();
                              },
                              child: const Text("show more"),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                      ])),
            ),
          );
        }
      ),
    );
  }
}
