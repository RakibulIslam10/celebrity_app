import 'dart:ffi';

import 'package:celebrity/core/utils/app_color.dart';
import 'package:celebrity/core/utils/dimensions.dart';
import 'package:celebrity/core/utils/text_style.dart';
import 'package:flutter/material.dart';

class CustomInputFields extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData? icon;
  final Function()? onTap;
  final int? maxline;

  const CustomInputFields({
    Key? key,
    required this.controller,
    required this.hintText,
    this.maxline = 1,
    this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: onTap != null,
      maxLines: maxline,
      onTap: onTap,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyles.subtitle.copyWith(
          fontWeight: FontWeight.w400,
        ),
   
        suffixIcon: icon != null
            ? Icon(
                icon,
                color: AppColors.primaryTextColor,
                size: Dimensions.heightSize * 1.8,
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius),
          borderSide: const BorderSide(width: 1, color: AppColors.borderColor),
        ),
        contentPadding: EdgeInsets.only(
          top: Dimensions.paddingMedium * 0.8,
          bottom: Dimensions.paddingMedium * 0.8,
          left: Dimensions.paddingLarge,
          right: Dimensions.paddingLarge * 0.8,
        ),
      ),
    );
  }
}
