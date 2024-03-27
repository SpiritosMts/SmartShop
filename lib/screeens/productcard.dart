import 'package:flutter/material.dart';

import 'package:smartshop/screeens/product.dart';
import 'package:smartshop/screeens/product_screens.dart';

class Productcard extends StatelessWidget {
  final Product product;

  const Productcard({
    super.key,
    required this.product,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Productscreens(product: product),
          ),
        );
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
              CircleAvatar(
                backgroundImage: AssetImage(product.image),
                radius: 60,
              ),
              Text(
                product.title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "DT${product.price}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14),
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
}
