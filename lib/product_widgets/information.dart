import 'package:flutter/material.dart';
import 'package:smartshop/bindings.dart';

import '../models/cloth.dart';

class ProductInformation extends StatefulWidget {

  @override
  State<ProductInformation> createState() => _ProductInformationState();
}

class _ProductInformationState extends State<ProductInformation> {
   Cloth product =Cloth();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    product= homeCtr.selectedCloth;

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.name ?? "",
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10,),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "DT ${product.price.toString() ?? 'No price'}",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 20,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 245, 152, 52),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 2,
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.star,
                            size: 20,
                            color: Color.fromARGB(255, 240, 239, 237),
                          ),
                          Text(
                            product.rating.toString() ?? "No rating",
                            style: const TextStyle(
                              color: Color.fromARGB(255, 241, 240, 237),
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 5),
                     Text(
                      "(${homeCtr.selectedCloth.reviews} Reviews)",
                      style: TextStyle(
                        color: Color.fromARGB(255, 164, 161, 163),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
             Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: "Seller: "),
                  TextSpan(
                    text: "${homeCtr.selectedCloth.seller}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
