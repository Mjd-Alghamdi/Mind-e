import 'package:flutter/material.dart';

import 'emotion_option_filter_widget.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          EmotionOptionWidget(emotionType: "All"),
          EmotionOptionWidget(emotionType: "Happy"),
          EmotionOptionWidget(emotionType: "Sad"),
          EmotionOptionWidget(emotionType: "Calm"),
          EmotionOptionWidget(emotionType: "Anxious"),
        ],
      ),
    );
  }
}
