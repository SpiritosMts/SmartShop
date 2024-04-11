import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:smartshop/bindings.dart';
import 'package:smartshop/homeCtr.dart';
import 'package:smartshop/models/cloth.dart';

import '../generalWidgets.dart';
import '../home/clothCard.dart';

class Categoryy extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (context) {
        return SizedBox(
          height: 90,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: categs.length,

            itemBuilder: (context, index) {
             Cloth firstItem = findFirstItem(categs[index]);

              return GestureDetector(
                onTap: (){
                 homeCtr.filterByCateg(categs[index]);
                 Fluttertoast.showToast(
                   msg: "${categs[index]} Loaded",
                   toastLength: Toast.LENGTH_SHORT,
                   gravity: ToastGravity.CENTER,
                   timeInSecForIosWeb: 1,
                   backgroundColor: Colors.black45,
                   textColor: Colors.white,
                   fontSize: 16.0,
                 );
                },
                child: Column(
                  children: [
                    buildCircleAvatar(firstItem.images[0],30.0),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      categs[index],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              width: 20,
            ),
          ),
        );
      }
    );
  }
}
