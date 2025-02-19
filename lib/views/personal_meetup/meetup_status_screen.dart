import 'package:celebrity/core/utils/sized.dart';
import 'package:celebrity/core/utils/strings.dart';
import 'package:celebrity/widgets/custom_widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import '../../core/utils/app_color.dart';
import '../../core/utils/dimensions.dart';
import '../../core/utils/text_style.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/others/icons_with_text_widget.dart';

class PersonalMeetupStatusScreen extends StatelessWidget {
   PersonalMeetupStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: PrimaryAppBar(AppStrings.kalkiTeam),
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
    return Container(
      height: 250,
      child: Stack(
        children: [
          Image.asset(
            width: double.infinity,
            'assets/images/personal_meet1.png',
            fit: BoxFit.cover,
            height: 180,
          ),
          Positioned(
            bottom: 20,
            left: 0,
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff4D032A4),
                      Color(0xff4E368E),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(
                      Dimensions.radius * 5,
                    ),
                    bottomRight: Radius.circular(
                      Dimensions.radius * 5,
                    ),
                  )),
              child: Padding(
                padding:  EdgeInsets.only(
                  left: Dimensions.paddingLarge * 0.7,
                  right: Dimensions.paddingLarge,
                  top: Dimensions.paddingSmall * 0.6,
                  bottom: Dimensions.paddingSmall * 0.6,
                ),
                child: Text(
                  'Kalki Team\n@4999',
                  style: AppTextStyles.title.copyWith(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 20,
              right: 20,
              child: Column(
                crossAxisAlignment: crossEnd,
                children: [
                  Text(
                    "Time: 7PM",
                    style: AppTextStyles.subtitle,
                  ),
                  Text(
                    "Date: 10/01/2025",
                    style: AppTextStyles.subtitle,
                  ),
                ],
              ))
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
          //venue

          //dec
          verticalSpace(Dimensions.heightSize * 1),

          Text(
            AppStrings.venue,
            style: AppTextStyles.title,
          ),
          verticalSpace(Dimensions.heightSize * 0.6),

          Text(
            AppStrings.venueAbout,
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
          IconsWithTextWidget(),
          IconsWithTextWidget(),
          IconsWithTextWidget(),
          IconsWithTextWidget(),
          verticalSpace(Dimensions.heightSize * 2),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.paddingMedium,
              vertical: Dimensions.paddingSmall * 0.5,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius),
              border: Border.all(width: 1, color: AppColors.secondaryTextColor),
            ),
            child: Row(
              mainAxisAlignment: mainSpaceBet,
              children: [
                Expanded(
                  flex: 7,
                  child: Text(
                    "Your event will be held in",
                    style: AppTextStyles.title.copyWith(
                      fontSize: Dimensions.fontSizeSmall,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    "2days",
                    maxLines: 1,
                    style: AppTextStyles.title.copyWith(
                      fontSize: Dimensions.fontSizeLarge * 1.2,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
