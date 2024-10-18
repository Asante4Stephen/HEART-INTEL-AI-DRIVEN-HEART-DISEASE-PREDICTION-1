import 'package:flutter/material.dart';
import 'package:insta_med_ui/components/Bottom Info Section.dart';
import 'package:insta_med_ui/components/Consultation Section.dart';
import 'package:insta_med_ui/components/LocationSelector.dart';
import 'package:insta_med_ui/components/Popular Doctors Section.dart';
import 'package:insta_med_ui/components/Top Hospitals Section.dart';

class MainContent extends StatefulWidget {
  const MainContent({super.key});

  @override
  _MainContentState createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> with SingleTickerProviderStateMixin {
  int _currentIndex = 0; // Track the selected tab index

  final List<Widget> _screens = [
    const InputScreen(),
    const HistoryScreen(),
    const ProfileScreen(),
  ];

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex], // Display the selected screen
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index != _currentIndex) {
            setState(() {
              _currentIndex = index; // Update the current index on tap
              _animationController.forward().then((_) {
                _animationController.reverse();
              });
            });
          }
        },
        animation: _animation,
      ),
    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final Animation<double> animation;

  const CustomBottomNavBar({super.key, 
    required this.currentIndex,
    required this.onTap,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: CustomNavBarClipper(),
          child: Container(
            color: Colors.blue,
            child: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: onTap,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.input, size: 28),
                  label: 'Input',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.history, size: 28),
                  label: 'History',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person, size: 28),
                  label: 'Profile',
                ),
              ],
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white70,
              backgroundColor: Colors.transparent,
              elevation: 0,
              selectedFontSize: 14,
              unselectedFontSize: 12,
            ),
          ),
        ),
        AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return Positioned(
              bottom: 0,
              left: (MediaQuery.of(context).size.width / 3) * currentIndex,
              child: Container(
                width: MediaQuery.of(context).size.width / 3,
                height: 5 + (5 * animation.value), // Adjust the height to animate
                color: Colors.white,
              ),
            );
          },
        ),
      ],
    );
  }
}

class CustomNavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(size.width * 0.75, 0);
    path.quadraticBezierTo(size.width * 0.6, size.height * 0.15,
        size.width * 0.4, size.height * 0.2);
    path.quadraticBezierTo(size.width * 0.2, size.height * 0.25, 0,
        size.height * 0.2);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// Placeholder screens for each tab
class InputScreen extends StatelessWidget {
  const InputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LocationSelector(),
                SizedBox(height: 20),
                SearchBar(),
                SizedBox(height: 20),
                ConsultationSection(),
                SizedBox(height: 20),
              
                PopularDoctorsSection(),
                SizedBox(height: 20),
                TopHospitalsSection(),
              ],
            ),
          ),
          BottomInfoSection(),
        ],
      ),
    );
  }
}

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'History',
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Profile',
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
