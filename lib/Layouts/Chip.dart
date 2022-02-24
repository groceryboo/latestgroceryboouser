import 'package:flutter/material.dart';
import 'package:groceryboouser/Styles/my_colors.dart';

class ChipLayout extends StatelessWidget {
  final String label;
  final ValueChanged<int> onDeleted;
  final int index;
  const ChipLayout({
    @required this.label,
    @required this.onDeleted,
    @required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      labelPadding: const EdgeInsets.only(left: 8.0),
      backgroundColor: Colors.white,
      label: Text(label),
      deleteIcon: Container(
        height: 26,
        width: 26,
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: Colors.grey.withOpacity(0.2)),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Icon(
            Icons.close,
            color: skygreen_24d39e,
            size: 15,
          ),
        ),
      ),
      onDeleted: () {
        onDeleted(index);
      },
    );
  }
}
