import 'package:celebrity/core/utils/app_color.dart';
import 'package:celebrity/providers/profile_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileCardProvider>(context);

    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: profileProvider.profiles.length,
      itemBuilder: (context, index) {
        final profile = profileProvider.profiles[index];
        return Card(
          color: AppColors.whiteColor,
          elevation: 1,
          child: ListTile(
            trailing: CircleAvatar(
              backgroundImage: AssetImage(
                profile['image']!, // Replace with your image URL
              ),
              radius: 24,
            ),
            title: Text(
              'Ram Pothineni',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Fans: ',
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextSpan(
                    text: '50k',
                    style: TextStyle(color: Colors.pink),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
