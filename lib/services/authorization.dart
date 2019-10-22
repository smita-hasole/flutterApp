import 'package:aad_oauth/aad_oauth.dart';
import 'package:aad_oauth/model/config.dart';

class LoginService {
  static final Config config = new Config(
      "ff4db5a7-18e9-4cb0-b432-c2df58ccada4",
      "ba6459ae-64d7-472a-a02e-81c4ac55c63a",
      "openid profile offline_access",
      "http://localhost:3000");
  static final AadOAuth oauth = new AadOAuth(config);

  static LoginService auth = null;

  AadOAuth getAuth() {
    return oauth;
  }

  static LoginService getInstance() {
    if (auth == null) {
      auth = new LoginService();
    }
    return auth;
  }
}
