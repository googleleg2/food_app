import 'package:flutter/material.dart';
import 'package:food_app/controllers/cart_controller.dart';

class AppHeader extends StatelessWidget {
  final CartController cartController;
  const AppHeader({super.key, required this.cartController});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          // const FlutterLogo(size: 40),
          Image.asset("assets/logo.png"),

          const SizedBox(width: 16),

          const Text(
            "_Nomaswazi_",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),

          const Spacer(),

          SizedBox(
            width: 350,
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search Hairstyles",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),

          const SizedBox(width: 20),

          FilledButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.location_on),
            label: const Text("_Home_"),
          ),
          const SizedBox(width: 12),

          AnimatedBuilder(
            animation: cartController,
            builder: (context, child) {
              return Stack(
                clipBehavior: Clip.none,
                children: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () {},
                  ),

                  if (cartController.itemCount > 0)
                    Positioned(
                      right: -2,
                      top: -2,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          cartController.itemCount.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
