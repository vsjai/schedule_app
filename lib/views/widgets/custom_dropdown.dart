import 'package:flutter/material.dart';

import '../../app/constants.dart';

class CustomDropDown extends StatelessWidget {
  final List<String> list;
  final String hintText;
  const CustomDropDown({
    this.hintText = "",
    this.list = const [],
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DropdownMenu(
          hintText: hintText,
          dropdownMenuEntries:
              list.map((e) => DropdownMenuEntry(label: e, value: e)).toList()),
    );
  }
}

class CustomDropdown extends StatelessWidget {
  final List<String> list;
  final String? value;
  final String? hintText;
  final Function(String?)? onChanged;
  const CustomDropdown({
    required this.list,
    this.value,
    this.hintText,
    this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DropdownButtonFormField<String>(
        value: value,
        onChanged: onChanged,
        items: list.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        decoration: getInputDecoration(hintText),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select an option';
          }
          return null;
        },
      ),
    );
  }
}
