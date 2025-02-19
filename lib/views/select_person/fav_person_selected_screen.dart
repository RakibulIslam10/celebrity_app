import 'package:celebrity/core/utils/sized.dart';
import 'package:celebrity/widgets/custom_button.dart';
import 'package:celebrity/widgets/profile_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/utils/app_color.dart';
import '../../core/utils/dimensions.dart';
import '../../core/utils/strings.dart';
import '../../core/utils/text_style.dart';
import '../../widgets/dropdown_widget.dart';

class FavPersonSelectedScreen extends StatelessWidget {
  const FavPersonSelectedScreen({super.key});

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
            _textWidget(h),
            _dropDownWidget(context),
            _buttonWidget(context),
          ],
        ),
      ),
    );
  }

  _textWidget(double h) {
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
          AppStrings.yourFavPerson,
          style: AppTextStyles.headline1.copyWith(
            fontSize: Dimensions.fontSizeLargeSmall * 1.7,
            color: AppColors.primaryTextColor,
          ),
        ),
      ],
    );
  }

  _buttonWidget(BuildContext context) {
    return CustomButton(
      text: AppStrings.Continue,
      onPressed: () {
        Navigator.pushNamed(context, '/profile');
      },
    );
  }

  _dropDownWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimensions.marginMedium),
      child: const Column(
        children: [
          CustomDropdown(
            label: "Industry",
            dropdownKey: "Industry",
            items: ["Tollywood", "Bollywood", "Kollywood", "Hollywood"],
          ),
          CustomDropdown(
            label: "Hero",
            dropdownKey: "Hero",
            items: [
              "Ram Pothineni",
              "Vijay Devarakonda",
              "Allu Arjun",
              "Ram Charan"
            ],
          ),
          CustomDropdown(
            label: "Heroine",
            dropdownKey: "Heroine",
            items: ["Samantha", "Rashmika", "Kajal Aggarwal", "Tamannaah"],
          ),
          CustomDropdown(
            label: "Subscription",
            dropdownKey: "Subscription",
            items: [
              "1 Month ₹29",
              "3 Months ₹59",
              "6 Months ₹99",
              "1 Year ₹199"
            ],
          ),
        ],
      ),
    );
  }
}
