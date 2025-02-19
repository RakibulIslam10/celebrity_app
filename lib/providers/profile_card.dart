import 'package:flutter/material.dart';

import '../core/utils/assets.dart';

class ProfileCardProvider with ChangeNotifier {
  final List<Map<String, String>> _profiles = [
    {
      'name': 'Ram Pothineni',
      'fans': '50k',
      'image': AppAssets.profile,
    },
    {
      'name': 'Vijay Devarakonda',
      'fans': '100k',
      'image': AppAssets.profile,
    },
    {
      'name': 'Allu Arjun',
      'fans': '200k',
      'image': AppAssets.profile,
    },
    {
      'name': 'Ram Charan',
      'fans': '200k',
      'image': AppAssets.profile,
    },
  ];

  List<Map<String, String>> get profiles => _profiles;
}
