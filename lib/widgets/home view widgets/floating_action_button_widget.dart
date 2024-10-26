import 'package:flutter/material.dart';
import 'package:mind_e/constants/color.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        color: limColor,
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.add,
        size: 30,
        color: greyBlackColor,
      ),
    );
  }
}
