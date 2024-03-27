import 'package:flutter/material.dart';
import 'package:smartshop/screeens/cart_screen.dart';
//import 'package:project11/screeens/main_screen.dart';

class AddToCart extends StatelessWidget {
  final Function() onAdd;
  final Function() onRemove;
  final int currentNumber;

  const AddToCart({
    super.key,
    required this.currentNumber,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 65,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: const Color.fromARGB(210, 240, 128, 30),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 233, 165, 242),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: onRemove,
                    iconSize: 19,
                    icon: const Icon(
                      Icons.remove,
                      color: Color.fromARGB(255, 19, 19, 19),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    currentNumber.toString(),
                    style:
                        const TextStyle(color: Color.fromARGB(255, 13, 13, 13)),
                  ),
                  const SizedBox(width: 5),
                  IconButton(
                    onPressed: onAdd,
                    iconSize: 19,
                    icon: const Icon(
                      Icons.add,
                      color: Color.fromARGB(255, 21, 21, 21),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60),
                ),
                backgroundColor: const Color.fromARGB(255, 230, 178, 245),
              ),
              // Removed conflicting onPressed property
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Cartscreen()),
              ),
              child: const Text(
                "Add to Cart",
                style: TextStyle(
                  color: Color.fromARGB(255, 24, 24, 24),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
