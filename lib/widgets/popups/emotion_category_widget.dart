import 'package:flutter/material.dart';
import 'package:mind_e/constants/color.dart';
import 'package:mind_e/widgets/small_card_info_widget.dart';

class EmotionCategoryWidget extends StatelessWidget {
  const EmotionCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SmallCardInfoWidget(
          content: "Happy",
          color: whiteColor,
          borderColor: lightPinkColor,
          borderWidth: 1,
        ),
        SmallCardInfoWidget(
          content: "Calm",
          color: whiteColor,
          borderColor: tiffanyColor,
          borderWidth: 1,
        ),
        SmallCardInfoWidget(
          content: "Sad",
          color: whiteColor,
          borderColor: greyColor,
          borderWidth: 1,
        ),
        SmallCardInfoWidget(
          content: "Anxious",
          color: whiteColor,
          borderColor: Colors.green,
          borderWidth: 1,
        ),
      ],
    );
  }
}
