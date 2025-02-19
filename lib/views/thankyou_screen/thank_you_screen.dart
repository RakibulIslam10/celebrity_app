import 'package:celebrity/core/utils/assets.dart';
import 'package:celebrity/core/utils/strings.dart';
import 'package:celebrity/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../core/utils/app_color.dart';
import '../../core/utils/dimensions.dart';

class ThankYouScreen extends StatelessWidget {
  const ThankYouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(AppAssets.thank,),
                Image.asset(AppAssets.thankYou,),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              AppStrings.yourVideos,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black45,fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            const Text(
              'INR 199/-',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.pink,
              ),
            ),
            const SizedBox(height: 20),
          CustomButton(text: AppStrings.buyNow, onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/videoBitesPaymentScreen',
                  (route) => false,
            );
          },),
            const SizedBox(height: 10),
            const Text(
              AppStrings.pleaseNote,
              style: TextStyle(fontSize: 12, color: Colors.red),
            ),
            const SizedBox(height: 20),
            Padding(
              padding:  EdgeInsets.symmetric(
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
                      borderRadius: BorderRadius.circular(
                          Dimensions.radius),
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
                        AppStrings.home,
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
        ),
      ),
    );
  }
}
