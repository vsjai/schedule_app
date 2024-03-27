import 'package:flutter/material.dart';

class NormalCustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const NormalCustomButton(
      {super.key, required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 600,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            title,
            style: const TextStyle(fontSize: 14),
          )),
    );
  }
}
