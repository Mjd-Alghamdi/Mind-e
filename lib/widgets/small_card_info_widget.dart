import 'package:flutter/material.dart';

class SmallCardInfoWidget extends StatelessWidget {
  const SmallCardInfoWidget({
    super.key, required this.content, required this.color,
  });

  final String content;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: color,
      ),
      child: Text(
        content,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
