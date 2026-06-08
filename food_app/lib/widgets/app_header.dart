import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          const FlutterLogo(size: 40),

          const SizedBox(width: 16),

          const Text(
            "Fish Restaurant",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),

          const Spacer(),

          SizedBox(
            width: 350,
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search meals",
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
            label: const Text("Delivery"),
          ),
        ],
      ),
    );
  }
}
