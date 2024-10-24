import 'package:flutter/material.dart';
import 'package:mind_e/constants/color.dart';
import 'package:mind_e/constants/spaces.dart';

class CustomPlaceholder extends StatelessWidget {
  const CustomPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: IntrinsicHeight(
        child: Column(
          children: [
            Icon(
              Icons.wb_incandescent_outlined,
              size: 60,
              color: lightTiffanyColor,
            ),
            kV16,
            Text(
              "No Feeling Recorded yet ! :)",
              style: TextStyle(
                fontSize: 16,
                color: greyColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
