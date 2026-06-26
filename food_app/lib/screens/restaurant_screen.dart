import 'package:flutter/material.dart';
import 'package:food_app/controllers/cart_controller.dart';
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
  final CartController cartController = CartController();

  @override
  void initState() {
    super.initState();

    controller.scrollController.addListener(controller.handleScroll);
  }

  @override
  void dispose() {
    controller.scrollController.removeListener(controller.handleScroll);

    controller.disposeController();

    cartController.dispose();

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
                SliverToBoxAdapter(
                  child: AppHeader(cartController: cartController),
                ),

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
                        title: 'Braids',
                        sectionKey: controller.specialsKey,
                        items: specialsItems,
                        cartController: cartController,
                      ),

                      MenuSection(
                        title: 'Straight Back',
                        sectionKey: controller.fishKey,
                        items: fishItems,
                        cartController: cartController,
                      ),

                      MenuSection(
                        title: 'Straight Up',
                        sectionKey: controller.calamariKey,
                        items: calamariItems,
                        cartController: cartController,
                      ),

                      MenuSection(
                        title: 'Sweet And Sour',
                        sectionKey: controller.chipsKey,
                        items: sideItems,
                        cartController: cartController,
                      ),

                      MenuSection(
                        title: 'Wig Installations',
                        sectionKey: controller.burgersKey,
                        items: burgerItems,
                        cartController: cartController,
                      ),

                      MenuSection(
                        title: 'Braids 2',
                        sectionKey: controller.drinksKey,
                        items: drinkItems,
                        cartController: cartController,
                      ),

                      MenuSection(
                        title: 'Straight Up 2',
                        sectionKey: controller.saucesKey,
                        items: sauceItems,
                        cartController: cartController,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          if (desktop)
            SizedBox(
              width: 380,
              child: CartPanel(cartController: cartController),
            ),
        ],
      ),
    );
  }
}
