import 'package:mind_e/data/emotions_data.dart';
import 'package:mind_e/models/record_model.dart';

class RecordData {
  // * The list of all registered feeling
  List<RecordModel> feelingRecordList = [];

  // The most feeling
  String mostFeeling = "Happy mind, Happy life :)";

  // -- Add new feeling
  void addFeelingRecord({
    required String feelingContent,
    required String emotion,
  }) {
    // -- Adding the entered feeling into the list
    feelingRecordList.add(
      RecordModel(
        content: feelingContent,
        emotionType: emotion,
      ),
    );
  }

  // -- Remove existing feeling record
  void removeFeelingRecord({required RecordModel record}) {
    // -- Remove the entered feeling into the list
    print("Key from function ${record.id}");
    feelingRecordList.removeWhere(
      (feelingRecord) => feelingRecord.id == record.id,
    );
    print(feelingRecordList);
  }

  // -- Detect the most feeling from the list
  void getMostFeelingAdvice() {
    // -- Get the note
    final emotionNote = EmotionsData();

    Map mostFeelingCounter = {
      "Happy": 0,
      "Calm": 0,
      "Sad": 0,
      "Anxious": 0,
    };

    for (var emotion in feelingRecordList) {
      // update the number of feeling in the map
      mostFeelingCounter[emotion.emotionType]++;
    }

    // Set the highest value as the first value on the map
    // -- First Key
    String highestFeeling = mostFeelingCounter.keys.first;
    // -- It's value
    int maxCounter = mostFeelingCounter.values.first;

    //-- Loop to check and update
    mostFeelingCounter.forEach(
      (key, value) {
        if (maxCounter < value) {
          maxCounter = value;
          highestFeeling = key;
        }
      },
    );

    //-- set the sentence
    mostFeeling = emotionNote.awarenessNote[highestFeeling];
  }
}
