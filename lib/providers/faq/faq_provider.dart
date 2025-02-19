import 'package:flutter/cupertino.dart';
  
class FAQProvider extends ChangeNotifier {
  final Map<int, bool> _expandedItems = {};

  bool isExpanded(int index) => _expandedItems[index] ?? false;

  void toggleExpansion(int index) {
    _expandedItems[index] = !isExpanded(index);
    notifyListeners();
  }
}
