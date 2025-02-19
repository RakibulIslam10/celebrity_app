
import 'package:flutter/cupertino.dart';

class VideoCallProvider extends ChangeNotifier {
  String selectedCategory = "Tollywood";
  String selectedRole = "Hero";


  int callDuration = 0;

  void updateDuration(int seconds) {
    callDuration = seconds;
    notifyListeners();
  }

}