import 'package:celebrity/core/utils/app_color.dart';
import 'package:celebrity/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import '../../core/utils/dimensions.dart';
import '../../core/utils/strings.dart';

class ContactUsScreen extends StatelessWidget {
   const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        automaticallyImplyLeading: true,
      ),
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding:  EdgeInsets.symmetric(
            horizontal: Dimensions.horizontalSpacingLarge),
        child: ListView(
          children: [
             Text(
              AppStrings.contactUs,
              style: TextStyle(
                  fontSize: Dimensions.fontSizeLarge * 1.5,
                  fontWeight: FontWeight.bold),
            ),
            _inputForm(),
            CustomButton(
              text: AppStrings.send,
              onPressed: () {


                Navigator.pushNamed(context, '/congratulation');
              },
            )
          ],
        ),
      ),
    );
  }

  _inputForm() {
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(
              vertical: Dimensions.verticalSpacingLarge),
          child: TextFormField(
            decoration: InputDecoration(
                hintText: AppStrings.name,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimensions.radius),
                  borderSide:  const BorderSide(
                      color: AppColors.borderColor, width: 0.5),
                ),
                filled: true,
                fillColor: AppColors.whiteColor),
          ),
        ),
        Padding(
          padding:
               EdgeInsets.only(bottom: Dimensions.verticalSpacingLarge),
          child: TextFormField(
            decoration: InputDecoration(
                hintText: AppStrings.email,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimensions.radius),
                  borderSide:  const BorderSide(
                      color: AppColors.borderColor, width: 0.5),
                ),
                filled: true,
                fillColor: AppColors.whiteColor),
          ),
        ),
        Padding(
          padding:
               EdgeInsets.only(bottom: Dimensions.verticalSpacingLarge),
          child: TextFormField(
            maxLines: 5,
            decoration: InputDecoration(
                hintText: AppStrings.description,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimensions.radius),
                  borderSide:  const BorderSide(
                      color: AppColors.borderColor, width: 0.5),
                ),
                filled: true,
                fillColor: AppColors.whiteColor),
          ),
        ),
      ],
    );
  }
}
