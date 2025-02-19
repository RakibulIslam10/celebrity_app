import 'package:celebrity/core/utils/assets.dart';
import 'package:celebrity/core/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/video_call/video_call_provider.dart';

class VideoCallScreen extends StatelessWidget {
  const VideoCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final callProvider = Provider.of<VideoCallProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AppAssets.calling,
              fit: BoxFit.cover,
            ),
          ),
          const Positioned(
            top: 40,
            left: 20,
            child: Row(
              children: [
                Icon(Icons.fiber_manual_record, color: Colors.red, size: 14),
                SizedBox(width: 5),
                Text(AppStrings.REC, style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: Text(
              '${callProvider.callDuration ~/ 60}:${(callProvider.callDuration % 60).toString().padLeft(2, '0')}',
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/ThankYouScreen',
                    (route) => false,
                  );
                },
                child: const CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 30,
                  child: Icon(Icons.call_end, color: Colors.white, size: 28),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 80,
            left: 20,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                AppAssets.callingImg,
                width: MediaQuery.of(context).size.height * 0.15,
                height: MediaQuery.of(context).size.height * 0.2,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
