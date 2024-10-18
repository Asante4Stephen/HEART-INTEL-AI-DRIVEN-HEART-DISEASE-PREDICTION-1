import 'dart:convert';
import 'package:flutter/services.dart';

class LocalizationService {
  static late Map<String, dynamic> _localizedStrings;

  static Future<void> load(String locale) async {
    String jsonString = await rootBundle.loadString('assets/lang/$locale.json');
    _localizedStrings = jsonDecode(jsonString);
  }

  static String? translate(String key) {
    return _localizedStrings[key];
  }
}
