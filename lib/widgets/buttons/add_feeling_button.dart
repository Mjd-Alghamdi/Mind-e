import 'package:flutter/material.dart';
import 'package:mind_e/constants/color.dart';

class AddFeelingButton extends StatelessWidget {
  const AddFeelingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //-- Add the feeling to the list
        // ! Must to be filed, so no empty submission

        // -- Pop up the view
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: greyBlackColor,
          borderRadius: BorderRadius.circular(3.5),
        ),
        alignment: Alignment.center,
        child: const Text(
          "Welcome it",
          style: TextStyle(
            color: whiteColor,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
