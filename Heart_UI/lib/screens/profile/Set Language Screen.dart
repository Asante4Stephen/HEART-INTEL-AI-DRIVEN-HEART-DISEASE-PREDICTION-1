import 'package:flutter/material.dart';

class SetLanguageScreen extends StatelessWidget {
  final Function(Locale) onLocaleChange;

  const SetLanguageScreen({super.key, required this.onLocaleChange});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Set Language'),
        backgroundColor: const Color(0xFF1259e4),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            buildLanguageTile(context, 'en', 'English'),
            buildLanguageTile(context, 'es', 'Spanish'),
            
          ],
        ),
      ),
    );
  }

  Widget buildLanguageTile(BuildContext context, String localeCode, String language) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 4.0,
      child: ListTile(
        title: Text(language, style: const TextStyle(fontSize: 18.0)),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: () {
          onLocaleChange(Locale(localeCode)); 
        },
      ),
    );
  }
}
