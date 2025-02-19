import 'package:celebrity/core/utils/app_color.dart';
import 'package:celebrity/core/utils/assets.dart';
import 'package:celebrity/core/utils/dimensions.dart';
import 'package:celebrity/core/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/onboard/onboard_provider.dart';

class OnboardingScreen extends StatelessWidget {
  final PageController _pageController = PageController();

  OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          context.read<OnboardingProvider>().setPage(index);
        },
        children: [
          buildOnboardingPage(
            imagePath: AppAssets.onboard,
            title: 'Video Calls',
            description:
                'Connect directly with your favorite celebrities through live video calls by booking available slots instantly!',
          ),
          buildOnboardingPage(
            imagePath: AppAssets.onboard2,
            title: 'Exclusive Content',
            description:
                'Get access to exclusive content directly from your favorite stars!',
          ),
        
          buildOnboardingPage(
            imagePath: AppAssets.onboard2,
            title: 'Stay Connected',
            description: 'Never miss an update from the celebrities you love.',
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding:
             EdgeInsets.only(bottom: Dimensions.verticalSpacingLarge * 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding:  EdgeInsets.symmetric(
                  horizontal: Dimensions.horizontalSpacingLarge * 0.8),
              decoration: BoxDecoration(
                  gradient:  const LinearGradient(
                    colors: [
                      Color(0xffD032A4),
                      Color(0xff4E368E),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(Dimensions.radius)),
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/welcomeScreen');
                },
                child:  const Text(
                  AppStrings.skip,
                  style: TextStyle(color: AppColors.whiteColor, fontSize: 16),
                ),
              ),
            ),
             SizedBox(
              width: Dimensions.horizontalSpacingLarge,
            ),
            Consumer<OnboardingProvider>(
              builder: (context, provider, child) {
                return InkWell(
                  onTap: () {
                    if (provider.currentPage == 2) {
                      Navigator.pushReplacementNamed(context, '/welcomeScreen');
                    } else {
                      provider.nextPage(_pageController);
                    }
                  },
                  child: Container(
                    padding:  EdgeInsets.symmetric(
                        horizontal: Dimensions.horizontalSpacingLarge * 0.8),
                    decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        border: Border.all(color: AppColors.primaryColor),
                        borderRadius: BorderRadius.circular(Dimensions.radius)),
                    child: TextButton(
                      onPressed: () {
                        if (provider.currentPage == 2) {
                          Navigator.pushReplacementNamed(
                              context, '/welcomeScreen');
                        } else {
                          provider.nextPage(_pageController);
                        }
                      },
                      child: Text(
                        provider.currentPage == 2
                            ? AppStrings.finish
                            : AppStrings.next,
                        style:
                             const TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOnboardingPage({
    required String imagePath,
    required String title,
    required String description,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(AppAssets.callBg),
            Image.asset(imagePath),
          ],
        ),
         SizedBox(
          height: Dimensions.verticalSpacingLarge,
        ),
        Text(
          title,
          style:  TextStyle(
              fontSize: Dimensions.fontSizeLarge, fontWeight: FontWeight.bold),
        ),
         SizedBox(height: Dimensions.verticalSpacingLarge * 0.8),
        Padding(
          padding:  EdgeInsets.symmetric(
              horizontal: Dimensions.horizontalSpacingLarge),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: Dimensions.fontSizeLarge * 0.8,
                color: Colors.grey[600]),
          ),
        ),
      ],
    );
  }
}
