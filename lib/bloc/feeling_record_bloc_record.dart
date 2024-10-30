part of 'feeling_record_bloc.dart';

extension RecordFunctions on FeelingRecordBloc {
  // -- Display Record
  FutureOr<void> displayRecord(event, emit) {
    emit(ShowFeelingListState(recordList: recordData.feelingRecordList));
  }

  // -- Add Record
  FutureOr<void> addRecord(event, emit) {
    isInitial = true;
    emotionData.resetSelections();

    if (event.content.trim().isEmpty) {
      emit(ErrorState("You must write a content!"));
      emit(ShowFeelingListState(recordList: recordData.feelingRecordList));
    } else if (selectedEmotion.isEmpty) {
      emit(ErrorState("Please choose how do you feel?"));
      emit(ShowFeelingListState(recordList: recordData.feelingRecordList));
    } else {
      // Adding
      recordData.addFeelingRecord(
        feelingContent: event.content,
        emotion: selectedEmotion,
      );

      //--- Calculate the feelings
      recordData.getMostFeelingAdvice();

      //- Update feeling record in storage
      recordData.saveFeelingRecord();

      // -- Reset sections ---
      selectedEmotion = "";
      emotionData.resetSelections();
      emit(ShowFeelingListState(recordList: recordData.feelingRecordList));
    }
  }

  // -- Remove Record
  FutureOr<void> removeRecord(event, emit) {
    recordData.removeFeelingRecord(record: event.record);
    //- Update feeling record in storage
    recordData.saveFeelingRecord();
    //--- Calculate the feelings
    recordData.getMostFeelingAdvice();
    isInitial = true;
    emotionData.resetSelections();
    emit(ShowFeelingListState(recordList: recordData.feelingRecordList));
  }

  //-- Filter record
  FutureOr<void> filterRecord(event, emit) {
    emotionData.updateSelectedEmotion(
      selection: event.selection,
      selectionMap: emotionData.filterSelection,
    );
    isInitial = false;
    List<RecordModel> searchedList = recordData.filterRecords(
      selectedEmotion: event.selection,
    );
    emit(
      ShowFeelingListState(
        recordList: searchedList,
      ),
    );
  }
}
