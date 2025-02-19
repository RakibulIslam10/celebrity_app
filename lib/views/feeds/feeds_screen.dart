// profile_screen.dart
import 'package:celebrity/core/utils/assets.dart';
import 'package:flutter/material.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              AppAssets.bgg,
              fit: BoxFit.cover,
              width: double.maxFinite,
            ),       Image.asset(
              AppAssets.soon,

              fit: BoxFit.cover,
              width: double.maxFinite,
            ),
          ],
        ),
      ),
    );
  }
}
