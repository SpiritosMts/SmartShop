import 'package:flutter/material.dart';
import 'package:smartshop/screeens/catergories.dart';

class Categoryy extends StatelessWidget {
  const Categoryy({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color.fromARGB(255, 234, 214, 241),
                  image: DecorationImage(
                      image: AssetImage(categories[index].image)),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                categories[index].title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          width: 20,
        ),
        itemCount: categories.length,
      ),
    );
  }
}
