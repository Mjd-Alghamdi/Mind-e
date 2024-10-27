import 'package:flutter/material.dart';
import 'package:mind_e/constants/color.dart';

class SmallCardInfoWidget extends StatelessWidget {
  const SmallCardInfoWidget({
    super.key,
    required this.content,
    required this.color,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0,
  });

  final String content;
  final Color color;
  final Color? borderColor;
  final double? borderWidth;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: content == "Happy"
            ? lightPinkColor
            : content == "Calm"
                ? darkTiffanyColor
                : content == "Sad"
                    ? greyColor
                    : content == "Anxious"
                        ? Colors.green.shade300
                        : color,
        border: Border.all(color: borderColor!, width: borderWidth!),
      ),
      child: Text(
        content,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: content == "Sad" ||
                  content == "Happy" ||
                  content == "Calm" ||
                  content == "Anxious"
              ? whiteColor
              : greyBlackColor,
        ),
      ),
    );
  }
}
