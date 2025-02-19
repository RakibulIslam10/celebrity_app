// import 'package:celebrity/core/utils/app_color.dart';
// import 'package:celebrity/core/utils/dimensions.dart';
// import 'package:celebrity/core/utils/strings.dart';
// import 'package:celebrity/core/utils/text_style.dart';
// import 'package:celebrity/widgets/custom_widget/custom_appbar.dart';
// import 'package:flutter/material.dart';
// import '../../widgets/input/search_text_fields.dart';
// import '../../widgets/personal_meetup_widget/personal_meetup_widget.dart';

// class PersonalMeetupDetailsScreen extends StatelessWidget {
//   const PersonalMeetupDetailsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 5,
//       child: Scaffold(
//         appBar:  const PrimaryAppBar(AppStrings.personalMeedUpDetailsScreen),
//         body: Column(
//           children: [
//             _searchWidget(context),
//             _tabBarWidget(), // Custom Styled Tab Bar
//             const Expanded(
//               child: TabBarView(
//                 children: [
//                   PersonalMeetupWidget(),
//                   PersonalMeetupWidget(),
//                   PersonalMeetupWidget(),
//                   PersonalMeetupWidget(),
//                   PersonalMeetupWidget(),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   _tabBarWidget() {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSmall),
//       child: TabBar(
//         indicatorColor: AppColors.backgroundColor,
//         dividerColor: AppColors.backgroundColor,
//         isScrollable: true,
//         labelColor: Colors.white,
//         // unselectedLabelColor: Colors.black,
//         indicatorSize: TabBarIndicatorSize.tab,
//         indicatorPadding: EdgeInsets.zero,
//         labelPadding: const EdgeInsets.symmetric(horizontal: 4),
//         tabs: [
//           _tabItem("Tollywood", true),
//           _tabItem("Bollywood", false),
//           _tabItem("Kollywood", false),
//           _tabItem("Malayalam", false),
//           _tabItem("Sandalwood", false),
//         ],
//       ),
//     );
//   }

//   Widget _tabItem(String title, bool isSelected) {
//     return Container(
//       padding: const EdgeInsets.symmetric(
//           vertical: Dimensions.paddingSmall * 0.6, horizontal: 13),
//       decoration: BoxDecoration(
//         color: isSelected ? AppColors.primaryColor : Colors.transparent,
//         border: Border.all(color: AppColors.primaryColor),
//         borderRadius: BorderRadius.circular(Dimensions.radius),
//       ),
//       child: Text(
//         title,
//         style: AppTextStyles.subtitle.copyWith(
//           color: isSelected ? AppColors.whiteColor : Colors.black,
//         ),
//       ),
//     );
//   }

//   _searchWidget(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(
//         left: Dimensions.paddingLarge,
//         right: Dimensions.paddingLarge,
//         bottom: Dimensions.paddingMedium,
//       ),
//       child: SearchTextField(),
//     );
//   }
// }
