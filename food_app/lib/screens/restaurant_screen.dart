import 'package:flutter/material.dart';
import 'package:food_app/data/menu_data.dart';

import '../controllers/restaurant_controller.dart';
import '../widgets/app_header.dart';
import '../widgets/cart_panel.dart';
import '../widgets/category_header_delegate.dart';
import '../widgets/menu_section.dart';
import '../widgets/promo_banner.dart';
import '../widgets/sticky_category_bar.dart';

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({super.key});

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  final RestaurantController controller = RestaurantController();

  @override
  void initState() {
    super.initState();

    controller.scrollController.addListener(controller.handleScroll);
  }

  @override
  void dispose() {
    controller.scrollController.removeListener(controller.handleScroll);

    controller.disposeController();

    super.dispose();
  }

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
              controller: controller.scrollController,

              slivers: [
                const SliverToBoxAdapter(child: AppHeader()),

                const SliverToBoxAdapter(child: PromoBanner()),

                SliverPersistentHeader(
                  pinned: true,
                  delegate: CategoryHeaderDelegate(
                    StickyCategoryBar(controller: controller),
                  ),
                ),

                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      MenuSection(
                        title: 'Specials',
                        sectionKey: controller.specialsKey,
                        items: specialsItems,
                      ),

                      MenuSection(
                        title: 'Fish',
                        sectionKey: controller.fishKey,
                        items: fishItems,
                      ),

                      MenuSection(
                        title: 'Calamari',
                        sectionKey: controller.calamariKey,
                        items: calamariItems,
                      ),

                      MenuSection(
                        title: 'Chips & Sides',
                        sectionKey: controller.chipsKey,
                        items: sideItems,
                      ),

                      MenuSection(
                        title: 'Burgers',
                        sectionKey: controller.burgersKey,
                        items: burgerItems,
                      ),

                      MenuSection(
                        title: 'Drinks',
                        sectionKey: controller.drinksKey,
                        items: drinkItems,
                      ),

                      MenuSection(
                        title: 'Sauces',
                        sectionKey: controller.saucesKey,
                        items: sauceItems,
                      ),
                    ],
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
