import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService {
  //Instance of get storage
  final box = GetStorage();

  //Store user details
  storeUserCredentials({
    required String userid,
    required String password,
    required String username,
    required String email,
  }) {
    print("storeUserCredentials");
    box.write('userid', userid);
    box.write('password', password);
    box.write('username', username);
    box.write('email', email);
    printDetails();
  }

  //Print details
  void printDetails() {
    print("printDetails");
    print("userid ${box.read('userid')}");
    print("password ${box.read('password')}");
    print("username ${box.read('username')}");
    print("email ${box.read('email')}");
  }

  removeData() {
    box.remove('userid');
    box.remove('password');
    box.remove('username');
    box.remove('email');
  }
}
