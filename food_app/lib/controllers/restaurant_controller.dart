import 'package:flutter/material.dart';

class RestaurantController extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();

  int selectedCategory = 0;

  final specialsKey = GlobalKey();
  final fishKey = GlobalKey();
  final calamariKey = GlobalKey();
  final chipsKey = GlobalKey();
  final burgersKey = GlobalKey();
  final drinksKey = GlobalKey();
  final saucesKey = GlobalKey();

  List<GlobalKey> get keys => [
    specialsKey,
    fishKey,
    calamariKey,
    chipsKey,
    burgersKey,
    drinksKey,
    saucesKey,
  ];

  void setSelectedCategory(int index) {
    if (selectedCategory == index) return;

    selectedCategory = index;
    notifyListeners();
  }

  void scrollToSection(int index) {
    final key = keys[index];

    if (key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void handleScroll() {
    for (int i = 0; i < keys.length; i++) {
      final context = keys[i].currentContext;

      if (context == null) continue;

      final box = context.findRenderObject() as RenderBox;

      final position = box.localToGlobal(Offset.zero);

      if (position.dy < 250 && position.dy > -300) {
        setSelectedCategory(i);
        break;
      }
    }
  }

  void disposeController() {
    scrollController.dispose();
  }
}
