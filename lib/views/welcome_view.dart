import 'package:flutter/material.dart';
import 'package:mind_e/constants/color.dart';
import 'package:mind_e/constants/spaces.dart';
import 'package:mind_e/widgets/wlcome%20view%20widgets/name_box_widget.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: lightLimColor,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 70.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Happy to see you agin!",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: darkTiffanyColor,
              ),
            ),
            Text(
              "This app will aware you about your feeling to have better control",
            ),
            kV16,
            NameBoxWidget(),
          ],
        ),
      )),
    );
  }
}
