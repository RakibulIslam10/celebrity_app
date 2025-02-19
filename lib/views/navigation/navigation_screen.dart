import 'package:celebrity/core/utils/app_color.dart';
import 'package:celebrity/views/feeds/feeds_screen.dart';
import 'package:celebrity/views/main_profile/main_profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/navigation.dart';
import '../booking/booking_screen.dart';
import '../home/home_screen.dart';

class NavigationScreen extends StatelessWidget {
  final List<Widget> _screens = [
    const HomeScreen(),
    const FeedsScreen(),
    const BookingScreen(),
    //  ProfilePage(),
    ProfilePage()


  ];

   NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<NavigationProvider>(
        builder: (context, provider, child) {
          return _screens[provider.currentIndex];
        },
      ),
      bottomNavigationBar: Consumer<NavigationProvider>(
        builder: (context, provider, child) {
          return BottomNavigationBar(
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: AppColors.gray,
            showUnselectedLabels: true,
            backgroundColor: Colors.cyan,
            currentIndex: provider.currentIndex,
            onTap: (index) => provider.updateIndex(index),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.feed),
                label: 'Feed',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.book),
                label: 'Booking',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          );
        },
      ),
    );
  }
}
