import 'package:flutter/material.dart';

import '../controllers/restaurant_controller.dart';

class StickyCategoryBar extends StatelessWidget {
  final RestaurantController controller;

  const StickyCategoryBar({super.key, required this.controller});

  static const categories = [
    'Specials',
    'Fish',
    'Calamari',
    'Chips & Sides',
    'Burgers',
    'Drinks',
    'Sauces',
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final selected = controller.selectedCategory == index;

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: ChoiceChip(
                  label: Text(categories[index]),
                  selected: selected,
                  onSelected: (_) {
                    controller.scrollToSection(index);
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}
