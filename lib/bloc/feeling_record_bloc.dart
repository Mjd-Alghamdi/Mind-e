import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:mind_e/data/emotions_data.dart';
import 'package:mind_e/data/record_data.dart';
import 'package:mind_e/data/user_data.dart';
import 'package:mind_e/models/record_model.dart';
part 'feeling_record_event.dart';
part 'feeling_record_state.dart';
part 'feeling_record_bloc_user.dart';
part 'feeling_record_bloc_record.dart';

class FeelingRecordBloc extends Bloc<FeelingRecordEvent, FeelingRecordState> {
  // -- Data instance to be used
  final RecordData recordData = RecordData();
  final EmotionsData emotionData = EmotionsData();
  final UserData userData = UserData();

  //-- Crete an instance for filter selection
  bool isInitial = true;

  String selectedEmotion = "";

  FeelingRecordBloc() : super(FeelingRecordInitial()) {
    on<FeelingRecordEvent>((event, emit) {});

    // -- Displaying the List of recorder feelings event
    on<DisplayFeelingListEvent>(displayRecord);

    // -- Add new feeling Event
    on<AddNewFeelingEvent>(addRecord);

    // -- Remove a specific feeling Event
    on<RemoveFeelingRecordEvent>(removeRecord);

    // --- user name event
    on<TakeUserNameEvent>(takeUsername);

    //-- Retrieve the username from local storage
    on<GetUsernameEvent>(getUsername);

    // --- Retrieve the user feelings record
    on<GetUserRecordEvent>(getUserRecord);

    //-- Filter record
    on<FilterRecordEvent>(filterRecord);

    //---- Emotions part
    // -- Select emotion for the feeling event
    on<SelectEmotionEvent>(
      (event, emit) {
        isInitial = true;
        emotionData.resetSelections();
        print("Entered SelectEmotionEvent ------");
        // 1- take the selection
        selectedEmotion = event.emotionType;
        print("Update Selection To ======= ${event.emotionType} ------");

        // 2- Update selection
        emotionData.updateSelectedEmotion(
          selection: event.emotionType,
          selectionMap: emotionData.selectedEmotion,
        );

        // 3- Send its value
        bool isSelected = emotionData.selectedEmotion[event.emotionType];
        print("IS EMOTION SELECTED????? $isSelected");
        // TODO : HERE :)
        emit(UpdateSelectedEmotionState());
      },
    );
  }
}
