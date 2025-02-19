import 'package:celebrity/core/utils/app_color.dart';
import 'package:flutter/material.dart';

import '../../core/utils/dimensions.dart';
import '../../core/utils/strings.dart';

class AboutScreen extends StatelessWidget {
   const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(
            horizontal: Dimensions.horizontalSpacingLarge),
        child: ListView(
          children:  [
            Text(
              AppStrings.AboutUs,
              style: TextStyle(
                  fontSize: Dimensions.fontSizeLarge * 1.5,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: Dimensions.verticalSpacingLarge),
              child: const Text(
                  'Lorem ipsum dolor sit amet, elit. Vestibulum porta ipsumLorem Lorem ipsum dolor sit amet, elit. Vestibulum porta ipsumLorem Lorem ipsum dolor sit amet, elit. Vestibulum porta ipsumLorem Lorem ipsum dolor sit amet, elit. Vestibulum porta ipsumLorem Lorem ipsum dolor sit amet, elit. Vestibulum porta ipsumLorem Lorem ipsum dolor sit amet, elit. Vestibulum porta ipsumLorem Lorem ipsum dolor sit amet, elit. Vestibulum porta ipsumLorem Lorem ipsum dolor sit amet, elit. Vestibulum porta ipsumLorem Lorem ipsum dolor sit amet, elit. Vestibulum porta ipsumLorem Lorem ipsum dolor sit amet, elit. Vestibulum porta ipsumLorem Lorem ipsum dolor sit amet, elit. Vestibulum porta ipsumLorem Lorem ipsum dolor sit amet, elit. Vestibulum porta ipsumLorem Lorem ipsum dolor sit amet, elit. Vestibulum porta ipsumLorem Lorem ipsum dolor sit amet, elit. Vestibulum porta ipsumLorem Lorem ipsum dolor sit amet, elit. Vestibulum porta ipsumLorem Lorem ipsum dolor sit amet, elit. Vestibulum porta ipsumLorem Lorem ipsum dolor sit amet, elit. Vestibulum porta ipsumLorem Lorem ipsum dolor sit amet, elit. Vestibulum porta ipsumLorem Lorem ipsum dolor sit amet, elit. Vestibulum porta ipsumLorem '),
            )
          ],
        ),
      ),
    );
  }
}
