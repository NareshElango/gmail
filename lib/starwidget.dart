import 'package:flutter/material.dart';

class starwidget extends StatelessWidget {
  const starwidget({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Draggable<String>(
      data: label,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.yellow, borderRadius: BorderRadius.circular(6)),
        child: Text(label),
      ),
      feedback: Material(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.yellow.withOpacity(0.7),
              borderRadius: BorderRadius.circular(8)),
          child: Text(label),
        ),
      ),
      childWhenDragging: Container(),
    );
  }
}
