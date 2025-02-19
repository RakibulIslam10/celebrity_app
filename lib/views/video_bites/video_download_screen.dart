import 'package:celebrity/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../core/utils/app_color.dart';
import '../../core/utils/dimensions.dart';
import '../../core/utils/sized.dart';
import '../../core/utils/strings.dart';
import '../../core/utils/text_style.dart';
import '../../widgets/custom_input_fields.dart';

class VideoDownloadScreen extends StatelessWidget {
  const VideoDownloadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
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
        Image.asset(
          'assets/images/sai_dharam2.png', // Replace with actual image path
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.45,
          fit: BoxFit.cover,
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
        ),
        Center(
          child: Container(
            margin: const EdgeInsets.only(top: 120),
            decoration: const BoxDecoration(
              color: Colors.black54,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.play_arrow, color: Colors.white, size: 50),
              onPressed: () {
                Navigator.pushNamed(context, "/videoPlayerScreen");
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContentCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: mainSpaceBet,
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
          CustomInputFields(
            controller: TextEditingController(),
            hintText: AppStrings.name,
          ),
          verticalSpace(Dimensions.heightSize),
          CustomInputFields(
            controller: TextEditingController(),
            hintText: AppStrings.birthday,
          ),
          verticalSpace(Dimensions.heightSize),
          _buildMessageBox(),
          const SizedBox(height: 20),
          _buildButtons(),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildMessageBox() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 1, color: AppColors.borderColor),
      ),
      child: Text(
        "Lorem ipsum dolor sit amet, adipisci scingconsectetur adipiscing elit. Vestib ulum porta ipsumLorem Lorem ipsum dolor sit amet, adipisci scingconsectetur adipiscing elit. Vestib ulum porta ipsumLorem",
        style: AppTextStyles.title.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: Dimensions.fontSizeSmall,
        ),
      ),
    );
  }

  Widget _buildButtons() {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            text: AppStrings.download,
            onPressed: () {},
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              side: const BorderSide(color: Colors.purple),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              "Share",
              style: TextStyle(fontSize: 16, color: Colors.purple),
            ),
          ),
        ),
      ],
    );
  }
}
