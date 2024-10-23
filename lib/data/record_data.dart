import 'package:mind_e/models/record_model.dart';

class RecordData {
  // * The list of all registered feeling
  List<RecordModel> feelingRecordList = [];

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
    feelingRecordList.remove(record);
  }
}
