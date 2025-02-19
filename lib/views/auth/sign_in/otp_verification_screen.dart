import 'package:celebrity/core/utils/app_color.dart';
import 'package:celebrity/core/utils/dimensions.dart';
import 'package:celebrity/core/utils/sized.dart';
import 'package:celebrity/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import '../../../core/utils/assets.dart';
import '../../../core/utils/strings.dart';
import '../../../core/utils/text_style.dart';
import '../../../providers/auth/auth_provider.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.horizontalSpacingLarge),
          child: ListView(
            children: [
              verticalSpace(Dimensions.heightSize * 9),
              _logoWidget(h),
              _textWidget(h),
              _otpField(context),
              _buttonWidget(context),
            ],
          ),
        ));
  }

  showCustomAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Icon(
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
        padding:
            EdgeInsets.symmetric(vertical: Dimensions.verticalSpacingLarge),
        child: PinCodeTextField(
          keyboardType: TextInputType.number,
          enabled: true,
          length: 5,
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

  _textWidget(double h) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(Dimensions.heightSize),
        Text(
          AppStrings.otp,
          style: AppTextStyles.headline1.copyWith(
            fontSize: Dimensions.fontSizeLarge * 2,
            color: AppColors.primaryTextColor,
          ),
        ),
        Text(
          AppStrings.Verification,
          style: AppTextStyles.headline1.copyWith(
            fontSize: Dimensions.fontSizeLarge * 2,
            color: AppColors.primaryTextColor,
          ),
        ),
        verticalSpace(Dimensions.heightSize),
        Text(
          "Please enter the code sent to",
          style: AppTextStyles.subtitle.copyWith(
            fontSize: Dimensions.fontSizeLarge * 0.8,
            color: AppColors.primaryTextColor,
          ),
        ),
      ],
    );
  }

  _logoWidget(double h) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Transform.rotate(
            angle: 0.7854,
            child: Container(
              padding: const EdgeInsets.all(25),
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: const Color(0xffFFFFFF),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    // Light shadow color
                    spreadRadius: 2,
                    // Spread of the shadow
                    blurRadius: 10,
                    // Softness of the shadow
                    offset: const Offset(
                        0, 4), // Shadow position (horizontal, vertical)
                  ),
                ],
              ),
            ),
          ),
          Image.asset(
            AppAssets.logo,
            height: h * 0.11,
          )
        ],
      ),
    );
  }

  _buttonWidget(BuildContext context) {
    return CustomButton(
      text: AppStrings.submit,
      onPressed: () {
        Navigator.pushNamed(context, '/fanCard');
      },
    );
  }
}
