import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_digital_id/models/search_criteria.dart';
import 'package:my_digital_id/services/profile_service.dart';

class SearchResultScreen extends StatelessWidget {
  final SearchCriteria sc;
  final Future<Map<String, dynamic>> resp;

  const SearchResultScreen({Key key, @required this.sc, this.resp})
      : super(key: key);

  _getAllProfiles() async {
    ProfileService profileService = new ProfileService();
    return await profileService.getAllProfilesUsingSearch(sc);
  }

  @override
  Widget build(BuildContext context) {
    var resp = _getAllProfiles();
    return Scaffold(
        body: FutureBuilder<dynamic>(
      future: _getAllProfiles(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return new ListView.builder(
              itemCount: snapshot.data['value'] == null
                  ? 0
                  : snapshot.data['value'].length,
              itemBuilder: (BuildContext context, i) {
                return new ListTile(
                  title: new Text(snapshot.data['value'][i]["displayName"]),
                  subtitle: new Text(snapshot.data['value'][i]["givenName"]),
                );
              });
        } else {
        return CircularProgressIndicator();
//          return new Column(
//            crossAxisAlignment: CrossAxisAlignment.center,
//            mainAxisAlignment: MainAxisAlignment.start,
//            children: <Widget>[Text('Loading....')],
//          );
        }
      },
    ));
  }
}
