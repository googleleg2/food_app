import 'package:flutter/material.dart';

import '../models/menu_item.dart';

class MenuCard extends StatelessWidget {
  final MenuItem item;

  const MenuCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              child: Image.asset(
                item.image,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Text(
                  item.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),

                Text(item.description),

                const SizedBox(height: 8),

                Text(
                  "R ${item.price}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                FilledButton(onPressed: () {}, child: const Text("Add")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
