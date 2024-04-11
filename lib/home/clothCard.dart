
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartshop/main.dart';

import '../bindings.dart';
import '../models/cloth.dart';
import '../product_widgets/product_screens.dart';
import 'package:shimmer/shimmer.dart';

Widget buildCircleAvatar(String imageUrl,double radius) {
  return CircleAvatar(
    radius: radius,
    backgroundColor: Colors.transparent,
    backgroundImage: imageUrl != null
        ? NetworkImage(imageUrl)
        : null, // Set backgroundImage to null if imageUrl is null
    child: imageUrl == null
        ? Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white, // Background color of the shimmer
      ),
    )
        : null, // No child if image is being loaded
  );
}
clothCard(Cloth product) {
  return GestureDetector(
    onTap: () {
      homeCtr.selectCloth(product);
      Get.to(() => ProductInfo());
    },
    child: Stack(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 222, 219, 222),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(children: [
            SizedBox(height: 5),

            buildCircleAvatar(product.images[0],57),
SizedBox(height: 5),
            SizedBox(
              //width: 50,
              width: MediaQuery.of(navKey.currentContext!).size.width/3,
              child: Text(
                product.name,
                maxLines: 1, // Set maximum number of lines to 1
                overflow: TextOverflow.ellipsis, // Render ellipsis if text overflows
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),

              ),
            ),
            SizedBox(height: 5),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "DT ${product.price}",
                  style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14,color: Colors.black45),
                ),
                Row(
                  children: List.generate(
                    product.colors.length,
                        (cindex) => Container(
                      height: 10,
                      width: 10,
                      margin: const EdgeInsets.only(right: 2),
                      decoration: BoxDecoration(
                        color: product.colors[cindex],
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ]),
        ),
        Positioned.fill(
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 252, 128, 5),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(10),
                    )),
                child: const Icon(
                  Icons.star_border_outlined,
                  color: Color.fromARGB(255, 199, 198, 198),
                  size: 25,
                ),
              ),
            ))
      ],
    ),
  );
}
