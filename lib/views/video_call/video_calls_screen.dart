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

class VideoCallsScreen extends StatefulWidget {
  const VideoCallsScreen({super.key});

  @override
  State<VideoCallsScreen> createState() => _VideoBitesScreenState();
}

class _VideoBitesScreenState extends State<VideoCallsScreen> {
  int selectedTabIndex = 0; // Track which TabBar category is selected
  int selectedProfileIndex =
      0; // Track which ProfileCategoryList item is selected

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: const PrimaryAppBar("Video Calls"),
        body: Column(
          children: [
            _searchWidget(context),
            _tabBarWidget(),
            Expanded(
              child: Column(
                children: [
                  verticalSpace(Dimensions.heightSize * 1.5),
                  Expanded(
                    flex: 1, // Adjust for size
                    child: TabBarView(
                      children: List.generate(5, (tabIndex) {
                        return ProfileCategoryList(
                          onCategorySelected: (profileIndex) {
                            setState(() {
                              selectedTabIndex = tabIndex;
                              selectedProfileIndex = profileIndex;
                            });
                          },
                        );
                      }),
                    ),
                  ),
                  Expanded(
                    flex: 5, // Bottom widget area
                    child: _getBottomWidget(
                        selectedTabIndex, selectedProfileIndex),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _tabBarWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSmall),
      child: TabBar(
        indicatorColor: AppColors.backgroundColor,
        dividerColor: AppColors.backgroundColor,
        isScrollable: true,
        labelColor: Colors.white,
        // unselectedLabelColor: Colors.black,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: EdgeInsets.zero,
        labelPadding: const EdgeInsets.symmetric(horizontal: 4),
        tabs: [
          _tabItem("Tollywood", true),
          _tabItem("Bollywood", false),
          _tabItem("Kollywood", false),
          _tabItem("Malayalam", false),
          _tabItem("Sandalwood", false),
        ],
      ),
    );
  }

  Widget _tabItem(String title, bool isSelected) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: Dimensions.paddingSmall * 0.6, horizontal: 13),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryColor : Colors.transparent,
        border: Border.all(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(Dimensions.radius),
      ),
      child: Text(
        title,
        style: AppTextStyles.subtitle.copyWith(
          color: isSelected ? AppColors.whiteColor : Colors.black,
        ),
      ),
    );
  }

  _searchWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: Dimensions.paddingLarge,
        right: Dimensions.paddingLarge,
        bottom: Dimensions.paddingMedium,
      ),
      child: const SearchTextField(),
    );
  }

// Dynamically change bottom widget based on Tab and Profile selection
  Widget _getBottomWidget(int tabIndex, int profileIndex) {
    Map<int, List<String>> tabProfiles = {
      0: [
        "Tollywood Hero",
        "Tollywood Heroin",
        "Tollywood Comedian",
        "Tollywood Singer"
      ],
      1: [
        "Bollywood Hero",
        "Bollywood Heroin",
        "Bollywood Comedian",
        "Bollywood Singer"
      ],
      2: [
        "Kollywood Hero",
        "Kollywood Heroin",
        "Kollywood Comedian",
        "Kollywood Singer"
      ],
      3: [
        "Malayalam Hero",
        "Malayalam Heroin",
        "Malayalam Comedian",
        "Malayalam Singer"
      ],
      4: [
        "Sandalwood Hero",
        "Sandalwood Heroin",
        "Sandalwood Comedian",
        "Sandalwood Singer"
      ],
    };

    String title = tabProfiles[tabIndex]
            ?[profileIndex % tabProfiles[tabIndex]!.length] ??
        "No Data";

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/videoCallBookingScreen");
      },
      child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.horizontalSpacingLarge * 0.5),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          childAspectRatio: 0.8,
        ),
        itemCount: celebrities.length,
        itemBuilder: (context, index) {
          return CelebrityCard(
            name: celebrities[index]['name']!,
            imageUrl: celebrities[index]['image']!,
          );
        },
      ),
    );
  }
}
