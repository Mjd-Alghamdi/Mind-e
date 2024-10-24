import 'package:flutter/material.dart';
import 'package:mind_e/constants/color.dart';

class ForYouWidget extends StatelessWidget {
  const ForYouWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 100,
          padding: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
            color: greyBlackColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10),
            ),
          ),
          child: const Text(
            "For you",
            textAlign: TextAlign.center,
            style: TextStyle(color: whiteColor, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(30),
          decoration: const BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: const Text(
            "Happy mind, Happy life :)",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
