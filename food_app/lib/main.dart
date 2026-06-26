import 'package:flutter/material.dart';
import 'screens/restaurant_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hair_Do?',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.orange),
      home: const RestaurantScreen(),
    );
  }
}
