import 'package:flutter/material.dart';

class MainProfile with ChangeNotifier {
  bool _isNotificationEnabled = true;

  bool get isNotificationEnabled => _isNotificationEnabled;

  void toggleNotification() {
    _isNotificationEnabled = !_isNotificationEnabled;
    notifyListeners(); // Notify widgets that are listening for updates.
  }
}