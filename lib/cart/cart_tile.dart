import 'package:flutter/material.dart';

import '../models/cloth.dart';

class CartTile extends StatelessWidget {
  final Cloth item;
  final Function() onRemove;
  final Function() onDelete;
  final Function() onAdd;
  const CartTile(
      {super.key,
      required this.item,
      required this.onRemove,
      required this.onDelete,
      required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 227, 224, 224),
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Container(
                height: 85,
                width: 85,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 207, 207, 205),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(10),
                child: Image.network(
                  item.images[0],
                ),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width/2.3,
                    child: Text(
                      item.name,
                      maxLines: 1, // Set maximum number of lines to 1
                      overflow: TextOverflow.ellipsis, // Render ellipsis if text overflows
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    item.term,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "DT ${item.price}",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 5,
          right: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                onPressed:onDelete,
                icon: const Icon(
                  Icons.delete,
                  color: Color.fromARGB(255, 206, 170, 203),
                  size: 28,
                ),
              ),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 212, 193, 212),
                  border: Border.all(
                    color: Colors.grey.shade200,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: onRemove,
                      iconSize: 18,
                      icon: const Icon(
                        Icons.remove,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      item.quantity.toString(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: onAdd,
                      iconSize: 18,
                      icon: const Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
