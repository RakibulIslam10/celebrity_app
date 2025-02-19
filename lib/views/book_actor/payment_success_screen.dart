import 'package:celebrity/core/utils/app_color.dart';
import 'package:celebrity/core/utils/assets.dart';
import 'package:celebrity/core/utils/dimensions.dart';
import 'package:celebrity/core/utils/sized.dart';
import 'package:celebrity/core/utils/strings.dart';
import 'package:flutter/material.dart';
import '../../core/utils/text_style.dart';
import '../../widgets/custom_button.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.paddingMedium),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _imageWidget(context),
          _titleSubtitle(),
          _button(context),
        ],
      ),
    );
  }

  _imageWidget(BuildContext context) {
    return Image.asset(AppAssets.paymentSuccess);
  }

  _titleSubtitle() {
    return Column(
      children: [
        verticalSpace(Dimensions.paddingMedium * 0.4),
        Text(
          textAlign: TextAlign.center,
          "Payment \nSuccessfully",
          style: AppTextStyles.headline1,
        ),
        verticalSpace(Dimensions.paddingMedium * 0.4),

        Text(
          textAlign: TextAlign.center,
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum porta ipsumLorem ",
          style: AppTextStyles.subtitle,
        ),
      ],
    );
  }

  _button(BuildContext context) {
    return Column(
      children: [
        verticalSpace(Dimensions.paddingLarge * 1.6),
        CustomButton(
          text: AppStrings.bookings,
          onPressed: () {
            Navigator.pushNamed(context, '/bookingActorDetailsScreen');
          },
        ),
        verticalSpace(Dimensions.paddingMedium * 1.3),
        Container(
          width: double.infinity,
          height: Dimensions.heightSize * 4,
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 11),
              side: BorderSide(color: AppColors.primaryColor),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius * 0.7),
              ),
            ),
            child: Text(
              AppStrings.home,
              style: AppTextStyles.title
                  .copyWith(fontSize: Dimensions.fontSizeMedium),
            ),
          ),
        ),
      ],
    );
  }
}
