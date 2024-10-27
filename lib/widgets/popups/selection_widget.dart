import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_e/bloc/feeling_record_bloc.dart';

class SelectionWidget extends StatelessWidget {
  const SelectionWidget({
    super.key,
    required this.content,
    required this.color,
    required this.borderColor,
    this.borderWidth = 0,
  });

  final String content;
  final Color color;
  final Color borderColor;
  final double? borderWidth;
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<FeelingRecordBloc>();
    return BlocBuilder<FeelingRecordBloc, FeelingRecordState>(
      builder: (context, state) {
        //-- Printed here without the middle one
        // print("------- Here before if -------");
        // print(bloc.selectedEmotion);
        // print("--------------\n");
        if (state is UpdateSelectedEmotionState) {
          // -- Not printed at all
          // print("------- Here inside if -------");
          // print(bloc.selectedEmotion);
          // print("--------------\n");
          return InkWell(
            onTap: () {
              bloc.add(SelectEmotionEvent(content));
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: bloc.selectedEmotion == content ? borderColor : color,
                border: Border.all(color: borderColor, width: borderWidth!),
              ),
              child: Text(
                content,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        } else {
          // print("------- I'm at else statement :) -------\n");

          return InkWell(
            onTap: () {
              // TODO: this is will handel the selection data
              bloc.add(SelectEmotionEvent(content));
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: bloc.selectedEmotion == content ? borderColor : color,
                border: Border.all(color: borderColor, width: borderWidth!),
              ),
              child: Text(
                content,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
