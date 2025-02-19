import 'package:flutter/material.dart';
import '../../core/utils/app_color.dart';
import '../../core/utils/assets.dart';
import '../../core/utils/dimensions.dart';
import '../../core/utils/sized.dart';
import '../../core/utils/strings.dart';
import '../../core/utils/text_style.dart';
import '../../models/heros_images_list.dart';
import '../custom_button.dart';

class BookingAnActorWidget extends StatelessWidget {
   const BookingAnActorWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _bookWidget(context),
        _heros(context),
        _heroins(context),
        _singers(context),
        verticalSpace(Dimensions.appBarHeight)
      ],
    );
  }

  _bookWidget(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(
          top: Dimensions.paddingMedium, bottom: Dimensions.paddingSmall),
      child: SizedBox(
        height: 200,
        child: Container(
          padding:  EdgeInsets.symmetric(
            vertical: Dimensions.paddingMedium,
            horizontal: Dimensions.paddingMedium,
          ),
          decoration:  const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.karthikeyaHero),
              fit: BoxFit.cover, // Ensure the image fills the container
            ),
          ),
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.end, // Align items to the bottom
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min, // Only take necessary space
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 8,
                    child: Column(
                      crossAxisAlignment: crossStart,
                      children: [
                        Text(
                          AppStrings.karthikeya,
                          style: AppTextStyles.headline1.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.whiteColor,
                            fontSize: Dimensions.fontSizeExtraLarge * 0.8,
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
                  horizontalSpace(Dimensions.widthSize),
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: Dimensions.paddingLarge,
                        left: Dimensions.paddingMedium,
                      ),
                      child: CustomButton(
                        height: Dimensions.heightSize * 2.7,
                        text: AppStrings.bookNow,
                        onPressed: () {
                          Navigator.pushNamed(context, '/bookAnActorRequest');
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _heros(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        Padding(
          padding:  EdgeInsets.only(
            left: Dimensions.paddingLarge,
          ),
          child: Text(
            AppStrings.heros,
            style: AppTextStyles.title,
          ),
        ),
        SizedBox(
          height: Dimensions.heightSize * 8.2,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: heroes.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:  EdgeInsets.symmetric(
                    horizontal: Dimensions.paddingSmall * 0.7),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(Dimensions.radius),
                  child: Image.asset(
                    heroes[index].imageUrl,
                    width: Dimensions.widthSize * 13,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  _heroins(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        Padding(
          padding:  EdgeInsets.only(
            left: Dimensions.paddingLarge,
            top: Dimensions.paddingSmall,
          ),
          child: Text(
            AppStrings.heroins,
            style: AppTextStyles.title,
          ),
        ),
        SizedBox(
          height: Dimensions.heightSize * 8.2,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: heroins.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:  EdgeInsets.symmetric(
                    horizontal: Dimensions.paddingSmall * 0.7),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(Dimensions.radius),
                  child: Image.asset(
                    heroins[index].imageUrl,
                    width: Dimensions.widthSize * 13,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  _singers(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        Padding(
          padding:  EdgeInsets.only(
            left: Dimensions.paddingLarge,
            top: Dimensions.paddingSmall,
          ),
          child: Text(
            AppStrings.singers,
            style: AppTextStyles.title,
          ),
        ),
        SizedBox(
          height: Dimensions.heightSize * 8.2,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: singers.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:  EdgeInsets.symmetric(
                    horizontal: Dimensions.paddingSmall * 0.7),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(Dimensions.radius),
                  child: Image.asset(
                    singers[index].imageUrl,
                    width: Dimensions.widthSize * 13,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
