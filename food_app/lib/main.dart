import 'package:flutter/material.dart';
import 'screens/restaurant_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fish Restaurant',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.orange),
      home: const RestaurantScreen(),
    );
  }
}
