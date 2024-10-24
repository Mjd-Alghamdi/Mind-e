part of 'feeling_record_bloc.dart';

@immutable
sealed class FeelingRecordEvent {}

class DisplayFeelingListEvent extends FeelingRecordEvent {}

//-- Adding New feeling record
// ignore: must_be_immutable
class AddNewFeelingEvent extends FeelingRecordEvent {
  String content;
  String emotionType;
  AddNewFeelingEvent({
    required this.content,
    required this.emotionType,
  });
}

//-- Removing a specific feeling record
// ignore: must_be_immutable
class RemoveFeelingRecordEvent extends FeelingRecordEvent {
  RecordModel record;
  RemoveFeelingRecordEvent(this.record);
}
