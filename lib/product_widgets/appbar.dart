import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Productappbar extends StatelessWidget {
  const Productappbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15),
        child: Row(children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: IconButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 250, 250, 249),
              padding: const EdgeInsets.all(15),
            ),
            icon: const Icon(Icons.chevron_left_outlined),
          ),
          const Spacer(),
          const SizedBox(width: 5),
          IconButton(
            onPressed: () {},
            style: IconButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 238, 238, 235),
              padding: const EdgeInsets.all(15),
            ),
            icon: const Icon(
              FontAwesomeIcons.heart,
            ),
          ),
        ]));
  }
}
