import 'package:flutter/material.dart';
import 'package:mind_e/constants/color.dart';
import 'package:mind_e/constants/spaces.dart';
import 'package:mind_e/widgets/buttons/add_feeling_button.dart';
import 'package:mind_e/widgets/popups/emotion_category_widget.dart';
import 'package:mind_e/widgets/popups/feeling_textfield_widget.dart';

class AddFeelingPopupWidget extends StatefulWidget {
  const AddFeelingPopupWidget({
    super.key,
  });

  @override
  State<AddFeelingPopupWidget> createState() => _AddFeelingPopupWidgetState();
}

class _AddFeelingPopupWidgetState extends State<AddFeelingPopupWidget> {
  TextEditingController feelingContentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.375,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(5),
        ),
        // ignore: prefer_const_constructors
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "How do you feel tody? *",
              style: TextStyle(
                color: greyBlackColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            kV4,
            FeelingTextfieldWidget(
              controller: feelingContentController,
            ),
            kV24,
            const Text(
              "Categorize this feelings *",
              style: TextStyle(
                color: greyBlackColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            kV12,
            const EmotionCategoryWidget(),
            kV42,
            const AddFeelingButton(),
          ],
        ),
      ),
    );
  }
}
