import 'package:celebrity/core/utils/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/video_call/video_call_provider.dart';

class CategoryTabs extends StatelessWidget {
  final List<String> categories = [
    "Tollywood",
    "Bollywood",
    "Kollywood",
    "Malayalam",
    "Sandalwood"
  ];


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: ChoiceChip(
              showCheckmark: false,
              selectedColor: AppColors.primaryColor,
              backgroundColor: AppColors.whiteColor,
              side: const BorderSide(color: AppColors.primaryColor),
              label: Text(
                category,
                style: TextStyle(
                  color: Provider.of<VideoCallProvider>(context).selectedCategory == category
                      ? AppColors.whiteColor
                      : AppColors.primaryTextColor,
                ),
              ),
              selected: Provider.of<VideoCallProvider>(context).selectedCategory == category,
              onSelected: (selected) {
                Provider.of<VideoCallProvider>(context, listen: false)
                    .selectedCategory = category;
                Provider.of<VideoCallProvider>(context, listen: false)
                    .notifyListeners();
              },
            ),

          );
        }).toList(),
      ),
    );
  }
}
