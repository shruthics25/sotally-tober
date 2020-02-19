import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

Future<String> loadBaseURL() async {
  String raw = await rootBundle.loadString('assets/config.json');
  Map result = json.decode(raw);
  return result["apiUrl"];
}