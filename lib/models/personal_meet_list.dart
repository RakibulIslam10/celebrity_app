class PersonalMeetModel {
  final String imageUrl, seatLeft, title, dateTime;

  PersonalMeetModel({
    required this.imageUrl,
    required this.seatLeft,
    required this.title,
    required this.dateTime,
  });
}

List<PersonalMeetModel> eventsList = [
  PersonalMeetModel(
    imageUrl: "assets/images/personal_meet2.png",
    seatLeft: "Only 20 seats left",
    title: "Lunch with Celebrity ",
    dateTime: "Nov 5th | 7pm Shamshabad Ma......",
  ),
  PersonalMeetModel(
    imageUrl: "assets/images/personal_meet1.png",
    seatLeft: "Only 20 seats left",
    title: "Kalki team",
    dateTime: "Nov 5th | 7pm Shamshabad Ma......",
  )
];
