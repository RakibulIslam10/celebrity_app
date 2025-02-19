import 'package:celebrity/core/utils/sized.dart';
import 'package:celebrity/core/utils/strings.dart';
import 'package:celebrity/widgets/custom_widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import '../../core/utils/app_color.dart';
import '../../core/utils/assets.dart';
import '../../core/utils/dimensions.dart';
import '../../core/utils/text_style.dart';
import '../../widgets/others/custom_path_widget.dart';
import '../../widgets/others/icons_with_text_widget.dart';

class BookingActorDetailsScreen extends StatelessWidget {
  const BookingActorDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PrimaryAppBar(AppStrings.karthikeya),
        body: _bodyWidget(context));
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      children: [
        _topWidget(context),
        _vanueAndDesc(context),
        _meetingInstructions(context),
      ],
    );
  }

  _topWidget(BuildContext context) {
    return SizedBox(
      height: 170,
      child: Stack(
        children: [
          ClipPath(
            clipper: CustomClipPath(),
            child: Container(height: 135, color: AppColors.primaryColor),
          ),
          Positioned(
            left: Dimensions.paddingLarge * 1.4,
            top: 50,
            child: CircleAvatar(
              radius: Dimensions.radius * 5,
              backgroundImage: const AssetImage(AppAssets
                  .karthikeyaHero), // Change to network image if needed
            ),
          ),
          Positioned(
            bottom: 20,
            right: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Hours: 4hrs",
                  style: AppTextStyles.subtitle,
                ),
                Text(
                  "Time: 7PM",
                  style: AppTextStyles.subtitle,
                ),
                Text(
                  "Date: 10/01/2025",
                  style: AppTextStyles.subtitle,
                ),
              ],
            ),
          ),
          Positioned(
            left: 140,
            top: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.karthikeya,
                  style: AppTextStyles.headline1.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.whiteColor,
                    fontSize: Dimensions.fontSizeExtraLarge * 0.75,
                  ),
                ),
                Text(
                  "@4999/hour",
                  style: AppTextStyles.subtitle.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.whiteColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _vanueAndDesc(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(
        horizontal: Dimensions.paddingLarge,
      ),
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          Text(
            AppStrings.sankranthiFestival,
            style: AppTextStyles.title,
          ),
          verticalSpace(Dimensions.heightSize * 1.2),
          //venue
          Text(
            AppStrings.venue,
            style: AppTextStyles.title,
          ),

          verticalSpace(Dimensions.heightSize * 0.6),

          Text(
            AppStrings.venueAbout,
            style: AppTextStyles.subtitle.copyWith(
              fontSize: Dimensions.fontSizeSmall * 0.85,
            ),
          ),

          //dec
          verticalSpace(Dimensions.heightSize * 1.2),

          Text(
            AppStrings.description,
            style: AppTextStyles.title,
          ),
          verticalSpace(Dimensions.heightSize * 0.6),

          Text(
            AppStrings.descAbout,
            style: AppTextStyles.subtitle.copyWith(
              fontSize: Dimensions.fontSizeSmall * 0.8,
            ),
          ),
        ],
      ),
    );
  }

  _meetingInstructions(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(
        horizontal: Dimensions.paddingLarge,
      ),
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          verticalSpace(Dimensions.heightSize * 1.5),
          Text(
            AppStrings.meetingInstructions,
            style: AppTextStyles.title,
          ),
          verticalSpace(Dimensions.heightSize * 0.6),
          const IconsWithTextWidget(),
          const IconsWithTextWidget(),
          const IconsWithTextWidget(),
          const IconsWithTextWidget(),
          verticalSpace(Dimensions.heightSize * 2),
        ],
      ),
    );
  }
}
