import 'package:celebrity/core/utils/app_color.dart';
import 'package:celebrity/core/utils/dimensions.dart';
import 'package:celebrity/core/utils/sized.dart';
import 'package:celebrity/core/utils/text_style.dart';
import 'package:celebrity/widgets/custom_widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import '../../models/video_call_card_model.dart';
import '../../widgets/input/search_text_fields.dart';
import '../../widgets/video_bites_widgets/video_bites_category_widget.dart';
import '../../widgets/video_bites_widgets/video_bites_widget.dart';
import '../../widgets/video_call/video_call_card_widget.dart';

import 'package:celebrity/core/utils/app_color.dart';
import 'package:celebrity/core/utils/dimensions.dart';
import 'package:celebrity/core/utils/strings.dart';
import 'package:flutter/material.dart';

import '../../widgets/video_call/category_tabs.dart';
import '../../widgets/video_call/grid_card.dart';
import '../../widgets/video_call/heros_imagae.dart';

class VideoCallsScreen extends StatelessWidget {
  const VideoCallsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.whiteColor,
        automaticallyImplyLeading: true,
        title: const Text(AppStrings.videoCalls),
      ),
      body: Padding(
        padding:
        EdgeInsets.symmetric(horizontal: Dimensions.horizontalSpacingLarge),
        child: Column(
          children: [
            _inputWidget(),
            CategoryTabs(),
            HerosImagae(),
            Expanded(child: GridCard()),
          ],
        ),
      ),
    );
  }

  _inputWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Dimensions.verticalSpacingLarge),
      child: TextField(
        decoration: InputDecoration(
          hintText: AppStrings.search,
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.radius)),
        ),
      ),
    );
  }
}
