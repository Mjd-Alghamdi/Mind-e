import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_e/bloc/feeling_record_bloc.dart';
import 'package:mind_e/constants/color.dart';
import 'package:mind_e/constants/spaces.dart';
import 'package:mind_e/models/record_model.dart';
import 'package:mind_e/widgets/buttons/custom_button.dart';
import 'package:mind_e/widgets/small_card_info_widget.dart';

class ViewFeelingPopupWidget extends StatelessWidget {
  const ViewFeelingPopupWidget({super.key, required this.feelingRecord});

  final RecordModel feelingRecord;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<FeelingRecordBloc>();
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
                  SmallCardInfoWidget(
                    content: feelingRecord.emotionType,
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
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    feelingRecord.content,
                  ),
                ),
              ),
              kV24,
              CustomButton(
                onTap: () {
                  //-- Delete the feeling to the list
                  // -- Pop up the view
                  bloc.add(RemoveFeelingRecordEvent(feelingRecord));
                  Navigator.pop(context);
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
