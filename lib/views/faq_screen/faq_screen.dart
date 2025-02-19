import 'package:celebrity/core/utils/app_color.dart';
import 'package:celebrity/core/utils/dimensions.dart';
import 'package:celebrity/core/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/faq/faq_provider.dart';

class FAQScreen extends StatelessWidget {
  final List<String> faqs =
      List.generate(5, (index) => "Lorem ipsum dolor sit amet?");

  FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding:  EdgeInsets.all(Dimensions.paddingSmall),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              AppStrings.faq,
              style: TextStyle(
                  fontSize: Dimensions.fontSizeLarge,
                  fontWeight: FontWeight.bold),
            ),
             SizedBox(height: Dimensions.verticalSpacingLarge),
            Expanded(
              child: Consumer<FAQProvider>(

                builder: (context, provider, child) {
                  return ListView.builder(
                    itemCount: faqs.length,
                    itemBuilder: (context, index) {
                      bool isExpanded = provider.isExpanded(index);
                      return Column(
                        children: [
                          ListTile(
                            title: Text(
                              faqs[index],
                              style:
                                   const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            trailing: Icon(isExpanded
                                ? Icons.expand_less
                                : Icons.expand_more),
                            onTap: () => provider.toggleExpansion(index),
                          ),
                          if (isExpanded)
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla facilisi.",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
