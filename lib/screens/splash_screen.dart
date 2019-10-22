import 'package:flutter/material.dart';
import 'package:my_digital_id/screens/home.dart';
import 'package:my_digital_id/services/authorization.dart';

import 'my_profile.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SplashScreenState();
  }
}

_doLogin() async {
//  LoginService.getInstance().getAuth().logout();
  LoginService.getInstance().getAuth().login();
  _getAccessToken();
//  ProfileService profileService = new ProfileService();
//  Profile profile = await profileService.getProfile();
//  print(profile.givenName);
}

_getAccessToken() async {
  var s = await LoginService.getInstance().getAuth().getAccessToken();
  print(s);
}

class SplashScreenState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/clairvoyant.png',
              fit: BoxFit.fitWidth,
            ),
            Padding(
              padding: EdgeInsets.only(top: 40.5),
              child: Container(
                  child: Column(children: <Widget>[
                Text(
                  'Welcome back!',
                  style: TextStyle(
                    color: Color.fromRGBO(45, 49, 55, 1),
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Open Sans',
                    letterSpacing: 0,
                    fontSize: 36,
                  ),
                ),
                Text(
                  'Sign into your account',
                  style: TextStyle(
                    color: Color.fromRGBO(146, 148, 151, 1),
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Open Sans',
                    letterSpacing: 0,
                    fontSize: 18,
                  ),
                )
              ])),
            ),
            Padding(
              padding: EdgeInsets.only(top: 175),
              child: FlatButton(
                color: Color.fromRGBO(234, 121, 36, 0.9),
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
                splashColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadiusDirectional.all(Radius.circular(5))),
                onPressed: () {
                  _doLogin();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                child: Text(
                  "Login with Clairvoyant Account",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
