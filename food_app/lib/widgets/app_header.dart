import 'package:flutter/material.dart';
import 'package:food_app/controllers/cart_controller.dart';

class AppHeader extends StatelessWidget {
  final CartController cartController;

  const AppHeader({super.key, required this.cartController});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final isMobile = width < 700;
    final isTablet = width >= 700 && width < 1100;
    final isDesktop = width >= 1100;

    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 30 : 16,
        vertical: 12,
      ),
      child: isMobile
          ? _buildMobileHeader(context)
          : _buildDesktopHeader(
              context,
              isDesktop: isDesktop,
              isTablet: isTablet,
            ),
    );
  }

  Widget _buildDesktopHeader(
    BuildContext context, {
    required bool isDesktop,
    required bool isTablet,
  }) {
    return Row(
      children: [
        Image.asset("assets/logo.png", height: isDesktop ? 60 : 50),

        const SizedBox(width: 12),

        Text(
          "_Nomaswazi_",
          style: TextStyle(
            fontSize: isDesktop ? 24 : 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        const Spacer(),

        SizedBox(
          width: isDesktop ? 380 : 250,
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search Hairstyles",
              prefixIcon: const Icon(Icons.search),
              isDense: true,
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

        _buildCartIcon(),
      ],
    );
  }

  Widget _buildMobileHeader(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset("assets/logo.png", height: 45),

            const SizedBox(width: 10),

            const Expanded(
              child: Text(
                "_Nomaswazi_",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
            ),

            _buildCartIcon(),
          ],
        ),

        const SizedBox(height: 12),

        TextField(
          decoration: InputDecoration(
            hintText: "Search Hairstyles",
            prefixIcon: const Icon(Icons.search),
            isDense: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ],
    );
  }

  Widget _buildCartIcon() {
    return AnimatedBuilder(
      animation: cartController,
      builder: (context, child) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            IconButton(icon: const Icon(Icons.shopping_cart), onPressed: () {}),
            if (cartController.itemCount > 0)
              Positioned(
                right: -2,
                top: -2,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    cartController.itemCount.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 11),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
