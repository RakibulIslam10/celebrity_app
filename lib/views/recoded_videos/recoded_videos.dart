import 'package:celebrity/core/utils/app_color.dart';
import 'package:celebrity/core/utils/dimensions.dart';
import 'package:celebrity/core/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/recoded_video/recoded_video_provider.dart';

class RecodedVideos extends StatelessWidget {
  const RecodedVideos({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RecodedVideoProvider(),
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {},
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Padding(
          padding:  EdgeInsets.symmetric(
              horizontal: Dimensions.horizontalSpacingLarge),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(AppStrings.Downloaded,
                  style: TextStyle(
                      fontSize: Dimensions.fontSizeLarge * 1.5,
                      fontWeight: FontWeight.bold)),
               Text(AppStrings.Videos,
                  style: TextStyle(
                      fontSize: Dimensions.fontSizeLarge * 1.5,
                      fontWeight: FontWeight.bold),),
               SizedBox(height: Dimensions.verticalSpacingLarge),
              Expanded(
                child: Consumer<RecodedVideoProvider>(
                  builder: (context, provider, child) {
                    return ListView.builder(
                      itemCount: provider.videos.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage(
                                    provider.videos[index]["image"]!),
                              ),
                              title: Text(
                                provider.videos[index]["name"]!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle:
                                  Text(provider.videos[index]["subtitle"]!),
                              trailing: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.pinkColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/kyc');
                                },
                                child: const Text(
                                  AppStrings.downloade,
                                  style: TextStyle(color: AppColors.whiteColor),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
