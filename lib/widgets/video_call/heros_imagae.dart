import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/utils/assets.dart';
import '../../core/utils/dimensions.dart';

class HerosImagae extends StatelessWidget {
  final List<String> roles = [
    "Hero",
    "Heroine",
    "Comedian",
    "Singer",
    "Director",
    "Dancer"
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: roles.map((role) {
          return Padding(
              padding:  EdgeInsets.symmetric(
                  horizontal: 4.0, vertical: Dimensions.verticalSpacingLarge),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(AppAssets.profilePicture),
                  ),
                  Text('Heroine')
                ],
              ));
        }).toList(),
      ),
    );
  }
}
