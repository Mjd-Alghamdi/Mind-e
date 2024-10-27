import 'package:flutter/material.dart';
import 'package:mind_e/constants/color.dart';
import 'package:mind_e/constants/spaces.dart';
import 'package:mind_e/models/record_model.dart';
import 'package:mind_e/widgets/popups/view_feeling_popup_widget.dart';
import '../small_card_info_widget.dart';

class FeelingCardWidget extends StatelessWidget {
  const FeelingCardWidget({
    super.key,
    required this.feelingRecord,
  });

  final RecordModel feelingRecord;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return ViewFeelingPopupWidget(
              feelingRecord: feelingRecord,
            );
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
              child: Text(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                feelingRecord.content,
              ),
            ),
            kV16,
            Row(
              children: [
                SmallCardInfoWidget(
                  content:
                      "${feelingRecord.crateAt.day} - ${feelingRecord.crateAt.month} - ${feelingRecord.crateAt.year}",
                  color: limColor,
                ),
                kH12,
                SmallCardInfoWidget(
                  content: feelingRecord.emotionType,
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
