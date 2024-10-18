import 'package:flutter/material.dart';
import 'package:insta_med_ui/provider/LocaleProvider.dart';
import 'package:insta_med_ui/screens/profile/Set%20Language%20Screen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:insta_med_ui/screens/NotificationsScreen.dart';
import 'package:insta_med_ui/screens/profile/AppInfoScreen.dart';
import 'package:insta_med_ui/screens/profile/ChangePasswordScreen.dart';
import 'package:insta_med_ui/screens/profile/HelpScreen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    String displayName = user?.displayName ?? user?.email ?? "User";
    String photoUrl = user?.photoURL ?? 'https://via.placeholder.com/150';

    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, '/home');
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Account'),
          backgroundColor: const Color(0xFF1259e4),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundImage: NetworkImage(photoUrl),
                backgroundColor: Colors.grey[200],
              ),
              const SizedBox(height: 16.0),
              Text(
                displayName,
                style: const TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                user?.email ?? '',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 24.0),
              Expanded(
                child: ListView(
                  children: [
                    buildListTile(
                      context,
                      icon: Icons.notifications,
                      title: 'Notifications',
                      screen: const NotificationsScreen(),
                    ),
                    buildListTile(
                      context,
                      icon: Icons.lock,
                      title: 'Change Password',
                      screen: const ChangePasswordScreen(),
                    ),
                    buildListTile(
                      context,
                      icon: Icons.language,
                      title: 'Set Language',
                      screen: SetLanguageScreen(
                        onLocaleChange: (Locale locale) {
                          Provider.of<LocaleProvider>(context, listen: false)
                              .setLocale(locale);
                        },
                      ),
                    ),
                    buildListTile(
                      context,
                      icon: Icons.help,
                      title: 'Help',
                      screen: const HelpScreen(),
                    ),
                    buildListTile(
                      context,
                      icon: Icons.info,
                      title: 'App Info',
                      screen: const AppInfoScreen(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  try {
                    await FirebaseAuth.instance.signOut();
                    Navigator.pushReplacementNamed(context, '/login');
                  } catch (e) {
                    print("Error signing out: $e");
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xFF1259e4),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                  textStyle: const TextStyle(fontSize: 16.0),
                ),
                child: const Text('Log Out'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildListTile(BuildContext context,
      {required IconData icon, required String title, required Widget screen}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 4.0,
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF1259e4)),
        title: Text(title, style: const TextStyle(fontSize: 18.0)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16.0, color: Colors.grey),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },
      ),
    );
  }
}
