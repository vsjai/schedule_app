import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

InputDecoration getInputDecoration([String? hintText = ""]) {
  return InputDecoration(
      hintText: hintText,
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.black)),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.black)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.black)),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(5)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.red)),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.black)));
}

double getRandomNumber() {
  Random random = Random();
  int randomNumber = random.nextInt(100) + 1;
  return randomNumber.toDouble();
}

final DateFormat inputFormat = DateFormat('yyyy-MM-dd');
final DateFormat outputFormat = DateFormat('dd MMM yyyy');

String convertDate(String dateString) {
  try {
    DateTime dateTime = inputFormat.parse(dateString);
    return outputFormat.format(dateTime);
  } catch (e) {
    return "";
  }
}
