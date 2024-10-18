import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryProvider with ChangeNotifier {
  List<String> _history = [];

  List<String> get history => _history;

  Future<void> loadHistory() async {
    final prefs = await SharedPreferences.getInstance();
    _history = prefs.getStringList('history') ?? [];
    notifyListeners();
  }

  Future<void> addResult(String result) async {
    final prefs = await SharedPreferences.getInstance();
    _history.insert(0, '$result - ${DateTime.now().toLocal()}');
    await prefs.setStringList('history', _history);
    notifyListeners();
  }

  Future<void> clearHistory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('history');
    _history.clear();
    notifyListeners();
  }
  
}
