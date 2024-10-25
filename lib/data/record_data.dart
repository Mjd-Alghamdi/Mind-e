import 'package:mind_e/data/emotions_data.dart';
import 'package:mind_e/models/record_model.dart';

class RecordData {
  // * The list of all registered feeling
  List<RecordModel> feelingRecordList = [
    // RecordModel(content: "first", emotionType: 'Happy'),
    // RecordModel(content: "ddd", emotionType: 'Sad'),
  ];

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
    // feelingRecordList.removeWhere(
    //   (feelingRecord) {
    //     print(feelingRecord.content == record.content);
    //     // ! There is a problem with the id even if it is matched it did'n deleted
    //     // return feelingRecord.id == record.id;
    //     return feelingRecord.content == record.content; // ! just for test
    //   },
    // );
    feelingRecordList.removeWhere(
      (feelingRecord) => feelingRecord.id == record.id,
    );
    print(feelingRecordList);
  }

  // -- Detect the most feeling from the list
  void getMostFeelingAdvice() {
    // -- Get the note
    final emotionNote = EmotionsData();
    int sadCounter = 0;
    int calmCounter = 0;
    int anxiousCounter = 0;
    int happyCounter = 0;

    for (var element in feelingRecordList) {
      switch (element.emotionType) {
        case "Happy":
          happyCounter++;
          print("Happy part: $happyCounter");
          break;

        case "Calm":
          calmCounter++;
          print("Calm part: $calmCounter");

          break;

        case "Sad":
          sadCounter++;
          print("Sad part: $sadCounter");

          break;

        case "Anxious":
          anxiousCounter++;
          print("Anxious part: $anxiousCounter");

          break;
      }
    }

    // Compare the counters
    if (happyCounter > calmCounter) {
      print("Happy >");
      mostFeeling = emotionNote.happyNote;
    } else if (sadCounter > happyCounter) {
      print("Sad >");
      mostFeeling = emotionNote.sadNote;
    } else if (anxiousCounter > sadCounter) {
      print("Anxious >");

      mostFeeling = emotionNote.anxiousNote;
    } else {
      print("Calm >");

      mostFeeling = emotionNote.calmNote;
    }
  }
}
