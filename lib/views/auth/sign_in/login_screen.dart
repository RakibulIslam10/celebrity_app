import 'package:celebrity/core/utils/app_color.dart';
import 'package:celebrity/core/utils/dimensions.dart';
import 'package:celebrity/core/utils/sized.dart';
import 'package:celebrity/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/assets.dart';
import '../../../core/utils/strings.dart';
import '../../../core/utils/text_style.dart';
import '../../../widgets/custom_input_fields.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.horizontalSpacingLarge),
          child: ListView(
            children: [
              verticalSpace(
                h * 0.11,
              ),
              _logoWidget(h),
              _textWidget(h),
              _inputForm(),
              _buttonWidget(context),
            ],
          ),
        ));
  }

  _inputForm() {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(vertical: Dimensions.verticalSpacingLarge),
          child: CustomInputFields(
              controller: TextEditingController(),
              hintText: AppStrings.mobileNumber),
        ),
      ],
    );
  }

  _textWidget(double h) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(
          h * 0.07,
        ),
        Text(
          AppStrings.hey,
          style: AppTextStyles.headline1.copyWith(
            fontSize: Dimensions.fontSizeLarge * 2,
            color: AppColors.primaryTextColor,
          ),
        ),
        Text(
          AppStrings.loginNow,
          style: AppTextStyles.headline1.copyWith(
            fontSize: Dimensions.fontSizeLarge * 2,
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
                    blurRadius: 10,
                    // Softness of the shadow
                    offset: const Offset(0, 4),
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
    return Container(
      margin: EdgeInsets.only(top: Dimensions.marginSmall),
      child: CustomButton(
        text: AppStrings.login,
        onPressed: () {
          Navigator.pushNamed(context, '/otp');
        },
      ),
    );
  }
}
