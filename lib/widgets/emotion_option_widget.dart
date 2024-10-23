import 'package:flutter/material.dart';
import 'package:mind_e/constants/color.dart';

class EmotionOptionWidget extends StatelessWidget {
  const EmotionOptionWidget({
    super.key,
    required this.emotionType,
  });

  final String emotionType;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: emotionType != "All" ? greyBlackColor : tiffanyColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        emotionType,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: emotionType != "All" ? whiteColor : greyBlackColor,
        ),
      ),
    );
  }
}
