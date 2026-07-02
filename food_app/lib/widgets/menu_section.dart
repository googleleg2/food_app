import 'package:flutter/material.dart';

import '../controllers/cart_controller.dart';
import '../models/menu_item.dart';
import 'menu_card.dart';

class MenuSection extends StatelessWidget {
  final String title;
  final GlobalKey sectionKey;
  final List<MenuItem> items;
  final CartController cartController;

  const MenuSection({
    super.key,
    required this.title,
    required this.sectionKey,
    required this.items,
    required this.cartController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      key: sectionKey,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 20),

          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount;

              final width = constraints.maxWidth;

              if (width < 600) {
                // Phones
                crossAxisCount = 1;
              } else if (width < 900) {
                // Small tablets / landscape phones
                crossAxisCount = 2;
              } else if (width < 1300) {
                // Tablets / laptops
                crossAxisCount = 3;
              } else if (width < 1700) {
                // Desktop
                crossAxisCount = 4;
              } else {
                // Ultra-wide monitors
                crossAxisCount = 5;
              }

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: items.length,

                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.72,
                ),

                itemBuilder: (context, index) {
                  return MenuCard(
                    item: items[index],
                    cartController: cartController,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
