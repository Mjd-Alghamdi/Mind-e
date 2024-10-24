import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mind_e/data/record_data.dart';
import 'package:mind_e/models/record_model.dart';

part 'feeling_record_event.dart';
part 'feeling_record_state.dart';

class FeelingRecordBloc extends Bloc<FeelingRecordEvent, FeelingRecordState> {
  final RecordData recordData = RecordData();
  FeelingRecordBloc() : super(FeelingRecordInitial()) {
    on<FeelingRecordEvent>((event, emit) {});

    // -- Displaying the List of recorder feelings event
    on<DisplayFeelingListEvent>((event, emit) {
      emit(ShowFeelingListState(recordList: recordData.feelingRecordList));
    });

    // -- Add new feeling Event
    on<AddNewFeelingEvent>((event, emit) {
      recordData.addFeelingRecord(
        feelingContent: event.content,
        emotion: event.emotionType,
      );
      emit(ShowFeelingListState(recordList: recordData.feelingRecordList));
    });

    // -- Remove a specific feeling Event
    on<RemoveFeelingRecordEvent>((event, emit) {
      recordData.removeFeelingRecord(record: event.record);
      emit(ShowFeelingListState(recordList: recordData.feelingRecordList));
    });
  }
}
