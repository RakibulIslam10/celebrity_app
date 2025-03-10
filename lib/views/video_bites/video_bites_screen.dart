import 'package:celebrity/core/utils/app_color.dart';
import 'package:celebrity/core/utils/dimensions.dart';
import 'package:celebrity/core/utils/sized.dart';
import 'package:celebrity/core/utils/text_style.dart';
import 'package:celebrity/widgets/custom_widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import '../../widgets/input/search_text_fields.dart';
import '../../widgets/video_bites_widgets/video_bites_category_widget.dart';
import '../../widgets/video_bites_widgets/video_bites_widget.dart';

class VideoBitesScreen extends StatefulWidget {
  const VideoBitesScreen({super.key});

  @override
  State<VideoBitesScreen> createState() => _VideoBitesScreenState();
}

class _VideoBitesScreenState extends State<VideoBitesScreen> {
  int selectedTabIndex = 0;
  int selectedProfileIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: const PrimaryAppBar("Video Bites"),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _searchWidget(context),
              _tabBarWidget(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
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
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: _getBottomWidget(
                    selectedTabIndex, selectedProfileIndex),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _tabBarWidget() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimensions.verticalSpacingLarge * 0.5),
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

   _tabItem(String title, bool isSelected) {
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
}

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

  return const VideoBitesWidget();
}
