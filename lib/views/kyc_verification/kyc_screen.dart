import 'package:celebrity/core/utils/app_color.dart';
import 'package:celebrity/core/utils/dimensions.dart';
import 'package:celebrity/core/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/kyc/kyc.dart';

class KYCVerificationScreen extends StatelessWidget {
  const KYCVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final kycProvider = Provider.of<KYCProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
 automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(
            horizontal: Dimensions.horizontalSpacingLarge),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _textAndFieldWidget(),
             SizedBox(height: Dimensions.verticalSpacingLarge),
            _imageUploadWidget(kycProvider, context),
             const SizedBox(height: 5),
             const Text(AppStrings.uploadAdhaarCardPhoto),
              SizedBox(height: Dimensions.verticalSpacingLarge),
            _buttonWidget(context)
          ],
        ),
      ),
    );
  }

  _textAndFieldWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          AppStrings.Kyc,
          style: TextStyle(
              fontSize: Dimensions.fontSizeLarge * 1.5,
              fontWeight: FontWeight.bold),
        ),
         Text(
          AppStrings.verifications,
          style: TextStyle(
              fontSize: Dimensions.fontSizeLarge * 1.5,
              fontWeight: FontWeight.bold),
        ),
         SizedBox(height: Dimensions.verticalSpacingLarge),
        TextField(
          decoration: InputDecoration(
            hintText: AppStrings.AadharNumber,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }

  _imageUploadWidget(KYCProvider kycProvider, BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              kycProvider.pickImage();
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.11,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
              child: kycProvider.image == null
                  ?  const Icon(Icons.camera_alt, size: 40, color: Colors.grey)
                  : Image.file(kycProvider.image!, fit: BoxFit.cover),
            ),
          ),
        ),
         const SizedBox(width: 10),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(Dimensions.radius), // Rounded edges
            ),
            backgroundColor: AppColors.pinkColor,
          ),
          onPressed: () {
            kycProvider.pickImage();
          },
          child:  const Text(
            AppStrings.uploadPhoto,
            style: TextStyle(color: AppColors.whiteColor),
          ),
        ),
      ],
    );
  }

  _buttonWidget(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/kycOtpVerification');
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(Dimensions.radius), // Rounded edges
          ),
        ),
        child: Ink(
          decoration: BoxDecoration(
            gradient:  const LinearGradient(
              colors: [
                Color(0xffD032A4),
                Color(0xff4E368E),
              ], // Adjust colors
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(Dimensions.radius),
          ),
          child: Container(
            alignment: Alignment.center,
            child:  Text(
              AppStrings.submit,
              style: TextStyle(
                color: Colors.white,
                fontSize: Dimensions.fontSizeMedium,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
