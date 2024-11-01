import 'package:flutter/material.dart';
import 'package:mind_e/widgets/home%20view%20widgets/custom_placeholder.dart';
import 'package:mind_e/widgets/home%20view%20widgets/feeling_card_widget.dart';

class FeelingListWidget extends StatelessWidget {
  const FeelingListWidget({super.key, required this.feelingList});

  final List feelingList;
  @override
  Widget build(BuildContext context) {
    return feelingList.isEmpty
        ? const CustomPlaceholder()
        : ListView.builder(
            itemCount: feelingList.length,
            padding: EdgeInsets.zero,
            itemBuilder: (BuildContext context, int index) {
              return FeelingCardWidget(
                feelingRecord: feelingList[index],
              );
            },
          );
  }
}
