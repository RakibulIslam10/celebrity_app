import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/utils/app_color.dart';
import '../../core/utils/assets.dart';
import '../../core/utils/dimensions.dart';
import '../../core/utils/strings.dart';
import '../../core/utils/text_style.dart';
import '../../providers/main_profile/main_profile.dart';

class ProfilePage extends StatelessWidget {
   const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          _profileWidget(),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading:  const Text(
                    AppStrings.Notifications,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  trailing: Consumer<MainProfile>(
                    builder: (context, notificationProvider, child) {
                      return Switch(
                        value: notificationProvider.isNotificationEnabled,
                        onChanged: (value) {
                          notificationProvider.toggleNotification();
                        },
                        activeColor: Colors.green,
                      );
                    },
                  ),
                ),
                _buildListTile(
                  onTap: () {
                    Navigator.pushNamed(context, '/fanCard');
                  },
                  AppStrings.fancard,
                ),
                _buildListTile(
                  onTap: () {
                    Navigator.pushNamed(context, '/recodedVideosScreen');
                  },
                  AppStrings.recodedVideos,
                ),
                _buildListTile(
                  onTap: () {
                    Navigator.pushNamed(context, '/kyc');
                  },
                  AppStrings.kycVerification,
                  trailing:  const Icon(Icons.check_circle, color: Colors.green),
                ),
                _buildListTile(
                  AppStrings.contactUs,
                  onTap: () {
                    Navigator.pushNamed(context, '/contactUS');
                  },
                ),
                _buildListTile(
                  AppStrings.AboutUs,
                  onTap: () {
                    Navigator.pushNamed(context, '/aboutScreen');
                  },
                ),
                _buildListTile(
                  AppStrings.faq,
                  onTap: () {
                    Navigator.pushNamed(context, '/faq');
                  },
                ),
                _buildListTile(
                  AppStrings.termsAndCondition,
                  onTap: () {
                    Navigator.pushNamed(context, '/terms');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _profileWidget() {
    return Stack(
      children: [
        Padding(
          padding:  const EdgeInsets.only(left: 25.0),
          child: CustomPaint(
            size:  const Size(600, 320),
            // Change width & height dynamically
            painter: CustomShape(),
          ),
        ),
        Padding(
          padding:
               EdgeInsets.only(top: Dimensions.verticalSpacingLarge * 2),
          child: Column(
            children: [
              _actionWidget(),
               SizedBox(height: Dimensions.verticalSpacingLarge * 0.5),
               const Text(
                'Ravi Kumar',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
               const SizedBox(height: 5),
               Text(
                '+91 9658965896',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: Dimensions.fontSizeSmall,
                ),
              ),
               const SizedBox(height: 5),
               Text(
                'ravikumar@gmail.com',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: Dimensions.fontSizeSmall,
                ),
              ),
               SizedBox(height: Dimensions.verticalSpacingLarge * 0.5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                      AppAssets.profilePicture,
                    ),
                  ),
                  Container(
                    margin:  EdgeInsets.only(
                        left: Dimensions.horizontalSpacingLarge,
                        right: Dimensions.horizontalSpacingLarge * 3.5),
                    decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(Dimensions.radius)),
                    padding:  EdgeInsets.symmetric(
                        horizontal: Dimensions.horizontalSpacingLarge * 0.4,
                        vertical: Dimensions.verticalSpacingLarge * 0.3),
                    child:  Text(
                      AppStrings.editProfile,
                      style: TextStyle(
                          fontSize: Dimensions.fontSizeSmall,
                          color: AppColors.pinkColor,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  _actionWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
            padding:  EdgeInsets.all(Dimensions.paddingSmall),
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
          margin:  EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSmall * 2),
          padding:  EdgeInsets.all(Dimensions.paddingSmall),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius),
              color: AppColors.hintColor),
          child:  const Icon(
            Icons.notifications,
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }

  _buildListTile(String title, {Widget? trailing, VoidCallback? onTap}) {
    return ListTile(
        leading: Text(
          title,
          style:  const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        trailing:
            trailing ??  const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: onTap);
  }
}

class CustomShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width;
    double height = size.height;
    Path path_0 = Path();
    path_0.moveTo(width * 0.031, height * 0.897);
    path_0.cubicTo(width * -0.011, height * 0.809, width * -0.009,
        height * 0.695, width * 0.038, height * 0.609);
    path_0.lineTo(width * 0.434, height * -0.105);
    path_0.cubicTo(width * 0.548, height * -0.311, width * 0.765,
        height * -0.368, width * 0.933, height * -0.236);
    path_0.lineTo(width, height * -0.181);
    path_0.cubicTo(width * 1.272, height * 0.033, width * 1.229, height * 0.573,
        width * 0.933, height * 0.713);
    path_0.lineTo(width * 0.262, height);
    path_0.cubicTo(width * 0.176, height * 1.039, width * 0.081, height * 0.996,
        width * 0.031, height * 0.897);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color =  const Color(0xffD032A4).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
