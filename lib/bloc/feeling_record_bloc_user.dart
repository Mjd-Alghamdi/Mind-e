part of 'feeling_record_bloc.dart';

extension UserFunction on FeelingRecordBloc {

  //-- Take the name 

  FutureOr<void> takeUsername(event, emit) {
    if (event.username.trim().isEmpty) {
      emit(ErrorState("You must enter a name"));
    } else {
      userData.userName = event.username;
      userData.saveUser(username: event.username);
    }
  }

  // -- Get the name 
  FutureOr<void> getUsername(event, emit) async {
    print("Enters user getting");
    await userData.getUser();
    print("User name is ${userData.userName}");
    print("Is there a user? ${userData.userName.isNotEmpty}");
    emit(RedirectViewState());
  }

  // -- Get  the record 
  FutureOr<void> getUserRecord(event, emit) async {
    print("Enters record getting");
    await recordData.getFeelingRecord();
    if (recordData.feelingRecordList.isNotEmpty) {
      //--- Calculate the feelings
      recordData.getMostFeelingAdvice();
    }
    print("RECORD HERE ${recordData.feelingRecordList}");
  }
}
