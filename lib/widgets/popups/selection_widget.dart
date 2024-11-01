import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_e/bloc/feeling_record_bloc.dart';

// TODO : HERE

class SelectionWidget extends StatefulWidget {
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
  State<SelectionWidget> createState() => _SelectionWidgetState();
}

class _SelectionWidgetState extends State<SelectionWidget> {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<FeelingRecordBloc>();
    return InkWell(onTap: () {
      setState(() {
        bloc.add(SelectEmotionEvent(widget.content));
      });
    }, child: BlocBuilder<FeelingRecordBloc, FeelingRecordState>(
      builder: (context, state) {
        if (state is UpdateSelectedEmotionState) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: bloc.emotionData.selectedEmotion[widget.content]
                  ? widget.borderColor
                  : widget.color,
              // bloc.selectedEmotion == content ? borderColor : color,
              border: Border.all(
                  color: widget.borderColor, width: widget.borderWidth!),
            ),
            child: Text(
              widget.content,
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
              color: bloc.emotionData.selectedEmotion[widget.content]
                  ? widget.borderColor
                  : widget.color,
              // bloc.selectedEmotion == content ? borderColor : color,
              border: Border.all(
                  color: widget.borderColor, width: widget.borderWidth!),
            ),
            child: Text(
              widget.content,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        }
      },
    ));
  }
}
