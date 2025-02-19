import 'package:celebrity/core/utils/assets.dart';
import 'package:flutter/cupertino.dart';

class TabProvider extends ChangeNotifier {
  int selectedTab = 0;
  List<Event> _events = [
    Event(
      id: "#A1234B56",
      title: "Ram Potheneni",
      description: "Video Call",
      dateTime: "Nov 5th | 7pm",
      price: 599,
      imageUrl: AppAssets.profile,
    ),
    Event(
      id: "#A1234B56",
      title: "Kalki Team",
      description: "Personal Meet Up's",
      dateTime: "Nov 5th | 7pm",
      location: "Shamshabad Mamidpally",
      price: 299,
      imageUrl: AppAssets.profile,
    ),
  ];

  List<Event> get events => _events;

  void setTab(int index) {
    selectedTab = index;
    // Logic for fetching events for the selected tab
    notifyListeners();
  }
}

class Event {
  final String id;
  final String title;
  final String description;
  final String dateTime;
  final String? location;
  final int price;
  final String imageUrl;

  Event({
    required this.id,
    required this.title,
    required this.description,
    required this.dateTime,
    this.location,
    required this.price,
    required this.imageUrl,
  });
}
