import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

import '../bindings.dart';


class SearchField extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 194, 193, 195),
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: Row(
        children: [
          const Icon(
            Icons.search,
            color: Color.fromARGB(255, 98, 96, 96),
          ),
          const SizedBox(width: 10),
          Flexible(
            flex: 4,
            child: TextField(
              onSubmitted: (text){
                homeCtr.filterBySearch(text);
                print('## submitted search=$text');
              },
              decoration: InputDecoration(
                  hintText: "search...", border: InputBorder.none,

              ),
            ),
          ),
          Container(
            height: 25,
            width: 1.5,
            color: Colors.grey,
          ),
          IconButton(
            onPressed: () {

            },
            icon: const Icon(
              size: 30,
              Icons.camera_alt,
              color: Color.fromARGB(255, 88, 86, 86),
            ),
          )
        ],
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      IconButton(
        onPressed: () {},
        style: IconButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 244, 185, 125),
          padding: const EdgeInsets.all(12),
        ),
        iconSize: 33,
        icon: const Icon(
          Icons.grid_view,
        ),
      ),
      IconButton(
        onPressed: () {},
        style: IconButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 246, 188, 130),
          padding: const EdgeInsets.all(12),
        ),
        iconSize: 33,
        icon: const Icon(
          Icons.notifications,
        ),
      ),
    ],
  );
}
