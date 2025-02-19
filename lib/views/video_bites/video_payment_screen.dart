import 'package:celebrity/core/utils/app_color.dart';
import 'package:celebrity/core/utils/assets.dart';
import 'package:celebrity/core/utils/dimensions.dart';
import 'package:celebrity/core/utils/sized.dart';
import 'package:celebrity/core/utils/text_style.dart';
import 'package:celebrity/widgets/custom_button.dart';
import 'package:celebrity/widgets/custom_widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/utils/strings.dart';
import '../../widgets/custom_widget/custom_dashed_line_painter.dart';

class VideoBitesPaymentScreen extends StatelessWidget {
  const VideoBitesPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: PrimaryAppBar(""),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      padding:  EdgeInsets.symmetric(horizontal: Dimensions.paddingMedium),
      children: [
        _title(context),
        _topCardWidget(context),
        _totalCostWidget(context),
        _buttonsWidget(context),
      ],
    );
  }

  _topCardWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.paddingMedium * 0.8),
      margin: EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSmall,
          vertical: Dimensions.marginSmall),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(Dimensions.radius),
        boxShadow: [
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
                  backgroundImage: AssetImage(AppAssets
                      .saiDharam2), // Change to network image if needed
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
                    child: Text('Sai Dharam Tej',
                        maxLines: 1, style: AppTextStyles.title)),
                Text(
                  'Video Bite',
                  style: AppTextStyles.subtitle
                      .copyWith(fontSize: Dimensions.fontSizeExtraSmall * 0.9),
                ),
                FittedBox(
                  child: Text(
                    '15/01/2025',
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
                Container(
                  height: Dimensions.heightSize * 2.3,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 11),
                      side: BorderSide(color: AppColors.primaryColor),
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
    );
  }

  _totalCostWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingMedium * 0.8),
      margin: EdgeInsets.symmetric(
        vertical: Dimensions.marginMedium,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: mainSpaceBet,
            children: [
              Text(
                AppStrings.Price,
                style: AppTextStyles.title
                    .copyWith(fontSize: Dimensions.fontSizeMedium),
              ),
              Text(
                "₹ 299",
                style: GoogleFonts.poppins(
                    fontSize: Dimensions.fontSizeMedium,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryTextColor),
              ),
            ],
          ),
          verticalSpace(Dimensions.heightSize * 0.8),
          Row(
            mainAxisAlignment: mainSpaceBet,
            children: [
              Column(
                crossAxisAlignment: crossStart,
                children: [
                  Text(
                    AppStrings.taxesAndFess,
                    style: AppTextStyles.title
                        .copyWith(fontSize: Dimensions.fontSizeMedium),
                  ),
                  Text(
                    "GST 5.0%",
                    style: AppTextStyles.title
                        .copyWith(fontSize: Dimensions.fontSizeSmall * 0.7),
                  ),
                ],
              ),
              Text(
                "₹ 15",
                style: GoogleFonts.poppins(
                    fontSize: Dimensions.fontSizeMedium,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryTextColor),
              ),
            ],
          ),
          verticalSpace(Dimensions.heightSize),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1.5),
            child: CustomPaint(
              size: Size(double.infinity, 0.5),
              painter: DashedLinePainter(),
            ),
          ),
          verticalSpace(Dimensions.heightSize),
          Row(
            mainAxisAlignment: mainSpaceBet,
            children: [
              Text(
                AppStrings.totalCost,
                style: GoogleFonts.poppins(
                  fontSize: Dimensions.fontSizeLargeSmall,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryTextColor,
                ),
              ),
              Text(
                "₹ 314",
                style: GoogleFonts.poppins(
                    fontSize: Dimensions.fontSizeMedium,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryTextColor),
              ),
            ],
          ),
          verticalSpace(Dimensions.heightSize * 1.5),
        ],
      ),
    );
  }

  _buttonsWidget(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: Dimensions.paddingMedium * 0.66),
      child: Column(
        children: [
          CustomButton(
              amount: "₹314",
              text: AppStrings.payment,
              onPressed: () {
                Navigator.pushNamed(context, '/videoPaymentSuccessScreen');
              }),
          verticalSpace(Dimensions.heightSize),
          Row(
            children: [
              Text(
                "Wallet Amount :",
                style: GoogleFonts.poppins(
                    fontSize: Dimensions.fontSizeLargeSmall * 0.9,
                    color: AppColors.secondaryTextColor,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                " ₹1024",
                style: GoogleFonts.roboto(
                    fontSize: Dimensions.fontSizeLarge * 0.9,
                    color: AppColors.primaryTextColor,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _title(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: Dimensions.paddingMedium,
        bottom: Dimensions.paddingSmall,
      ),
      child: Text(
        AppStrings.payment,
        style: AppTextStyles.headline1
            .copyWith(fontSize: Dimensions.fontSizeExtraLarge * 1.2),
      ),
    );
  }
}
