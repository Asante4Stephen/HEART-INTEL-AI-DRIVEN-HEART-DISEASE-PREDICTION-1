import 'package:flutter/material.dart';
import 'package:insta_med_ui/theme/colors.dart'; // Assuming you have custom colors defined here

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Help',
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
            buildHelpTile(context, 'FAQ', Icons.question_answer_outlined),
            buildHelpTile(context, 'Contact Support', Icons.support_agent_outlined),
           
          ],
        ),
      ),
    );
  }

  Widget buildHelpTile(BuildContext context, String title, IconData icon) {
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
        trailing: const Icon(Icons.chevron_right, color: AppColors.textColor),
        onTap: () {
          // Navigate to respective help section
        },
      ),
    );
  }
}
