import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:insta_med_ui/widgets/lib/src/theme/light_color.dart';
import 'package:insta_med_ui/widgets/lib/src/theme/text_styles.dart';
import 'package:insta_med_ui/widgets/resource.dart';
import '../screens/NotificationsScreen.dart';


class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  _HeaderWidgetState createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  late PageController _pageController;
  late Timer _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        int nextPage = _pageController.page!.toInt() + 1;
        if (nextPage >= 3) {
          nextPage = 0;
        }
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
        );
        setState(() {
          _currentPage = nextPage;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    String displayName = user?.displayName ?? user?.email ?? "User";

    const Color primaryColor = Color(0xFF004d99);
    const Color textColor = Color(0xFFFFFFFF);
    const Color buttonColor = Color(0xFF0073e6);
    const Color notificationIconColor = Color(0xFF000000);
    const Color avatarBackgroundColor = Color(0xFFB0B0B0);

    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 24.w,
                  backgroundImage: NetworkImage(
                    user?.photoURL ?? 'https://via.placeholder.com/150',
                  ),
                  backgroundColor: avatarBackgroundColor,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2.w),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello, $displayName!',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          color: notificationIconColor,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'Stay heart healthy!',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: 'Poppins',
                          color: notificationIconColor,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.notifications, size: 28.w),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NotificationsScreen()),
                    );
                  },
                  color: Colors.white,
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          _searchField(context),
          SizedBox(height: 16.h),
          Stack(
            children: [
              SizedBox(
                height: 120.h,
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  children: [
                    Image.asset(
                      'assets/images/image1.jpg',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/image2.jpg',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/image3.jpg',
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 8.h,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) {
                    return Container(
                      width: 8.w,
                      height: 8.h,
                      margin: EdgeInsets.symmetric(horizontal: 4.w),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentPage == index
                            ? Colors.white
                            : Colors.white.withOpacity(0.5),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.w),
            ),
            color: primaryColor,
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Monitor Your Heart',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: textColor,
                          ),
                        ),
                        Text(
                          'Regular check-ups help prevent heart disease.',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: textColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8.w),
                  ElevatedButton(
                    onPressed: () {
                      // Handle button press to open more information
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.w),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                    ),
                    child: const Text(
                      'check your heart',
                      style: TextStyle(color: textColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _searchField(BuildContext context) {
    return Container(
      height: 55,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: ColorResources.white,
        borderRadius: const BorderRadius.all(Radius.circular(13)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: ColorResources.grey.withOpacity(.3),
            blurRadius: 15,
            offset: const Offset(5, 5),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          border: InputBorder.none,
          hintText: "Search",
          hintStyle: TextStyles.body.copyWith(color: ColorResources.subTitleTextColor),
          suffixIcon: SizedBox(
            width: 50,
            child: const Icon(Icons.search, color: ColorResources.purple)
              .alignCenter
              .ripple(() {}, borderRadius: BorderRadius.circular(13)),
          ),
        ),
      ),
    );
  }
}
