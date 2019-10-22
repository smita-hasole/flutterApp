import 'package:localstorage/localstorage.dart';

class LocalStore {
  static LocalStorage localStorage = null;

  static LocalStorage getInstance() {
    if (localStorage == null) {
      localStorage = new LocalStorage("my_digital_id");
    }
    return localStorage;
  }
}
