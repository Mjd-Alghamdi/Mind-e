class EmotionsData {
  // -- List of main emotions
  List<String> emotionsList = ["Happy", "Calm", "Anxious", "Sad"];

  //-- Which emotion selected ?
  Map selectedEmotion = {
    "Happy": false,
    "Calm": false,
    "Anxious": false,
    "Sad": false,
  };

  // Awareness note
  Map awarenessNote = {
    "Happy":
        "It seems like you've been feeling happy a lot lately! Keep enjoying the positive moment.",
    "Calm":
        "You've experienced calmness often. That's great! It looks like you're managing stress well.",
    "Anxious":
        "You've been feeling anxious frequently. It's important to take care of yourself.",
    "Sad":
        "Sadness has been showing up a lot for you. Remember, it's okay to seek support.",
  };

  void updateSelectedEmotion({required String selection}) {
    selectedEmotion.keys.forEach((emotion) {
      if (selection == emotion) {
        selectedEmotion[emotion] = true;
      } else {
        selectedEmotion[emotion] = false;
      }
    });
    print("===================\n");
    print(selectedEmotion);
    print("===================\n");
  }

  void resetSelections() {
    selectedEmotion.keys.forEach((emotion) => selectedEmotion[emotion] = false);
  }
}
