import 'package:flutter/material.dart';
import 'package:my_digital_id/models/profile.dart';
import 'package:my_digital_id/services/profile_service.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MyProfileScreen extends StatefulWidget {

  final String profileId;

  MyProfileScreen({this.profileId});

  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {

  Profile _profile = new Profile();



  _getProfile() async {
    ProfileService profileService = new ProfileService();
    return await profileService.getProfile();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Center(
              child: new Text("CLAIRVOYANT", textAlign: TextAlign.center)),
          backgroundColor: Colors.orange,
        ),
      body: new FutureBuilder<dynamic>(
        future: _getProfile(),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.hasData) {
      _profile = snapshot.data;
      print(_profile.id);
      return new ListView(
        shrinkWrap: true,

        children: <Widget>[ Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHUwmHZcGF5Hcql3pNJj5txIB8OW5YMGeF-ts-RbyWPaHM1g1-',
            ),
            Padding(
              padding: EdgeInsets.only(top: 40.5),
              child: Container(
                  child: Column(children: <Widget>[
                    Text(
                      _profile?.displayName ?? "Default Name",
                      style: TextStyle(
                        color: Color.fromRGBO(45, 49, 55, 1),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Open Sans',
                        letterSpacing: 0,
                        fontSize: 26,
                      ),
                    ),
                    Text(
                      _profile?.jobTitle ?? '',
                      style: TextStyle(
                        color: Color.fromRGBO(146, 148, 151, 1),
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Open Sans',
                        letterSpacing: 0,
                        fontSize: 18,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(children: <Widget>[
                          Text(
                            "Department:",
                            style: TextStyle(
                              color: Color.fromRGBO(146, 148, 151, 1),
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Open Sans',
                              letterSpacing: 0,
                              fontSize: 18,
                            ),
                          ),
                        ]),
                        Column(children: <Widget>[
                          Text(
                            _profile?.department ?? "NA",
                            style: TextStyle(
                              color: Color.fromRGBO(146, 148, 151, 1),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Open Sans',
                              letterSpacing: 0,
                              fontSize: 18,
                            ),
                          ),
                        ]),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Id:",
                          style: TextStyle(
                            color: Color.fromRGBO(146, 148, 151, 1),
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Open Sans',
                            letterSpacing: 0,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          _profile?.id ?? '',
                          style: TextStyle(
                            color: Color.fromRGBO(146, 148, 151, 1),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Open Sans',
                            letterSpacing: 0,
                            fontSize: 18,
                          ),
                        ),

                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Mail:",
                          style: TextStyle(
                            color: Color.fromRGBO(146, 148, 151, 1),
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Open Sans',
                            letterSpacing: 0,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          _profile?.mail ?? '',
                          style: TextStyle(
                            color: Color.fromRGBO(146, 148, 151, 1),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Open Sans',
                            letterSpacing: 0,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Connection:",
                          style: TextStyle(
                            color: Color.fromRGBO(146, 148, 151, 1),
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Open Sans',
                            letterSpacing: 0,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          _profile?.accountEnabled ?? '',
                          style: TextStyle(
                            color: Color.fromRGBO(146, 148, 151, 1),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Open Sans',
                            letterSpacing: 0,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Phone:",
                          style: TextStyle(
                            color: Color.fromRGBO(146, 148, 151, 1),
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Open Sans',
                            letterSpacing: 0,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          _profile?.mobilePhone ?? '',
                          style: TextStyle(
                            color: Color.fromRGBO(146, 148, 151, 1),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Open Sans',
                            letterSpacing: 0,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                       new QrImage(
                        data: _profile?.id,
                        size: 200.0,

                      )],
                    )
                  ])),
            ),
          ],
        ),
      ]);
    }else{
      return CircularProgressIndicator();
    }
        })
    );
  }
}
