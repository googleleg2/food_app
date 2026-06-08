import 'package:flutter/material.dart';

class CartPanel extends StatelessWidget {
  const CartPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          const Text(
            "Your Order",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),

          const Divider(),

          const Spacer(),

          FilledButton(
            style: FilledButton.styleFrom(
              minimumSize: const Size(double.infinity, 60),
            ),
            onPressed: () {},
            child: const Text("Checkout"),
          ),
        ],
      ),
    );
  }
}
