import 'package:flutter/material.dart';
import 'package:mind_e/constants/color.dart';
import 'package:mind_e/constants/spaces.dart';
import 'package:mind_e/widgets/custom_appbar_widget.dart';
import 'package:mind_e/widgets/filter_widget.dart';
import 'package:mind_e/widgets/for_you_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      backgroundColor: lightLimColor,
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 30.0,
            right: 30.0,
            top: 30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBarWidget(),
              kV42,
              ForYouWidget(),
              kV42,
              FilterWidget(),
            ],
          ),
        ),
      ),
    );
  }
}