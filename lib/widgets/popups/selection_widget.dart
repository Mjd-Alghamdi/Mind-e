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
    return InkWell(
      onTap: () {
        // TODO: this is will handel the selection data
        bloc.add(SelectEmotionEvent(content));
      },
      child: BlocBuilder<FeelingRecordBloc, FeelingRecordState>(
        builder: (context, state) {
          if (state is UpdateSelectedEmotionState) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: state.isEmotionSelected ? borderColor : color,
                border: Border.all(color: borderColor, width: borderWidth!),
              ),
              child: Text(
                content,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          } else {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: color,
                border: Border.all(color: borderColor, width: borderWidth!),
              ),
              child: Text(
                content,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
