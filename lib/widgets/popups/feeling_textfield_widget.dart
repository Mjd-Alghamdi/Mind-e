import 'package:flutter/material.dart';
import 'package:mind_e/constants/color.dart';

class FeelingTextfieldWidget extends StatelessWidget {
  const FeelingTextfieldWidget({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: 3,
      decoration: const InputDecoration(
        hintText: "Feeling good today because ...",
        hintStyle: TextStyle(fontSize: 13, color: mediumLightGreyColor),
        border: OutlineInputBorder(),
      ),
    );
  }
}
