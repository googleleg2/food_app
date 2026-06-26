import 'dart:math';

import 'package:flutter/material.dart';

import '../controllers/cart_controller.dart';

class CartPanel extends StatelessWidget {
  final CartController cartController;

  const CartPanel({super.key, required this.cartController});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: cartController,
      builder: (context, child) {
        final subtotal = cartController.total;
        final deliveryFee = cartController.items.isEmpty ? 0.0 : 25.0;
        final total = subtotal + deliveryFee;

        if (cartController.items.isEmpty) {
          return Container(
            color: Colors.white,
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 80,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Your cart is empty',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text('Make A Booking', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
          );
        }

        return Container(
          color: Colors.white,
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Your Order',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),

                  TextButton.icon(
                    onPressed: () {
                      cartController.clearCart();
                    },
                    icon: const Icon(Icons.delete_outline),
                    label: const Text('Clear'),
                  ),
                ],
              ),

              const Divider(),

              Expanded(
                child: ListView.builder(
                  itemCount: cartController.items.length,

                  itemBuilder: (context, index) {
                    final cartItem = cartController.items[index];

                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),

                      child: Padding(
                        padding: const EdgeInsets.all(12),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    cartItem.item.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),

                                Text(
                                  'R ${cartItem.total.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 6),

                            Text(
                              'R ${cartItem.item.price.toStringAsFixed(2)} each',
                              style: const TextStyle(color: Colors.grey),
                            ),

                            const SizedBox(height: 12),

                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    cartController.decreaseQuantity(cartItem);
                                  },
                                  icon: const Icon(Icons.remove_circle_outline),
                                ),

                                Text(
                                  cartItem.quantity.toString(),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                IconButton(
                                  onPressed: () {
                                    cartController.increaseQuantity(cartItem);
                                  },
                                  icon: const Icon(Icons.add_circle_outline),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              const Divider(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Subtotal'),

                  Text('R ${subtotal.toStringAsFixed(2)}'),
                ],
              ),

              const SizedBox(height: 8),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Delivery'),

                  Text('R ${deliveryFee.toStringAsFixed(2)}'),
                ],
              ),

              const SizedBox(height: 12),

              const Divider(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  Text(
                    'R ${total.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 55,

                child: FilledButton(
                  onPressed: () async {
                    final DateTime checkoutTime = DateTime.now();

                    // Select booking date
                    final DateTime? bookingDate = await showDatePicker(
                      context: context,
                      initialDate: checkoutTime,
                      firstDate: checkoutTime,
                      lastDate: DateTime(2030),
                    );

                    if (bookingDate == null) return;

                    // Select booking time
                    final TimeOfDay? bookingTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );

                    if (bookingTime == null) return;

                    final ticketNumber =
                        "BK${Random().nextInt(900000) + 100000}";

                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Booking Ticket"),

                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Ticket #: $ticketNumber",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 12),

                              Text(
                                "Checkout Time:\n"
                                "${checkoutTime.day}/${checkoutTime.month}/${checkoutTime.year}"
                                "   ${checkoutTime.hour.toString().padLeft(2, '0')}:${checkoutTime.minute.toString().padLeft(2, '0')}",
                              ),

                              const SizedBox(height: 12),

                              Text(
                                "Booking Date:\n"
                                "${bookingDate.day}/${bookingDate.month}/${bookingDate.year}",
                              ),

                              const SizedBox(height: 12),

                              Text(
                                "Booking Time:\n"
                                "${bookingTime.format(context)}",
                              ),

                              const Divider(),

                              Text(
                                "Order Total: R ${total.toStringAsFixed(2)}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),

                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Close"),
                            ),

                            FilledButton(
                              onPressed: () {
                                Navigator.pop(context);

                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "Booking successfully created.",
                                    ),
                                  ),
                                );

                                // Optional:
                                // cartController.clearCart();
                              },
                              child: const Text("Confirm Booking"),
                            ),
                          ],
                        );
                      },
                    );
                  },

                  child: Text('Checkout • R ${total.toStringAsFixed(2)}'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
