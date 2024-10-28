import 'package:get_storage/get_storage.dart';
import 'package:mind_e/data/emotions_data.dart';
import 'package:mind_e/models/record_model.dart';

class RecordData {
  // * The list of all registered feeling
  List<RecordModel> feelingRecordList = [];
  List<RecordModel> searchedFeelingRecordList = [];

  // Initial most feeling text
  String mostFeeling = "Happy mind, Happy life :)";

  // -- initialize the box instance to store data
  final box = GetStorage();

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

    //-- set the suitable sentence
    mostFeeling = emotionNote.awarenessNote[highestFeeling];
  }

  //-- Filter records (Sad, Happy, Calm, Anxious)
  List<RecordModel> filterRecords({required String selectedEmotion}) {
    if (selectedEmotion == "All") {
      print("HERE");
      return feelingRecordList;
    } else {
      searchedFeelingRecordList.clear();

      for (var element in feelingRecordList) {
        if (element.emotionType == selectedEmotion) {
          searchedFeelingRecordList.add(element);
        }
      }
      return searchedFeelingRecordList;
    }
  }

  // -- User feelings
  // 1- Save it
  void saveFeelingRecord() {
    try {
      List jsonList = [];
      for (var element in feelingRecordList) {
        print("=====Entered here!");
        jsonList.add(element.toJson());
      }
      print("the json list $jsonList");
      print("=====Finish here!");

      box.write("record", jsonList);
    } catch (e) {
      print("No record or Something went wrong $e");
    }
  }

  // 2- Retrieve  it
  Future<void> getFeelingRecord() async {
    // box.erase(); // in case to reset user record
    List temp = [];
    try {
      temp = await box.read("record");
      for (var element in temp) {
        feelingRecordList.add(RecordModel.fromJson(element));
      }
    } catch (e) {
      print("No record or Something went wrong $e");
    }
  }
}
