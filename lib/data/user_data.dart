import 'package:get_storage/get_storage.dart';

class UserData {
  String userName = "";

  // -- initialize the box instance to store data
  final box = GetStorage();

  //-- Save user name
  void saveUser({required String username}) {
    box.write("username", username);
  }

  //-- Retrieve the username from the box
  Future<void> getUser() async {
    // box.erase(); // in case to reset user name
    try {
      userName = await box.read("username");
    } catch (e) {
      print("Null as initial value or Something went wrong $e");
    }
  }

  
}
