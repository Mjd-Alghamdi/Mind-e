import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_e/bloc/feeling_record_bloc.dart';
import 'package:mind_e/constants/color.dart';
import 'package:mind_e/widgets/popups/selection_widget.dart';

class EmotionCategoryWidget extends StatelessWidget {
  const EmotionCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<FeelingRecordBloc>();
    List<String> emotion = bloc.emotionData.emotionsList;
    return BlocBuilder<FeelingRecordBloc, FeelingRecordState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(emotion.length, (index) {
            return SelectionWidget(
              content: emotion[index],
              color: whiteColor,
              borderColor: emotion[index] == "Happy"
                  ? lightPinkColor
                  : emotion[index] == "Calm"
                      ? tiffanyColor
                      : emotion[index] == "Sad"
                          ? greyColor
                          : Colors.green,
              borderWidth: 1,
            );
          }),
        );
      },
    );
  }
}
