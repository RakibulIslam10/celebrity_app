import 'package:flutter/material.dart';
import '../../core/utils/dimensions.dart';
import '../../models/video_bites_model.dart';
import 'video_bite_catgory_widget.dart';

class VideoBitesWidget extends StatelessWidget {
  const VideoBitesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding:
          EdgeInsets.symmetric(horizontal: Dimensions.horizontalSpacingMedium),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.7,
      ),
      itemCount: videoBitesHeros.length,
      itemBuilder: (context, index) {
        return CustomProfileCard(
          imageUrl: videoBitesHeros[index].imageUrl,
          name: videoBitesHeros[index].name,
          price: videoBitesHeros[index].price,
          onTap: () {
            Navigator.pushNamed(context, '/videoBitesBookScreen');
          },
        );
      },
    );
  }
}
