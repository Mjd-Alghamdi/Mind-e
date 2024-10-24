part of 'feeling_record_bloc.dart';

@immutable
sealed class FeelingRecordState {}

final class FeelingRecordInitial extends FeelingRecordState {}

// ignore: must_be_immutable
class ShowFeelingListState extends FeelingRecordState {
  List<RecordModel> recordList;
  ShowFeelingListState({required this.recordList});
}
