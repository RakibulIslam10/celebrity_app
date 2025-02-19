import 'package:celebrity/core/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../core/utils/app_color.dart';
import '../../core/utils/assets.dart';
import '../../core/utils/sized.dart';
import '../../core/utils/strings.dart';
import '../../core/utils/text_style.dart';
import '../../providers/booking.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tabProvider = Provider.of<TabProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          actions: [_iconWidget()]),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: Dimensions.horizontalSpacingLarge),
        child: Column(
          children: [
            // Tabs
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTabButton(context, "Upcoming", 0),
                _buildTabButton(context, "Completed", 1),
                _buildTabButton(context, "Cancelled", 2),
              ],
            ),
            SizedBox(
              height: Dimensions.verticalSpacingLarge,
            ),
            // Content
            Expanded(
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return _cardWidget(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _cardWidget(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/personalMeetupStatusScreen");
      },
      child: Container(
        padding: EdgeInsets.all(Dimensions.paddingMedium * 0.8),
        margin: EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSmall,
            vertical: Dimensions.marginSmall),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(Dimensions.radius),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Text(
                    '#A1234B56',
                    style: GoogleFonts.poppins(
                      color: AppColors.idColor,
                      fontWeight: FontWeight.w500,
                      fontSize: Dimensions.fontSizeExtraSmall,
                    ),
                  ),
                  verticalSpace(Dimensions.heightSize * 0.2),
                  CircleAvatar(
                    radius: Dimensions.radius * 4,
                    backgroundImage: const AssetImage(AppAssets
                        .personalMeet1), // Change to network image if needed
                  ),
                ],
              ),
            ),
            horizontalSpace(Dimensions.widthSize * 0.7),
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(Dimensions.heightSize * 2),
                  FittedBox(
                      child: Text('kalki Team',
                          maxLines: 1, style: AppTextStyles.title)),
                  Text(
                    AppStrings.personalMeetUps,
                    style: AppTextStyles.subtitle.copyWith(
                        color: AppColors.primaryTextColor,
                        fontSize: Dimensions.fontSizeExtraSmall * 0.9),
                  ),
                  Text(
                    'Nov 5th | 7pm',
                    style: AppTextStyles.subtitle.copyWith(
                        fontSize: Dimensions.fontSizeExtraSmall * 0.9),
                  ),
                  FittedBox(
                    child: Text(
                      'Shamshabad Mamidpally',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.subtitle.copyWith(
                          fontSize: Dimensions.fontSizeExtraSmall * 0.9),
                    ),
                  ),
                ],
              ),
            ),
            horizontalSpace(Dimensions.widthSize * 0.2),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  verticalSpace(Dimensions.heightSize * 2),
                  Text(
                    '₹299',
                    style: GoogleFonts.roboto(
                      color: AppColors.primaryTextColor,
                      fontWeight: FontWeight.w600,
                      fontSize: Dimensions.fontSizeMedium,
                    ),
                  ),
                  verticalSpace(Dimensions.heightSize * 2),
                  SizedBox(
                    height: Dimensions.heightSize * 2.3,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 11),
                        side: const BorderSide(color: AppColors.primaryColor),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius * 0.7),
                        ),
                      ),
                      child: Text(AppStrings.viewDetails,
                          style: AppTextStyles.title.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: Dimensions.fontSizeExtraSmall,
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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
                Text(AppStrings.threeHundred, style: AppTextStyles.title),
                const SizedBox(width: 5),
                Image.asset(AppAssets.coin)
              ],
            )),
        Container(
          margin: EdgeInsets.symmetric(horizontal: Dimensions.paddingSmall * 2),
          padding: EdgeInsets.all(Dimensions.paddingSmall),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius),
              color: AppColors.hintColor),
          child: const Icon(
            Icons.notifications,
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }

  _buildTabButton(BuildContext context, String title, int index) {
    final tabProvider = Provider.of<TabProvider>(context, listen: false);

    return GestureDetector(
      onTap: () {
        tabProvider.setTab(index);
      },
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              color: tabProvider.selectedTab == index
                  ? Colors.purple
                  : Colors.grey,
              fontWeight: tabProvider.selectedTab == index
                  ? FontWeight.bold
                  : FontWeight.normal,
            ),
          ),
          if (tabProvider.selectedTab == index)
            Container(
              margin: const EdgeInsets.only(top: 4),
              height: 2,
              width: 60,
              color: Colors.purple,
            )
        ],
      ),
    );
  }
}
