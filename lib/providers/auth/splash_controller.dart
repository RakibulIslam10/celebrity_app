import 'package:flutter/material.dart';
import 'dart:async';

class SplashProvider extends ChangeNotifier {
  final BuildContext context;

  SplashProvider(this.context) {
    _navigateToLogin();
  }

  void _navigateToLogin() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/navigation');
    });
  }
}
