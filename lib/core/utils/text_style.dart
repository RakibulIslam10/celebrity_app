// text_styles.dart
import 'package:flutter/material.dart';
import 'app_color.dart';
import 'dimensions.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static final TextStyle headline1 = GoogleFonts.dmSans(
    fontSize: Dimensions.fontSizeExtraLarge,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryTextColor,
  );

  static final TextStyle headline2 = GoogleFonts.dmSans(
    fontSize: Dimensions.fontSizeLarge,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryTextColor,
  );

  static final TextStyle bodyText1 = GoogleFonts.dmSans(
    fontSize: Dimensions.fontSizeMedium,
    fontWeight: FontWeight.w600,
    color: AppColors.secondaryTextColor,
  );

  static final TextStyle bodyText2 = GoogleFonts.dmSans(
    fontSize: Dimensions.fontSizeSmall,
    fontWeight: FontWeight.normal,
    color: AppColors.secondaryTextColor,
  );

  static final TextStyle caption = GoogleFonts.dmSans(
    fontSize: Dimensions.fontSizeExtraSmall,
    fontWeight: FontWeight.normal,
    color: AppColors.hintColor,
  );

  static final TextStyle button = GoogleFonts.dmSans(
    fontSize: Dimensions.fontSizeMedium,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryButtonTextColor,
  );

  static final TextStyle subtitle = GoogleFonts.dmSans(
    fontSize: Dimensions.fontSizeSmall,
    fontWeight: FontWeight.w400,
    color: AppColors.secondaryTextColor,
  );
  static final TextStyle title = GoogleFonts.dmSans(
    fontSize: Dimensions.fontSizeLargeSmall,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryTextColor,
  );
}
