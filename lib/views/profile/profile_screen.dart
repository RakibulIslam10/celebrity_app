import 'package:celebrity/core/utils/app_color.dart';
import 'package:celebrity/core/utils/assets.dart';
import 'package:celebrity/core/utils/sized.dart';
import 'package:celebrity/widgets/custom_button.dart';
import 'package:celebrity/widgets/custom_widget/custom_appbar.dart';
import 'package:celebrity/widgets/dropdown_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/utils/dimensions.dart';
import '../../core/utils/strings.dart';
import '../../core/utils/text_style.dart';
import '../../providers/profile_provider.dart';
import '../../widgets/custom_input_fields.dart';
import '../../widgets/drop_down/gender_dropdown.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: const PrimaryAppBar(""),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: Dimensions.horizontalSpacingLarge),
        child: ListView(
          children: [
            _textWidget(),
            _profileHeader(context),
            _inputForm(),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: Dimensions.verticalSpacingLarge),
              child: CustomButton(
                text: AppStrings.Continue,
                onPressed: () {
                  Navigator.pushNamed(context, '/payment');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _inputForm() {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(vertical: Dimensions.verticalSpacingLarge),
          child: CustomInputFields(
            controller: TextEditingController(),
            hintText: "Full Name",
          ),
        ),
        CustomInputFields(
          controller: TextEditingController(),
          hintText: "Email Id",
        ),
        verticalSpace(Dimensions.heightSize),
        const CustomGenderDropdown(
          dropdownKey: "Gender",
          hint: "Select",
          items: ["Male", "Female", "Other"],
        ),
      ],
    );
  }

  _profileHeader(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: Dimensions.horizontalSpacingLarge,
      ),
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          Row(
            mainAxisAlignment: mainCenter,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[300],
                  backgroundImage: profileProvider.profileImage != null
                      ? FileImage(profileProvider.profileImage!)
                      : null,
                  child: profileProvider.profileImage == null
                      ? const Icon(Icons.camera_alt,
                          size: 40, color: Colors.white)
                      : null,
                ),
              ),
              SizedBox(width: Dimensions.widthSize * 3),
              InkWell(
                onTap: () => _showImagePicker(context, profileProvider),
                child: Container(
                  padding: EdgeInsets.all(Dimensions.paddingSmall),
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "Upload Photo",
                    style: AppTextStyles.title.copyWith(
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _textWidget() {
    return Text(
      AppStrings.profile,
      style: AppTextStyles.headline1.copyWith(
        fontSize: Dimensions.fontSizeLargeSmall * 1.8,
        color: AppColors.primaryTextColor,
      ),
    );
  }
}

// Show Image Picker Dialog
void _showImagePicker(BuildContext context, ProfileProvider profileProvider) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext bc) {
      return SafeArea(
        child: Wrap(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Choose from Gallery'),
              onTap: () {
                profileProvider.pickImage();
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Take a Photo'),
              onTap: () {
                profileProvider.captureImage();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    },
  );
}
