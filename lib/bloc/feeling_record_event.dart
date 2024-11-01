part of 'feeling_record_bloc.dart';

@immutable
sealed class FeelingRecordEvent {}

class DisplayFeelingListEvent extends FeelingRecordEvent {}

//-- Adding New feeling record
// ignore: must_be_immutable
class AddNewFeelingEvent extends FeelingRecordEvent {
  String content;
  AddNewFeelingEvent({
    required this.content,
  });
}

//-- Removing a specific feeling record
// ignore: must_be_immutable
class RemoveFeelingRecordEvent extends FeelingRecordEvent {
  RecordModel record;
  RemoveFeelingRecordEvent(this.record);
}

//--- Emotions Events

//-- Selecting emotion event
// ignore: must_be_immutable
class SelectEmotionEvent extends FeelingRecordEvent {
  String emotionType;
  SelectEmotionEvent(this.emotionType);
}

//-- Take username event
// ignore: must_be_immutable
class TakeUserNameEvent extends FeelingRecordEvent {
  String username;
  TakeUserNameEvent(this.username);
}

//-- Retrieve user name event
class GetUsernameEvent extends FeelingRecordEvent {}

//  Retrieve user name event
class GetUserRecordEvent extends FeelingRecordEvent {}

//-- Filer record --
// ignore: must_be_immutable
class FilterRecordEvent extends FeelingRecordEvent {
  String selection;
  FilterRecordEvent(this.selection);
}
