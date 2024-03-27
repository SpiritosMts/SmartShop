import 'package:flutter/material.dart';

class Forwardbutton extends StatelessWidget {
  final Function() onTap;
  const Forwardbutton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 45,
        padding: const EdgeInsets.only(right: 9),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 239, 233, 239),
        ),
        child: IconButton(
          onPressed: () {},
          style: IconButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 206, 204, 206)),
          padding: const EdgeInsets.all(10),
          icon: const Icon(
            Icons.chevron_right_outlined,
            color: Color.fromARGB(255, 14, 13, 14),
            size: 22,
          ),
        ),
      ),
    );
  }
}
