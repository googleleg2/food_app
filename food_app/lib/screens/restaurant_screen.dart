import 'package:flutter/material.dart';

import '../widgets/app_header.dart';
import '../widgets/cart_panel.dart';
import '../widgets/category_bar.dart';
import '../widgets/menu_card.dart';
import '../widgets/promo_banner.dart';
import '../data/menu_data.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final desktop = width > 1100;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      body: Row(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(child: AppHeader()),

                const SliverToBoxAdapter(child: PromoBanner()),

                const SliverToBoxAdapter(child: CategoryBar()),

                SliverPadding(
                  padding: const EdgeInsets.all(20),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return MenuCard(item: menuItems[index]);
                    }, childCount: menuItems.length),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          childAspectRatio: 0.85,
                        ),
                  ),
                ),
              ],
            ),
          ),

          if (desktop) const SizedBox(width: 380, child: CartPanel()),
        ],
      ),
    );
  }
}
