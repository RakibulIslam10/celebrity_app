import 'package:celebrity/core/utils/app_color.dart';
import 'package:celebrity/core/utils/assets.dart';
import 'package:celebrity/core/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FanCard extends StatelessWidget {
  const FanCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: Dimensions.horizontalSpacingLarge * 0.7,
          vertical: Dimensions.verticalSpacingLarge * 0.4),
      width: double.maxFinite,
      height: 200.h,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xff13153C),
            Color(0xffB03DC0),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(Dimensions.radius),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Name Text
          Positioned(
            top: 15,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Vijay\nDevarakonda',
                  style: GoogleFonts.poppins(
                    color: AppColors.cardName,
                    fontSize: Dimensions.fontSizeLargeSmall,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),

          // Admirer Text
          Positioned(
            top: 80,
            left: 20,
            child: Text(
              'Admirer',
              style: GoogleFonts.inter(
                color: AppColors.whiteColor,
                fontSize: Dimensions.fontSizeMedium,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          // Profile Picture
          Positioned(
            bottom: 30,
            left: 20,
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(
                      AppAssets.profile), // Replace with actual image URL
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'XXXXXXXXXX',
                      style: GoogleFonts.inter(
                        color: AppColors.whiteColor,
                        fontSize: Dimensions.fontSizeSmall,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Fan ID: CLXXXXXX',
                      style: GoogleFonts.inter(
                        color: AppColors.whiteColor,
                        fontSize: Dimensions.fontSizeExtraSmall * 0.8,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Validity Text
          const Positioned(
            bottom: 8,
            left: 20,
            child: Text(
              'Valid: XXXXX to XXXXX',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 10,
              ),
            ),
          ),

          // Hero Image
          Positioned(
            top: 15,
            right: 20,
            child: Image.asset(
              AppAssets.fancard2, // Replace with actual image URL
              height: MediaQuery.of(context).size.height * 0.25,
            ),
          ),
        ],
      ),
    );
  }
}
