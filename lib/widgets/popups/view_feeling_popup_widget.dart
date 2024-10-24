import 'package:flutter/material.dart';
import 'package:mind_e/constants/color.dart';
import 'package:mind_e/constants/spaces.dart';
import 'package:mind_e/widgets/buttons/custom_button.dart';
import 'package:mind_e/widgets/small_card_info_widget.dart';

class ViewFeelingPopupWidget extends StatelessWidget {
  const ViewFeelingPopupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: IntrinsicHeight(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(5),
          ),
          // ignore: prefer_const_constructors
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmallCardInfoWidget(
                    content:
                        "${DateTime.now().day} - ${DateTime.now().month} - ${DateTime.now().year}",
                    color: lightTiffanyColor,
                  ),
                  const SmallCardInfoWidget(
                    content: "Happy",
                    color: limColor,
                  ),
                ],
              ),
              kV24,
              const Text(
                "At this day you feel",
                style: TextStyle(
                  color: greyBlackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              kV16,
              const Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    "Yes i saw your answer and i tried that as well, again i am not getting the circle shape. Even the link which you shared doesn't change into circle shape Even the link which you shared doesn't change into circle shapeEven the link which you shared doesn't change into circle shapeEven the link which you shared doesn't change into circle shapeEven the link which you shared doesn't change into circle shapeEven ",
                  ),
                ),
              ),
              kV24,
              CustomButton(
                onTap: () {
                  //-- Delete the feeling to the list
                  // -- Pop up the view
                },
                borderWidth: 1,
                buttonColor: whiteColor,
                borderColor: greyBlackColor,
                titleColor: greyBlackColor,
                buttonTitle: 'Release 🗑',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
