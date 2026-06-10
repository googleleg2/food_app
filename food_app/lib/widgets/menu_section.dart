import 'package:flutter/material.dart';

import '../models/menu_item.dart';
import 'menu_card.dart';
import '../controllers/cart_controller.dart';

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

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 0.85,
            ),
            itemBuilder: (context, index) {
              return MenuCard(
                item: items[index],
                cartController: cartController,
              );
            },
          ),
        ],
      ),
    );
  }
}
