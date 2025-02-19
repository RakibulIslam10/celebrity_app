import 'dart:ffi';

import 'package:celebrity/core/utils/app_color.dart';
import 'package:celebrity/core/utils/assets.dart';
import 'package:celebrity/core/utils/dimensions.dart';
import 'package:celebrity/core/utils/sized.dart';
import 'package:celebrity/core/utils/strings.dart';
import 'package:celebrity/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/utils/text_style.dart';
import '../../widgets/custom_input_fields.dart';
import '../../widgets/drop_down/gender_dropdown.dart';

class VideoBitesBookScreen extends StatelessWidget {
  VideoBitesBookScreen({super.key});
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final vanueController = TextEditingController();
  final eventController = TextEditingController();
  final eventDescController = TextEditingController();
  final hoursController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      dateController.text = "${picked.year}-${picked.month}-${picked.day}";
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      timeController.text = picked.format(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            _buildImageHeader(context),
            _buildContentCard(context),
          ],
        ),
      ),
    );
  }

  Widget _buildImageHeader(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 10,
                spreadRadius: 2,
                offset: const Offset(0, 4),
              ),
            ],
            image: const DecorationImage(
                image: AssetImage(AppAssets.saiDharam2), fit: BoxFit.cover),
          ),
        ),
        Positioned(
          top: Dimensions.horizontalSpacingLarge * 2,
          left: Dimensions.horizontalSpacingLarge,
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ), // Customize color if needed
              ),
              horizontalSpace(Dimensions.widthSize),
              Text(
                "Sai Dharam Tej",
                style: AppTextStyles.title.copyWith(
                  color: AppColors.whiteColor,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildContentCard(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.33,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(Dimensions.radius * 13),
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset: Offset(0, -2),
            )
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Sai Dharam Tej",
                  style: AppTextStyles.headline1.copyWith(
                    fontSize: Dimensions.fontSizeExtraLarge - 3,
                  ),
                ),
                horizontalSpace(Dimensions.widthSize),
                Text(
                  "@599",
                  style: AppTextStyles.title.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
            verticalSpace(Dimensions.heightSize * 2),
            Text(
              AppStrings.makeYourMoment,
              style: GoogleFonts.poppins(
                  fontSize: Dimensions.fontSizeMedium,
                  color: AppColors.primaryTextColor),
            ),
            verticalSpace(Dimensions.heightSize * 2),

            /// input and drop down
            _inputAndDropdown(context),

            CustomButton(
              text: AppStrings.bookNow,
              onPressed: () {
                Navigator.pushNamed(context, "/videoBitesPaymentScreen");
              },
            ),
          ],
        ),
      ),
    );
  }

  _inputAndDropdown(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        CustomInputFields(
          controller: TextEditingController(),
          hintText: AppStrings.name,
        ),
        const CustomGenderDropdown(
          dropdownKey: AppStrings.chooseOccasion,
          hint: AppStrings.chooseOccasion,
          items: ["Pongal", "Navaratri", "Deepavali"],
        ),
        CustomInputFields(
          controller: TextEditingController(),
          hintText: AppStrings.name,
          maxline: 3,
        ),
        verticalSpace(Dimensions.heightSize * 0.6),
        FittedBox(
            child: Text(
          "Before 5days of your occasion you can book",
          style: AppTextStyles.title.copyWith(
            fontSize: Dimensions.fontSizeExtraSmall,
            fontWeight: FontWeight.w400,
          ),
        )),
        verticalSpace(Dimensions.heightSize * 0.2),
        Container(
          width: MediaQuery.sizeOf(context).width,
          child: CustomInputFields(
            controller: dateController,
            hintText: AppStrings.date,
            icon: Icons.calendar_today,
            onTap: () => _selectDate(context),
          ),
        ),
        verticalSpace(Dimensions.heightSize ),

      ],
    );
  }
}
