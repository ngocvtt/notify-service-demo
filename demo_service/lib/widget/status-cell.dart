import 'package:flutter/material.dart';

class StatusCell extends StatelessWidget {
  final String name;
  final Color color;
  final Color background;

  const StatusCell({
    Key? key,
    required this.name,
    required this.color,
    required this.background,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: background),
      child: Text(
        name,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}
