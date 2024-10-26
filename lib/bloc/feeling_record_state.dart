part of 'feeling_record_bloc.dart';

@immutable
sealed class FeelingRecordState {}

final class FeelingRecordInitial extends FeelingRecordState {}

// ignore: must_be_immutable
class ShowFeelingListState extends FeelingRecordState {
  List<RecordModel> recordList;
  ShowFeelingListState({required this.recordList});
}

// --- Emotion Selection
// ignore: must_be_immutable
class UpdateSelectedEmotionState extends FeelingRecordState {
  bool isEmotionSelected;
  UpdateSelectedEmotionState({required this.isEmotionSelected});
}

//-- App state
// ignore: must_be_immutable
class ErrorState extends FeelingRecordState {
  String errorMsg;
  ErrorState(this.errorMsg);
}

// -- Loading state 
// ignore: must_be_immutable
class RedirectViewState extends FeelingRecordState {
 
}


