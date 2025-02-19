import 'package:flutter/material.dart';
import '../../models/personal_meet_list.dart';
import 'event_widget.dart';

class PersonalMeetupWidget extends StatelessWidget {
  const PersonalMeetupWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: eventsList.length,
      itemBuilder: (context, index) {
        return EventBookingCard(
          imageUrl: eventsList[index].imageUrl,
          title: eventsList[index].title,
          dateTime: eventsList[index].dateTime,
          seatsLeft: eventsList[index].seatLeft,
        );
      },
    );
  }
}
