import 'package:flutter/material.dart';
import 'package:mind_e/constants/color.dart';

class AlertBannerWidget extends StatelessWidget {
  const AlertBannerWidget({super.key, required this.msg});

  final String msg;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints:
          BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8),
      decoration: const BoxDecoration(
        color: greyBlackColor,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Material(
          color: Colors.transparent,
          child: Text(
            msg,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 239, 154, 154),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
