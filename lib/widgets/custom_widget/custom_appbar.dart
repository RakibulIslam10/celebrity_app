import 'package:celebrity/core/utils/app_color.dart';
import 'package:celebrity/core/utils/text_style.dart';
import 'package:flutter/material.dart';

import '../../core/utils/dimensions.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PrimaryAppBar(
    this.title, {
    Key? key,
    this.backgroundColor,
    this.elevation = 0,
    this.autoLeading = false,
    this.showBackButton = true,
    this.centerTitle = false,
    this.action,
    this.leading,
    this.bottom,
    this.toolbarHeight,
    this.appbarSize,
  }) : super(key: key);

  final String title;
  final Color? backgroundColor;
  final double elevation;
  final List<Widget>? action;
  final Widget? leading;
  final bool autoLeading;
  final bool showBackButton;
  final bool centerTitle;
  final PreferredSizeWidget? bottom;
  final double? toolbarHeight;
  final double? appbarSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      title: Text(
        title,
        style: AppTextStyles.title,
      ),
      actions: action,
      bottom: bottom,
      elevation: elevation,
      toolbarHeight: toolbarHeight,
      scrolledUnderElevation: 0,
      leading: Padding(
        padding: EdgeInsets.only(
          left: Dimensions.paddingSmall * 2.5,
        ),
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back,
              color: Colors.black), // Customize color if needed
        ),
      ),
      backgroundColor: backgroundColor ?? AppColors.primaryButtonTextColor,
      automaticallyImplyLeading: autoLeading,
    );
  }

  @override
  // Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
  Size get preferredSize =>
      Size.fromHeight(appbarSize ?? Dimensions.appBarHeight);
}
