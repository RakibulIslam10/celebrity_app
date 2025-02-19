import 'package:celebrity/core/utils/app_color.dart';
import 'package:celebrity/core/utils/dimensions.dart';
import 'package:celebrity/core/utils/sized.dart';
import 'package:celebrity/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../core/utils/strings.dart';
import '../../../core/utils/text_style.dart';

class KycOtpVerification extends StatelessWidget {
   const KycOtpVerification({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: AppColors.whiteColor,
        ),
        backgroundColor: AppColors.whiteColor,
        body: Padding(
          padding:  EdgeInsets.symmetric(
              horizontal: Dimensions.horizontalSpacingLarge),
          child: ListView(
            children: [
              _textWidget(),
              _otpField(context),
              CustomButton(
                text: AppStrings.submit,
                onPressed: () {
                  // showCustomAlertDialog(context);

                  Navigator.pushNamed(context, '/contactUS');
                },
              ),
            ],
          ),
        ));
  }

  _textWidget() {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
         Text(
          AppStrings.Kyc,
          style: TextStyle(
              fontSize: Dimensions.fontSizeLarge * 1.5,
              fontWeight: FontWeight.bold),
        ),
         Text(
          AppStrings.verifications,
          style: TextStyle(
              fontSize: Dimensions.fontSizeLarge * 1.5,
              fontWeight: FontWeight.bold),
        ),
         SizedBox(height: Dimensions.verticalSpacingLarge),
         Text(
          AppStrings.pleaseEnterTheOtp,
          style: TextStyle(
            fontSize: Dimensions.fontSizeLarge,
          ),
        ),
        Wrap(
          spacing: Dimensions.heightSize * 0.5,
          children:  [
            Text(
              AppStrings.phoneNumber,
              style: TextStyle(
                fontSize: Dimensions.fontSizeLarge,
              ),
            ),
            Text(
              'xxxxxxxxx4321',
              style: TextStyle(
                color: Colors.blue,
                fontSize: Dimensions.fontSizeLarge,
              ),
            ),
          ],
        ),
      ],
    );
  }

  showCustomAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:  const Icon(
            Icons.star,
            size: 50,
            color: Colors.green,
          ),
          content: Text(
            textAlign: TextAlign.center,
            AppStrings.loginSuccess,
            style: AppTextStyles.headline1.copyWith(
              fontSize: Dimensions.fontSizeLarge,
              color: AppColors.primaryTextColor,
            ),
          ),
        );
      },
    );
  }

  _otpField(BuildContext context) {
    return Padding(
        padding:  EdgeInsets.symmetric(
            vertical: Dimensions.verticalSpacingLarge),
        child: PinCodeTextField(
          keyboardType: TextInputType.number,
          enabled: true,
          length: 6,
          obscureText: false,
          animationType: AnimationType.fade,
          pinTheme: PinTheme(
            disabledColor: Colors.white,
            inactiveColor: AppColors.borderColor,
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(5),
            fieldHeight: 55,
            activeColor: AppColors.primaryColor,
            fieldWidth: 50,
            activeFillColor: Colors.white,
          ),
          appContext: context,
        ));
  }
}
