import 'package:flutter/material.dart';

class SwitchRow extends StatelessWidget {
  const SwitchRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Switch(
            value: true,
            onChanged: (value) {},
          ),
          const Flexible(
            child: Text(
              "Schedule Online Meeting",
              style: TextStyle(overflow: TextOverflow.ellipsis),
            ),
          )
        ],
      ),
    );
  }
}
