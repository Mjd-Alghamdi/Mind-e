import 'package:flutter/material.dart';
import 'package:mind_e/constants/color.dart';
import 'package:mind_e/constants/spaces.dart';
import 'package:mind_e/widgets/custom_appbar_widget.dart';
import 'package:mind_e/widgets/feeling_card_widget.dart';
import 'package:mind_e/widgets/filter_widget.dart';
import 'package:mind_e/widgets/floating_action_button_widget.dart';
import 'package:mind_e/widgets/for_you_widget.dart';
import 'package:mind_e/widgets/popups/add_feeling_popup_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      backgroundColor: lightLimColor,
      body: Padding(
        padding: const EdgeInsets.only(
          left: 30.0,
          right: 30.0,
          top: 100,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBarWidget(),
            kV42,
            const ForYouWidget(),
            kV42,
            const FilterWidget(),
            kV24,
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                padding: EdgeInsets.zero,
                itemBuilder: (BuildContext context, int index) {
                  return const FeelingCardWidget();
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return const AddFeelingPopupWidget();
            },
          );
        },
        child: const FloatingActionButtonWidget(),
      ),
    );
  }
}
