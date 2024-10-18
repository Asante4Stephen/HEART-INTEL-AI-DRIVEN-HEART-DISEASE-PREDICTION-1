import 'package:flutter/material.dart';

class CenteredIconsInput extends StatelessWidget {
  const CenteredIconsInput({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Centers the row's children
          children: [
            Icon(Icons.menu), // First icon
            SizedBox(width: 10), // Space between icon and input field
            Expanded( // Expands the input field to take available space
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter text',
                ),
              ),
            ),
            SizedBox(width: 10), // Space between input field and second icon
            Icon(Icons.search), // Second icon
          ],
        ),
      ),
    );
  }
}

void main() => runApp(const MaterialApp(home: CenteredIconsInput()));
