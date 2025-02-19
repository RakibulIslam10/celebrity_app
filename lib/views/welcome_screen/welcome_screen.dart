import 'package:celebrity/core/utils/text_style.dart';
import 'package:celebrity/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import '../../widgets/welcom_painte.dart';
import '../../core/utils/app_color.dart';
import '../../core/utils/assets.dart';
import '../../core/utils/dimensions.dart';
import '../../core/utils/strings.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _stackWidget(h, w),
            SizedBox(height: h * 0.05),
            _textWidget(),
            SizedBox(height: h * 0.05),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.horizontalSpacingLarge),
              child: CustomButton(
                text: AppStrings.getStarted,
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  _stackWidget(double h, double w) {
    return SizedBox(
      height: h * 0.6,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: h * 0.15,
            left: -10,
            child: CustomPaint(
              size: const Size(400, 100),
              painter: CustomContainerShape(),
            ),
          ),

          // Celebrity Image
          Positioned(
            top: h * 0.1,
            child: Image.asset(
              AppAssets.allu,
              width: w * 0.7,
              fit: BoxFit.cover,
            ),
          ),

          // Welcome Banner
          Positioned(
            top: h * 0.36,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomPaint(
                  size: const Size(280, 220),
                  painter: WelcomPainte(),
                ),
                Transform.rotate(
                  angle: -0.36,
                  child: Text(
                    AppStrings.welcome,
                    style: TextStyle(
                      fontSize: Dimensions.fontSizeLarge * 3,
                      fontWeight: FontWeight.bold,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _textWidget() {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: Dimensions.horizontalSpacingLarge),
      child: Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum porta ipsumLorem",
          textAlign: TextAlign.center,
          style: AppTextStyles.subtitle),
    );
  }
}
