import 'package:celebrity/core/utils/app_color.dart';
import 'package:celebrity/core/utils/sized.dart';
import 'package:celebrity/widgets/custom_button.dart';
import 'package:celebrity/widgets/payment_selection/payment_selection_widget.dart';
import 'package:flutter/material.dart';

import '../../core/utils/dimensions.dart';
import '../../core/utils/strings.dart';
import '../../core/utils/text_style.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: AppColors.whiteColor,
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: Dimensions.horizontalSpacingLarge),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _textWidget(),
            verticalSpace(Dimensions.heightSize * 2),
            const PaymentSelection(),
            verticalSpace(Dimensions.verticalSpacingLarge * 2),
            CustomButton(
              amount: " \$599",
              text: AppStrings.payment,
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/congratulation');
              },
            )
          ],
        ),
      ),
    );
  }

  _textWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.select,
          style: AppTextStyles.headline1.copyWith(
            fontSize: Dimensions.fontSizeLargeSmall * 1.8,
            color: AppColors.primaryTextColor,
          ),
        ),
        Text(
          AppStrings.yourPayment,
          style: AppTextStyles.headline1.copyWith(
            fontSize: Dimensions.fontSizeLargeSmall * 1.8,
            color: AppColors.primaryTextColor,
          ),
        )
      ],
    );
  }
}
