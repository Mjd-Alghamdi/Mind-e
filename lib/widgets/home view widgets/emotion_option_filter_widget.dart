import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_e/bloc/feeling_record_bloc.dart';
import 'package:mind_e/constants/color.dart';

class EmotionOptionWidget extends StatelessWidget {
  const EmotionOptionWidget({
    super.key,
    required this.emotionType,
  });

  final String emotionType;
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<FeelingRecordBloc>();
    return BlocBuilder<FeelingRecordBloc, FeelingRecordState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            bloc.add(FilterRecordEvent(emotionType));
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: bloc.emotionData.filterSelection[emotionType]
                  ? greyBlackColor
                  : bloc.isInitial && emotionType == "All"
                      ? greyBlackColor
                      : tiffanyColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              emotionType,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: bloc.emotionData.filterSelection[emotionType]
                    ? whiteColor
                    : bloc.isInitial && emotionType == "All"
                        ? whiteColor
                        : greyBlackColor,
              ),
            ),
          ),
        );
      },
    );
  }
}
