import 'package:celebrity/core/utils/app_color.dart';
import 'package:celebrity/core/utils/sized.dart';
import 'package:celebrity/core/utils/text_style.dart';
import 'package:flutter/material.dart';

import '../../core/utils/dimensions.dart';
import '../../core/utils/strings.dart';
import '../custom_button.dart';

class EventBookingCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String dateTime;
  final String seatsLeft;

  const EventBookingCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.dateTime,
    required this.seatsLeft,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: Dimensions.paddingSmall,
          horizontal: Dimensions.paddingMedium),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Dimensions.radius * 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            spreadRadius: 2,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(Dimensions.radius * 1.5)),
            child: Stack(
              children: [
                Image.asset(
                  imageUrl,
                  height: 171,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  right: 10,
                  bottom: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.paddingMedium * 0.7,
                        vertical: Dimensions.paddingSmall * 0.7),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(Dimensions.radius * 0.5),
                    ),
                    child: Text(
                      seatsLeft,
                      style: AppTextStyles.subtitle.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.secondaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  flex: 8,
                  child: Column(
                    crossAxisAlignment: crossStart,
                    children: [
                      Text(
                        title,
                        style: AppTextStyles.title
                            .copyWith(fontSize: Dimensions.fontSizeMedium),
                      ),
                      Text(
                        dateTime,
                        style: AppTextStyles.subtitle
                            .copyWith(fontSize: Dimensions.fontSizeExtraSmall),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: CustomButton(
                    radius: Dimensions.radius * 0.5,
                    height: Dimensions.heightSize * 2.7,
                    text: AppStrings.bookNow,
                    onPressed: () {
                      Navigator.pushNamed(
                          context, '/personalMeetupDetailsScreen');
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
