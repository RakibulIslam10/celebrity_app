import 'package:celebrity/core/utils/sized.dart';
import 'package:celebrity/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../core/utils/app_color.dart';
import '../../core/utils/assets.dart';
import '../../core/utils/dimensions.dart';
import '../../core/utils/strings.dart';
import '../../core/utils/text_style.dart';

class FanCardScreen extends StatelessWidget {
  const FanCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: Dimensions.horizontalSpacingLarge),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpace(Dimensions.heightSize * 7),
            Center(
              child: Image.asset(
                AppAssets.fanCard,
                height: h * 0.3,
              ),
            ),
            _textWidget(h),
            _buttonWidget(context)
          ],
        ),
      ),
    );
  }

  _buttonWidget(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          text: AppStrings.buyNow,
          onPressed: () {
            Navigator.pushNamed(context, '/fanCardPreview');
          },
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: Dimensions.verticalSpacingLarge * 0.8),
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/navigation',
                  (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: AppColors.primaryColor),
                  borderRadius:
                      BorderRadius.circular(Dimensions.radius), // Rounded edges
                ),
              ),
              child: Ink(
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(Dimensions.radius),
                ),
                child: Container(
                  alignment: Alignment.center,
                  child: const Text(
                    AppStrings.skip,
                    style: TextStyle(
                      color: AppColors.primaryTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _textWidget(double h) {
    return Column(
      children: [
        SizedBox(
          height: h * 0.05,
        ),
        Text(
          textAlign: TextAlign.center,
          AppStrings.FanCards,
          style: AppTextStyles.headline1.copyWith(
            fontSize: Dimensions.fontSizeLarge * 1.5,
            color: AppColors.primaryTextColor,
          ),
        ),
        Text(
            textAlign: TextAlign.center,
            AppStrings.des,
            style: TextStyle(
                fontSize: Dimensions.fontSizeLarge * 0.8,
                color: AppColors.primaryTextColor,
                fontWeight: FontWeight.normal)),
        Padding(
          padding:
              EdgeInsets.symmetric(vertical: Dimensions.verticalSpacingLarge),
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              Text(
                textAlign: TextAlign.center,
                AppStrings.startForom,
                style: AppTextStyles.title.copyWith(
                  
                  color: AppColors.primaryTextColor,
                ),
              ),
              Text(
                textAlign: TextAlign.center,
                ' 59/-',
                style: AppTextStyles.headline1.copyWith(
                  fontSize: Dimensions.fontSizeLarge,
                  color: AppColors.primaryColor,
                ),
              ),
              Center(
                child: Text(
                  textAlign: TextAlign.center,
                  AppStrings.termsANd,
                  style: AppTextStyles.title.copyWith(
                    fontSize: Dimensions.fontSizeLarge * 0.8,
                    color: AppColors.primaryTextColor,
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

buildFanIDCard() {
  return Container(
    padding: EdgeInsets.all(Dimensions.paddingSmall),
    decoration: BoxDecoration(
      color: Colors.white, // Or a light color of your choice
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.grey[300]!), // Light grey border
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: const Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center, // Center the text
      children: [
        Text(
          'Vijay',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24, // Slightly larger font size
          ),
        ),
        Text(
          'Devarakonda',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24, // Slightly larger font size
          ),
        ),
        SizedBox(height: 8), // Add some spacing
        Text(
          'Admirer',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 16), // Add more spacing
        Text(
          'Fan ID: CLXXXXXX',
          style: TextStyle(fontSize: 14),
        ),
        SizedBox(height: 8), // Add some spacing

        Text(
          'Valid: X0000XX to XXXXXXXX',
          style: TextStyle(fontSize: 14),
        ),
      ],
    ),
  );
}
