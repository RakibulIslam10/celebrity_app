import 'package:celebrity/core/utils/app_color.dart';
import 'package:celebrity/core/utils/assets.dart';
import 'package:celebrity/core/utils/dimensions.dart';
import 'package:celebrity/core/utils/sized.dart';
import 'package:celebrity/core/utils/strings.dart';
import 'package:flutter/material.dart';
import '../../core/utils/text_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.horizontalSpacingLarge),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(Dimensions.verticalSpacingLarge * 0.5),
              _appBar(),
              verticalSpace(Dimensions.verticalSpacingLarge),
              _searchBar(),
              verticalSpace(Dimensions.verticalSpacingLarge),
              _headerBox(context),
              verticalSpace(Dimensions.verticalSpacingLarge),
              Text(
                AppStrings.categories,
                style: AppTextStyles.title,
              ),
              SizedBox(height: Dimensions.verticalSpacingLarge * 0.5),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 1.7,
                  crossAxisSpacing: 16,
                  children: [
                    categoryCard(
                      AppStrings.videoC,
                      AppAssets.card1,
                      () {
                        Navigator.pushNamed(context, '/videoCallsScreen');
                      },
                    ),
                    categoryCard(
                      AppStrings.personalMeets,
                      AppAssets.card4,
                      () {
                        Navigator.pushNamed(context, '/personalMeetupScreen');
                      },
                    ),
                    categoryCard(
                      AppStrings.videoBites,
                      AppAssets.card12,
                      () {
                        Navigator.pushNamed(context, '/videoBitesScreen');
                      },
                    ),
                    categoryCard(
                      AppStrings.bookAnActors,
                      AppAssets.card3,
                      () {
                        Navigator.pushNamed(context, '/bookAnActor');
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _headerBox(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      padding:
          EdgeInsets.symmetric(horizontal: Dimensions.horizontalSpacingLarge),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xff4E368E),
            Color(0xffD032A4),
          ], // Adjust colors
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(Dimensions.radius * 2),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: Dimensions.verticalSpacingLarge * 0.4),
                  child: FittedBox(
                    child: Text(AppStrings.gameAre,
                        style: AppTextStyles.subtitle.copyWith(
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w400)),
                  ),
                ),
                Text(AppStrings.getText,
                    style: AppTextStyles.headline1.copyWith(
                        color: AppColors.whiteColor,
                        fontSize: Dimensions.fontSizeExtraLarge,
                        fontWeight: FontWeight.w700)),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding:
                  EdgeInsets.only(top: Dimensions.verticalSpacingLarge * 1.5),
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: Image.asset(AppAssets.coins)),
            ),
          )
        ],
      ),
    );
  }

  _appBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                AppAssets.profile22,
              ),
            ),
            const SizedBox(width: 4),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.nameUser,
                  style: AppTextStyles.subtitle
                      .copyWith(fontSize: Dimensions.fontSizeSmall),
                ),
                Text(
                  AppStrings.goodMorning,
                  style: AppTextStyles.title
                      .copyWith(fontSize: Dimensions.fontSizeSmall),
                )
              ],
            ),
          ],
        ),
        horizontalSpace(30),
        _iconWidget()
      ],
    );
  }

  _searchBar() {
    return TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        hintText: AppStrings.search,
        prefixIcon: const Icon(
          Icons.search,
          color: AppColors.blackColor,
        ),
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  categoryCard(String title, String image, VoidCallback onTap) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(image),
              Positioned(
                left: 20,
                bottom: 30,
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: Dimensions.fontSizeLarge,
                      fontWeight: FontWeight.bold,
                      color: AppColors.whiteColor),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  _iconWidget() {
    return Row(
      children: [
        Container(
            padding: EdgeInsets.all(Dimensions.paddingSmall),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius),
                color: AppColors.hintColor),
            child: Row(
              children: [
                Text(AppStrings.threeHundred,
                    style: AppTextStyles.title.copyWith(
                      fontSize: 14,
                    )),
                const SizedBox(width: 5),
                Image.asset(
                  AppAssets.coin,
                  height: 18,
                  width: 18,
                )
              ],
            )),
        Container(
          margin: EdgeInsets.only(left: Dimensions.paddingSmall),
          padding: EdgeInsets.all(Dimensions.paddingSmall),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius),
              color: AppColors.hintColor),
          child: const Icon(
            Icons.notifications,
            color: AppColors.blackColor,
          ),
        ),
      ],
    );
  }
}
