import 'package:flutter/material.dart';
import 'package:my_digital_id/models/search_criteria.dart';
import 'package:my_digital_id/screens/search_result.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SearchScreenState();
  }
}

class SearchScreenState extends State<StatefulWidget> {
  String _firstName;
  String _lastName;
  String _employeeId;

  var _country;

  TextEditingController firstNameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController employeeIdController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Search"),
      ),
      body: ListView(
        shrinkWrap: true,

        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 25, left: 21, right: 21),
            child: Container(
                child: Column(children: <Widget>[
              Text(
                'Fill out the form below to search for a user',
                style: TextStyle(
                  color: Color.fromRGBO(66, 66, 66, 1),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Open Sans',
                  letterSpacing: 0,
                  fontSize: 15,
                ),
              ),
              Column(children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    'First Name',
                    style: TextStyle(
                      color: Color.fromRGBO(130, 130, 130, 1),
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Open Sans',
                      letterSpacing: 0,
                      fontSize: 12,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: TextFormField(
                    controller: firstNameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'First Name',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    'Last Name',
                    style: TextStyle(
                      color: Color.fromRGBO(130, 130, 130, 1),
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Open Sans',
                      letterSpacing: 0,
                      fontSize: 12,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: TextFormField(
                    controller: lastNameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Last Name',
                    ),
                    onSaved: (value) => _lastName = value,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Divider(
                        color: Colors.red,
                        height: 15,
                        endIndent: 175,
                      ),
                      Text(
                        'OR',
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                      Divider(
                        color: Colors.grey,
                        height: 15,
                        indent: 175,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    'ID',
                    style: TextStyle(
                      color: Color.fromRGBO(130, 130, 130, 1),
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Open Sans',
                      letterSpacing: 0,
                      fontSize: 12,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: TextFormField(
                    controller: employeeIdController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Employee ID',
                    ),
                    onSaved: (value) => _employeeId = value,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      value: 0,
                      groupValue: _country,
                      onChanged: (value) => _country = value,
                    ),
                    new Text(
                      'All',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      value: 1,
                      groupValue: _country,
                      onChanged: (value) => _country = value,
                    ),
                    new Text(
                      'India',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      value: 2,
                      groupValue: _country,
                      onChanged: (value) => _country = value,
                    ),
                    new Text(
                      'USA',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
                FlatButton(
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
//                  _doLogin();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SearchResultScreen(
                                sc: new SearchCriteria(
                                    firstNameController.text,
                                    lastNameController.text,
                                    employeeIdController.text),
                              )),
                    );
                  },
                  child: Text(
                    "Search",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ])
            ])),
          ),
          /*Padding(
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
                onPressed: () {},
                child: Text(
                  "Login with Clairvoyant Account",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),*/
        ],
      ),
    );
  }
}
