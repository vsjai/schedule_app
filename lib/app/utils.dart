import 'package:flutter/material.dart';

class Utils {
  static showSnackBar(BuildContext context, String content, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(content),
      backgroundColor: color,
    ));
  }
}
