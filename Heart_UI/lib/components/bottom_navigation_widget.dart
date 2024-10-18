import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:insta_med_ui/screens/homescreen/ChatScreen.dart';
import 'package:insta_med_ui/screens/homescreen/HistoryScree.dart';

import 'package:insta_med_ui/screens/homescreen/profile.dart';

import 'package:insta_med_ui/screens/home_screen.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({super.key});

  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const HistoryScreen(),
    const ChatScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.r),
            topRight: Radius.circular(25.r),
          ),
          color: Colors.blue, // Use a single solid color
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
          child: CurvedNavigationBar(
            height: 65.h,
            items: <Widget>[
              _buildNavItem(Icons.home, "Home", 0),
              _buildNavItem(Icons.history, "History", 1),
              _buildNavItem(Icons.chat, "Chat", 2),
              _buildNavItem(Icons.person, "Profile", 3),
            ],
            color: Colors.blue, // Use the same solid blue color here
            // buttonBackgroundColor: Colors.blueAccent.withOpacity(
            //     0.8), // Slightly different blue for the button background
            backgroundColor: Colors.transparent,
            animationCurve: Curves.easeInOut,
            animationDuration: const Duration(milliseconds: 600),
            onTap: _onItemTapped,
            letIndexChange: (index) => true,
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    bool isSelected = _currentIndex == index;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 28.sp,
          color: isSelected
              ? Colors.white
              : Colors
                  .grey[200], // White for selected, light grey for unselected
        ),
        if (isSelected)
          Padding(
            padding: EdgeInsets.only(top: 4.h),
            child: Container(
              height: 3.h,
              width: 22.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),
      ],
    );
  }
}
