import 'package:flutter/material.dart';

import '../../core/utils/dimensions.dart';
import '../../core/utils/sized.dart';
import '../../core/utils/strings.dart';
import '../../core/utils/text_style.dart';

class IconsWithTextWidget extends StatelessWidget {
  const IconsWithTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: Dimensions.paddingSmall * 1.4),
      child: Row(
        crossAxisAlignment: crossStart,
        mainAxisAlignment: mainSpaceBet,
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(top: Dimensions.paddingSmall * 0.4),
              child: Image.asset(
                "assets/icons/congratualtions.png",
                height: 22,
                width: 23,
              ),
            ),
          ),
          horizontalSpace(Dimensions.widthSize),
          Expanded(
            flex: 9,
            child: Text(
              AppStrings.meetingAbout,
              style: AppTextStyles.subtitle.copyWith(
                fontSize: Dimensions.fontSizeSmall * 0.8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
