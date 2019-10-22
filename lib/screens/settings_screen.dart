import 'package:flutter/material.dart';
import 'package:my_digital_id/screens/splash_screen.dart';
import 'package:my_digital_id/services/authorization.dart';

class MySettingsScreen extends StatefulWidget {
  @override
  _MySettingsScreenState createState() => _MySettingsScreenState();
}

class _MySettingsScreenState extends State<MySettingsScreen> {

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title:
            new Center(child: new Text("Setting", textAlign: TextAlign.center)),
        backgroundColor: Colors.orange,
      ),
      body:Padding(
          padding: EdgeInsets.all(1.0),
          child: SizedBox(
            height: 150,
            child: Column(
              children: [
                ListTile(
                  title: Text('Contact Support',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ),
                ),
                Divider(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 0.5),
                ),
                ListTile(
                  title: Text('Sign Out',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ),
                  onTap: ()=>{_doLogout(),
                    Navigator.of(context)
                    .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
                  return new SplashScreen();
                }))}

                ),
              ],
            ),
          )),
    );
  }


_doLogout() {
  LoginService.getInstance().getAuth().logout();

  }
}
