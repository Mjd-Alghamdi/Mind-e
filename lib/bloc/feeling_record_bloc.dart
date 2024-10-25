import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mind_e/data/emotions_data.dart';
import 'package:mind_e/data/record_data.dart';
import 'package:mind_e/models/record_model.dart';

part 'feeling_record_event.dart';
part 'feeling_record_state.dart';

class FeelingRecordBloc extends Bloc<FeelingRecordEvent, FeelingRecordState> {
  // -- Data instance to be used
  final RecordData recordData = RecordData();
  final EmotionsData emotionData = EmotionsData();
  late String selectedEmotion;

  FeelingRecordBloc() : super(FeelingRecordInitial()) {
    on<FeelingRecordEvent>((event, emit) {});

    // -- Displaying the List of recorder feelings event
    on<DisplayFeelingListEvent>((event, emit) {
      emit(ShowFeelingListState(recordList: recordData.feelingRecordList));
    });

    // -- Add new feeling Event
    on<AddNewFeelingEvent>((event, emit) {
      //-- Emotion selection
      // TODO: Handel the emoty fields

      // Adding
      recordData.addFeelingRecord(
        feelingContent: event.content,
        emotion: selectedEmotion,
        //event.emotionType,
      );
      selectedEmotion = "";
      emit(ShowFeelingListState(recordList: recordData.feelingRecordList));
    });

    // -- Remove a specific feeling Event
    on<RemoveFeelingRecordEvent>((event, emit) {
      recordData.removeFeelingRecord(record: event.record);
      emit(ShowFeelingListState(recordList: recordData.feelingRecordList));
    });

    //---- Emotions part

    // -- Select emotion for the feeling event
    on<SelectEmotionEvent>(
      (event, emit) {
        print("Entered SelectEmotionEvent ------");
        // 1- take the selection
        selectedEmotion = event.emotionType;
        print("Update Selection To======= $selectedEmotion ------");

        // 2- Update selection

        emotionData.updateSelectedEmotion(selection: selectedEmotion);

        // 3- Send its value
        bool isSelected = emotionData.selectedEmotion[event.emotionType];
        // print("IS EMOTION SELECTED????? $isSelected");
        UpdateSelectedEmotionState(isEmotionSelected: isSelected);
      },
    );
  }
}
