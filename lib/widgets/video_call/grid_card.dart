import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/utils/app_color.dart';
import '../../core/utils/assets.dart';
import '../../core/utils/dimensions.dart';

class GridCard extends StatelessWidget {
  final List<Map<String, String>> actors = [
    {"name": "Mahesh Babu", "price": "\$999"},
    {"name": "Allu Arjun", "price": "\$999"},
    {"name": "Prabhas", "price": "\$999"},
    {"name": "Ram Charan", "price": "\$599"},
    {"name": "NTR", "price": "\$599"},
    {"name": "Ram", "price": "\$599"},
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: actors.length,
      itemBuilder: (context, index) {
        return ActorCard(
          name: actors[index]['name']!,
          price: actors[index]['price']!,
        );
      },
    );
  }
}

class ActorCard extends StatelessWidget {
  final String name;
  final String price;

  ActorCard({required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.whiteColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 175,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppAssets.gridImage), fit: BoxFit.cover)),
          ),
          SizedBox(height: 10),
          Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(price, style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
