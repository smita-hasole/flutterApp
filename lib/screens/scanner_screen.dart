import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:my_digital_id/models/profile.dart';
import 'package:my_digital_id/services/profile_service.dart';

class ScannerScreen extends StatefulWidget {
  @override
  _ScannerScreenState createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  String result = "Hey there !";
  Profile _profile = new Profile();

  _getProfileById(String Id) async {
    ProfileService profileService = new ProfileService();
    return await profileService.getProfileById(Id);
  }

  Future _scanQR() async {
    try {
      String qrResult = await BarcodeScanner.scan();
      setState(() {
        result = qrResult;
        print(qrResult);
      });
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          result = "Camera permission was denied";
        });
      } else {
        setState(() {
          result = "Unknown Error $ex";
        });
      }
    } on FormatException {
      setState(() {
        result = "You pressed the back button before scanning anything";
      });
    } catch (ex) {
      setState(() {
        result = "Unknown Error $ex";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("QR Scanner"),
        ),
        body: new FutureBuilder<dynamic>(
            future: _getProfileById(result),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                _profile = snapshot.data;
                return new ListView(
                  padding: EdgeInsets.fromLTRB(15, 15, 5, 15),
                    shrinkWrap: true,

                    children: <Widget>[ Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Card(
                              child:Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(children: <Widget>[
                                Image.network(
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHUwmHZcGF5Hcql3pNJj5txIB8OW5YMGeF-ts-RbyWPaHM1g1-',
                                    scale:2),
                              ]),
                              Column(
                                  children: <Widget>[
                                    Text(
                                      _profile?.displayName ?? "Default Name",
                                      style: TextStyle(
                                        color: Color.fromRGBO(45, 49, 55, 1),
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Open Sans',
                                        letterSpacing: 0,
                                        fontSize: 22,
                                      ),
                                      textAlign: TextAlign.center,
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
                                  ]),
                            ],
                          ),
                      ),
                        Padding(
                          padding: EdgeInsets.only(top: 40.5),
                          child: Container(
                              child: Column(children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(children: <Widget>[
                                      Text(
                                        "General Information:",
                                        style: TextStyle(
                                          color: Color.fromRGBO(45, 49, 55, 1),
                                          fontWeight: FontWeight.w700,
                                          fontFamily: 'Open Sans',
                                          letterSpacing: 0,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ]),
                                  ],
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
                                      "Status:",
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

                                Padding( padding: EdgeInsets.only(top: 40.5),
                                  child:  Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(children: <Widget>[
                                      Text(
                                        "Contact:",
                                        style: TextStyle(
                                          color: Color.fromRGBO(45, 49, 55, 1),
                                          fontWeight: FontWeight.w700,
                                          fontFamily: 'Open Sans',
                                          letterSpacing: 0,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ]),
                                  ],
                                ),), Row(
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
                              ])),
                        ),
                      ],
                    ),
                    ]);
              } else {
                _scanQR();
              }
            }));
  }
}
