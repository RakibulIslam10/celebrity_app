// ProfileCategoryList now updates based on clicks
import 'package:celebrity/core/utils/app_color.dart';
import 'package:celebrity/core/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileCategoryList extends StatefulWidget {
  final Function(int) onCategorySelected;

  const ProfileCategoryList({required this.onCategorySelected, Key? key})
      : super(key: key);

  @override
  _ProfileCategoryListState createState() => _ProfileCategoryListState();
}

class _ProfileCategoryListState extends State<ProfileCategoryList> {
  int selectedIndex = 0;

  final List<Map<String, String>> categories = [
    {"title": "Hero", "image": "assets/images/ram_charan.png"},
    {"title": "Heroin", "image": "assets/images/samantha.png"},
    {"title": "Comedian", "image": "assets/images/comidian.png"},
    {"title": "Singer", "image": "assets/images/singer.png"},
    {"title": "Director", "image": "assets/images/director.png"},
    {"title": "Dancer", "image": "assets/images/dancer.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.horizontalSpacingLarge * 0.5),

        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          bool isSelected = selectedIndex == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              widget.onCategorySelected(index);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      if (isSelected)
                        const CircularProgressIndicator(
                          color: AppColors.primaryColor,
                          strokeWidth: 2,
                          backgroundColor: Colors.black,
                          value: 80,
                        ),
                      CircleAvatar(
                        child: Container(
                          width: Dimensions.widthSize * 6,
                          height: Dimensions.widthSize * 6,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(categories[index]["image"]!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    categories[index]["title"]!,
                    style: GoogleFonts.poppins(
                      fontSize: Dimensions.fontSizeExtraSmall,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primaryTextColor,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
