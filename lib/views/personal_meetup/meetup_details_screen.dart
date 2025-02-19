import 'package:celebrity/core/utils/sized.dart';
import 'package:celebrity/core/utils/strings.dart';
import 'package:celebrity/widgets/custom_widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import '../../core/utils/app_color.dart';
import '../../core/utils/dimensions.dart';
import '../../core/utils/text_style.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/others/icons_with_text_widget.dart';

class PersonalMeetupDetailsScreen extends StatelessWidget {
   const PersonalMeetupDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: const PrimaryAppBar(AppStrings.kalkiTeam),
        body: _bodyWidget(context));
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      children: [
        _topWidget(context),
        _vanueAndDesc(context),
        _meetingInstructions(context),
        _termsCondition(context),
        _bookNowButton(context),
      ],
    );
  }

  _topWidget(BuildContext context) {
    return SizedBox(
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
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xff4d032a4),
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
          Text(
            AppStrings.aboutTheEvent,
            style: AppTextStyles.title,
          ),

          verticalSpace(Dimensions.heightSize * 0.7),

          Text(
            AppStrings.theLandscope,
            style: AppTextStyles.subtitle.copyWith(
              fontSize: Dimensions.fontSizeSmall * 0.85,
            ),
          ),

          //dec
          verticalSpace(Dimensions.heightSize * 1.4),

          Text(
            AppStrings.venue,
            style: AppTextStyles.title,
          ),
          verticalSpace(Dimensions.heightSize * 0.6),

          Text(
            AppStrings.shamshabad,
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
            AppStrings.benefits,
            style: AppTextStyles.title,
          ),
          verticalSpace(Dimensions.heightSize * 0.6),
          const IconsWithTextWidget(),
          const IconsWithTextWidget(),
          const IconsWithTextWidget(),
          const IconsWithTextWidget(),
        ],
      ),
    );
  }

  _termsCondition(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(
        horizontal: Dimensions.paddingLarge,
      ),
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          verticalSpace(Dimensions.heightSize * 1.5),
          Text(
            AppStrings.termsAndCondition,
            style: AppTextStyles.title,
          ),
          verticalSpace(Dimensions.heightSize * 0.6),
          const IconsWithTextWidget(),
          const IconsWithTextWidget(),
          const IconsWithTextWidget(),
          const IconsWithTextWidget(),
        ],
      ),
    );
  }

  _bookNowButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: Dimensions.paddingLarge * 0.7,
        bottom: Dimensions.paddingLarge * 2,
        left: Dimensions.paddingLarge,
        right: Dimensions.paddingLarge,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, -4),
            blurRadius: 6,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: crossStart,
              children: [
                Text(
                  AppStrings.totalAmount,
                  style:
                      AppTextStyles.title.copyWith(fontWeight: FontWeight.w700),
                ),
                Text(
                  "@4999",
                  style: AppTextStyles.title.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryColor,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: CustomButton(
              text: AppStrings.bookNow,
              onPressed: () {
                Navigator.pushNamed(context, '/meetupPaymentScreen');
              },
            ),
          )
        ],
      ),
    );
  }
}
