import 'package:celebrity/core/utils/app_color.dart';
import 'package:celebrity/core/utils/assets.dart';
import 'package:celebrity/core/utils/dimensions.dart';
import 'package:celebrity/core/utils/strings.dart';
import 'package:celebrity/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class VideoCallBookingScreen extends StatelessWidget {
  const VideoCallBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: // Footer Section
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.horizontalSpacingLarge,
                    vertical: Dimensions.verticalSpacingLarge),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.borderColor)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      AppStrings.joinYourFabHero,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/callingScreen');
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            left: Dimensions.horizontalSpacingLarge * 0.5),
                        height: 40,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xffD032A4),
                              Color(0xff4E368E),
                            ], // Adjust colors
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: const Text(
                          AppStrings.joinNOw,
                          style: TextStyle(
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              )),
      backgroundColor: AppColors.whiteColor,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.42,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        AppAssets.ImageMan,
                      ),
                      fit: BoxFit.cover),
                  color: Colors.green,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(200),
                  ),
                ),
              ),
              Positioned(
                top: 40,
                left: 10,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
          CustomButton(
              text: AppStrings.bookNow,
              onPressed: () {
                Navigator.pushNamed(context, "/callPaymentScreen");
              })
        ],
      ),
    );
  }
}
