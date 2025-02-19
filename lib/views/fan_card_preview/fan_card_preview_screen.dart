import 'package:celebrity/core/utils/sized.dart';
import 'package:celebrity/widgets/fan_card.dart';
import 'package:flutter/material.dart';
import '../../core/utils/app_color.dart';
import '../../core/utils/dimensions.dart';
import '../../core/utils/strings.dart';
import '../../core/utils/text_style.dart';
import '../../widgets/custom_button.dart';

class FanCardPreviewScreen extends StatelessWidget {
  const FanCardPreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        automaticallyImplyLeading: true,
      ),
      body: ListView(
        children: [
          _textWidget(),
          const FanCard(),
          const FanCard(),
          _buttonWidget(context)
        ],
      ),
    );
  }

  _textWidget() {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: Dimensions.horizontalSpacingLarge),
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          Text(
            AppStrings.fancard,
            style: AppTextStyles.headline1.copyWith(
              fontSize: Dimensions.fontSizeLargeSmall * 2,
              color: AppColors.primaryTextColor,
            ),
          ),
          Text(
            AppStrings.Preview,
            style: AppTextStyles.headline1.copyWith(
              fontSize: Dimensions.fontSizeLargeSmall * 1.8,
              color: AppColors.primaryTextColor,
            ),
          ),
        ],
      ),
    );
  }

  _buttonWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.horizontalSpacingLarge,
          vertical: Dimensions.verticalSpacingLarge * 0.8),
      child: Column(
        children: [
          CustomButton(
            text: AppStrings.Continue,
            onPressed: () {
              Navigator.pushNamed(context, '/subscription');
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: Dimensions.verticalSpacingLarge * 0.8),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: AppColors.primaryColor),
                    borderRadius: BorderRadius.circular(Dimensions.radius),
                  ),
                ),
                child: Ink(
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(Dimensions.radius),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      AppStrings.skip,
                      style: TextStyle(
                        color: AppColors.primaryTextColor,
                        fontSize: Dimensions.fontSizeLarge * 0.8,
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
    );
  }
}
