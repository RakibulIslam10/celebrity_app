import 'package:celebrity/core/utils/app_color.dart';
import 'package:celebrity/core/utils/assets.dart';
import 'package:celebrity/core/utils/dimensions.dart';
import 'package:celebrity/core/utils/sized.dart';
import 'package:celebrity/core/utils/strings.dart';
import 'package:flutter/material.dart';
import '../../core/utils/text_style.dart';
import '../../widgets/custom_button.dart';

class PaymentSuccessDialog {
  static void show(
      BuildContext context, VoidCallback onBookings, VoidCallback onHome) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius * 0.7),
          ),
          contentPadding: EdgeInsets.all(Dimensions.paddingMedium),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(AppAssets.paymentSuccess),
              verticalSpace(Dimensions.paddingMedium * 0.4),
              Text(
                "Payment \nSuccessfully",
                textAlign: TextAlign.center,
                style: AppTextStyles.headline1,
              ),
              verticalSpace(Dimensions.paddingMedium * 0.4),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum porta ipsumLorem ",
                textAlign: TextAlign.center,
                style: AppTextStyles.subtitle,
              ),
              verticalSpace(Dimensions.paddingLarge * 1.6),
              CustomButton(
                text: AppStrings.bookings,
                onPressed: () {
                  Navigator.pop(context);
                  onBookings();
                },
              ),
              verticalSpace(Dimensions.paddingMedium * 1.3),
              SizedBox(
                width: double.infinity,
                height: Dimensions.heightSize * 4,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    onHome();
                  },
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 11),
                    side: BorderSide(color: AppColors.primaryColor),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(Dimensions.radius * 0.7),
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
          ),
        );
      },
    );
  }
}
