import 'package:flutter/material.dart';
import 'package:insta_med_ui/theme/colors.dart'; // Import your custom colors

class AppInfoScreen extends StatelessWidget {
  const AppInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'App Info',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        centerTitle: true, // Center the title
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            buildSectionHeader(context, 'General'),
            buildInfoTile('Version', '1.0.0', Icons.info_outline),
            buildSectionHeader(context, 'Legal'),
            buildInfoTile('Privacy Policy', null, Icons.lock_outline),
            buildInfoTile('Terms of Service', null, Icons.description_outlined),
            // Add more app info options here
          ],
        ),
      ),
    );
  }

  Widget buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
      ),
    );
  }

  Widget buildInfoTile(String title, String? subtitle, IconData icon) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 6.0, // Increased elevation for a stronger shadow
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0), // Rounded corners for the card
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0), // Add padding for content
        leading: CircleAvatar(
          backgroundColor: AppColors.accentColor, // Background color for the icon
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
        ),
        subtitle: subtitle != null
            ? Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: AppColors.textColor,
                  ),
                ),
              )
            : null,
        trailing: const Icon(Icons.chevron_right, color: AppColors.textColor),
        onTap: () {
          // Navigate to respective app info section
        },
      ),
    );
  }
}
