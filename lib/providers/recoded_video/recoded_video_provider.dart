import 'package:celebrity/core/utils/assets.dart';
import 'package:flutter/cupertino.dart';

class RecodedVideoProvider extends ChangeNotifier {
  final List<Map<String, String>> _videos = [
    {
      "name": "Prabhas",
      "subtitle": "Video Call",
      "image": AppAssets.profilePicture,
    },
    {
      "name": "Sai Dharam Tej",
      "subtitle": "Video bite",
      "image": AppAssets.profilePicture,
    },
  ];

  List<Map<String, String>> get videos => _videos;
}
