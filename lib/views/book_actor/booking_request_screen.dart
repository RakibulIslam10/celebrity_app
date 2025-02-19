import 'package:celebrity/core/utils/app_color.dart';
import 'package:celebrity/core/utils/assets.dart';
import 'package:celebrity/core/utils/dimensions.dart';
import 'package:celebrity/core/utils/sized.dart';
import 'package:celebrity/core/utils/strings.dart';
import 'package:celebrity/widgets/custom_button.dart';
import 'package:celebrity/widgets/custom_widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import '../../core/utils/text_style.dart';
import '../../widgets/custom_input_fields.dart';
import '../../widgets/others/custom_path_widget.dart';

class BookAnActorRequestScreen extends StatelessWidget {
  BookAnActorRequestScreen({super.key});
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
        appBar: const PrimaryAppBar(
          "Karthikeya",
          centerTitle: false,
        ),
        body: _bodyWidget(context));
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: Dimensions.paddingMedium * 0.4),
      children: [
        _topWidget(context),
        _detailsWidget(context),
        _buttonWidget(context),
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

  _detailsWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.paddingMedium * 1.2,
      ),
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          Padding(
            padding: EdgeInsets.only(
              bottom: Dimensions.verticalSpacingMedium,
            ),
            child: Text(
              AppStrings.details,
              style: AppTextStyles.title,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: CustomInputFields(
                  controller: dateController,
                  hintText: AppStrings.date,
                  icon: Icons.calendar_today,
                  onTap: () => _selectDate(context),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: CustomInputFields(
                  controller: timeController,
                  hintText: AppStrings.time,
                  icon: Icons.access_time,
                  onTap: () => _selectTime(context),
                ),
              ),
            ],
          ),
          verticalSpace(Dimensions.heightSize * 1.5),
          CustomInputFields(
            controller: eventController,
            hintText: AppStrings.eventName,
          ),
          verticalSpace(Dimensions.heightSize * 1.5),
          CustomInputFields(
            controller: vanueController,
            hintText: AppStrings.venueDetails,
          ),
          verticalSpace(Dimensions.heightSize * 1.5),
          CustomInputFields(
            controller: eventDescController,
            maxline: 3,
            hintText: AppStrings.eventDesc,
          ),
          verticalSpace(Dimensions.heightSize * 1.5),
          Row(
            mainAxisAlignment: mainSpaceBet,
            children: [
              Expanded(
                child: CustomInputFields(
                  controller: hoursController,
                  hintText: AppStrings.hours,
                ),
              ),
              Expanded(
                  child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "₹4999",
                  style: AppTextStyles.title,
                ),
              ))
            ],
          ),
        ],
      ),
    );
  }

  _buttonWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(
        Dimensions.paddingMedium * 1.2,
      ),
      child: CustomButton(
        text: AppStrings.request,
        onPressed: () {
          Navigator.pushNamed(context, '/bookingActorPaymentScreen');
        },
      ),
    );
  }
}
