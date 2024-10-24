import 'package:flutter/material.dart';
import 'package:mind_e/constants/color.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.buttonTitle,
    this.titleColor = whiteColor,
    this.buttonColor = greyBlackColor,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0,
  });

  final Function onTap;
  final String buttonTitle;
  final Color? titleColor;
  final Color? buttonColor;
  final Color? borderColor;
  final double? borderWidth;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(3.5),
          border: Border.all(
            color: borderColor!,
            width: borderWidth!,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          buttonTitle,
          style: TextStyle(
            color: titleColor,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
