import 'package:flutter/material.dart';
import 'package:insta_med_ui/theme/colors.dart'; 

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
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
            buildNotificationTile(
              'New Message',
              'You have received a new message from Dr. Smith.',
              Icons.message,
            ),
            buildNotificationTile(
              'Appointment Reminder',
              'Your appointment with Dr. Jane is tomorrow at 10:00 AM.',
              Icons.calendar_today,
            ),
            
          ],
        ),
      ),
    );
  }

  Widget buildNotificationTile(String title, String subtitle, IconData icon) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 6.0, 
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0), 
        leading: CircleAvatar(
          backgroundColor: AppColors.accentColor, 
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
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            subtitle,
            style: const TextStyle(
              fontSize: 16.0,
              color: AppColors.textColor,
            ),
          ),
        ),
        trailing: const Icon(Icons.chevron_right, color: AppColors.textColor),
        onTap: () {
          // Handle notification tap
        },
      ),
    );
  }
}
