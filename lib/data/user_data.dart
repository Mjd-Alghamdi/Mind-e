import 'package:get_storage/get_storage.dart';

class UserData {
  String userName = "";

  // -- initialize the box instance to store data
  final box = GetStorage();

  //-- Save user name
  Future<void> saveUser({required String username}) async {
    await box.write("username", username);
  }

  //-- Retrieve the username from the box
  Future<void> getUser() async {
    // box.erase();
    try {
      userName = await box.read("username");
    } catch (e) {
      print("Something went wrong $e");
    }
  }
}
