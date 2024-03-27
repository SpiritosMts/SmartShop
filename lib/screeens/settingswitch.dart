import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:project11/screeens/forward_button.dart';

class SettingSwitch extends StatelessWidget {
  final String title;
  final Color bgColor;
  final Image image;
  final bool value;

  final Function(bool value) onTap;

  const SettingSwitch(
      {super.key,
      required this.title,
      required this.bgColor,
      required this.image,
      required this.value,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          Container(
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 243, 232, 229)),
            height: 40,
            width: 150,
            child: image,
          ),
          const SizedBox(width: 1),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),

          // ignore: unnecessary_null_comparison
          Text(
            value ? "on" : "off",
            style: TextStyle(
              fontSize: 15,
              color: value
                  ? const Color.fromARGB(255, 241, 172, 245)
                  : Colors.grey,
            ),
          ),
          CupertinoSwitch(
            activeColor:
                const Color.fromARGB(255, 235, 176, 243), // Set the active col
            value: value,
            onChanged: onTap,
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
