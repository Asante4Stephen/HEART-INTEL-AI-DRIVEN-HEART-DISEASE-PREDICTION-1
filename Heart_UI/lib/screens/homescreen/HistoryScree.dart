import 'package:flutter/material.dart';
import 'package:insta_med_ui/provider/HistoryProvider.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    Provider.of<HistoryProvider>(context, listen: false).loadHistory();

    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, '/home');
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('History'),
          backgroundColor: const Color(0xFF1259e4),
        ),
        body: Consumer<HistoryProvider>(
          builder: (context, historyProvider, child) {
            if (historyProvider.history.isEmpty) {
              return const Center(
                child: Text(
                  'No history available.',
                  style: TextStyle(fontSize: 16.0, color: Colors.grey),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: historyProvider.history.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.only(bottom: 16.0),
                    child: ListTile(
                      title: Text(historyProvider.history[index]),
                      contentPadding: const EdgeInsets.all(16.0),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
