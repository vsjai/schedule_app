import 'package:flutter/material.dart';

import '../../app/constants.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final VoidCallback? onTap;
  final bool readOnly;
  final TextEditingController? controller;
  const CustomTextField(
      {super.key,
      this.controller,
      required this.hintText,
      this.onTap,
      this.readOnly = false});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        controller: controller,
        onTap: onTap,
        readOnly: readOnly,
        decoration: getInputDecoration(hintText),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This field is required';
          }
          return null; // Return null if the input is valid
        },
      ),
    );
  }
}
