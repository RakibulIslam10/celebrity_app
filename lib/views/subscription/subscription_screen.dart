import 'package:celebrity/core/utils/sized.dart';
import 'package:celebrity/widgets/subscription_widget.dart';
import 'package:flutter/material.dart';
import '../../core/utils/app_color.dart';
import '../../core/utils/dimensions.dart';
import '../../core/utils/strings.dart';
import '../../core/utils/text_style.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: Dimensions.horizontalSpacingLarge),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _textWidget(),
            verticalSpace(
              Dimensions.heightSize,
            ),
            const SubscriptionWidget(),
          ],
        ),
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
            AppStrings.subscription,
            style: AppTextStyles.headline1.copyWith(
              fontSize: Dimensions.fontSizeLargeSmall * 2,
              color: AppColors.primaryTextColor,
            ),
          ),
          Text(
            AppStrings.plan,
            style: AppTextStyles.headline1.copyWith(
              fontSize: Dimensions.fontSizeLargeSmall * 1.8,
              color: AppColors.primaryTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
