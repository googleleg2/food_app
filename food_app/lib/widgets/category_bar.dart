import 'package:flutter/material.dart';

class CategoryBar extends StatelessWidget {
  const CategoryBar({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      "Featured",
      "Meals",
      "Platters",
      "Wraps",
      "Sushi",
      "Sides",
      "Drinks",
    ];

    return SizedBox(
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: FilterChip(
              label: Text(categories[index]),
              selected: index == 0,
              onSelected: (_) {},
            ),
          );
        },
      ),
    );
  }
}
