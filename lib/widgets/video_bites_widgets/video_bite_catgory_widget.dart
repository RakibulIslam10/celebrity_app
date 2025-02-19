import 'package:flutter/material.dart';

import '../../core/utils/assets.dart';
import '../../core/utils/dimensions.dart';

class CustomProfileCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;
  final VoidCallback onTap;

  const CustomProfileCard({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 200,
        margin: EdgeInsets.only(
          top: 20,
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 130,
              height: 140,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppAssets.recta),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    price,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: -20,
              right: -20,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(
                      Dimensions.radius * 3,
                    ),
                    topLeft: Radius.circular(
                      Dimensions.radius * 3,
                    ),
                    topRight: Radius.circular(
                      Dimensions.radius * 3,
                    )),
                child: Image.asset(
                  imageUrl,
                  width: 110,
                  height: 95,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 5,
              child: Icon(Icons.arrow_forward, color: Colors.white, size: 20),
            ),
          ],
        ),
      ),
    );
  }
}
