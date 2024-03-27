// ignore: file_names
import 'package:flutter/material.dart';
import 'package:smartshop/screeens/forward_button.dart';

class SettingItem extends StatelessWidget {
  final String title;
  final Color bgColor;
  final Image image;

  final Function() onTap;
  final String value;
  const SettingItem({
    super.key,
    required this.title,
    required this.bgColor,
    required this.onTap,
    required this.value,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          Container(
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 241, 238, 236)),
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
          value != null
              ? Text(
                  value,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                )
              : const SizedBox(width: 55),
          Forwardbutton(
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}
