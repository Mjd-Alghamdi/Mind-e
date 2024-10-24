import 'package:flutter/material.dart';
import 'package:mind_e/constants/color.dart';
import 'package:mind_e/constants/spaces.dart';
import 'package:mind_e/widgets/popups/view_feeling_popup_widget.dart';

import 'small_card_info_widget.dart';

class FeelingCardWidget extends StatelessWidget {
  const FeelingCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return const ViewFeelingPopupWidget();
          },
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 15,
        ),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 7,
              spreadRadius: 1,
              color: Color.fromARGB(255, 243, 235, 212),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: const Text(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                "Yes i saw your answer and i tried that as well, again i am not getting the circle shape. Even the link which you shared doesn't change into circle shape",
              ),
            ),
            kV16,
            Row(
              children: [
                SmallCardInfoWidget(
                  content:
                      "${DateTime.now().day} - ${DateTime.now().month} - ${DateTime.now().year}",
                  color: lightTiffanyColor,
                ),
                kH12,
                const SmallCardInfoWidget(
                  content: "Happy",
                  color: limColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
