import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_digital_id/models/profile.dart';
import 'package:my_digital_id/models/search_criteria.dart';
import 'package:my_digital_id/services/authorization.dart';
import 'package:my_digital_id/utils/constants.dart';

class ProfileService {
  Future<Profile> getProfile() async {
    String url = AppConstants.GET_PROFILE_URL;
    var accessToken =
        await LoginService.getInstance().getAuth().getAccessToken();
    final response = await http
        .get(url, headers: {"Authorization": "Bearer " + accessToken});

    if (response.statusCode == 200) {
      print(response);
      return Profile.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<Map<String, dynamic>> getAllProfilesUsingSearch(
      SearchCriteria sc) async {
    var originalUrl = AppConstants.SEARCH_BY_URL;
    if (sc.firstName != null) {
      var firstNameSearch = "startsWith(givenName,'" + sc.firstName + "')";
      originalUrl = originalUrl + firstNameSearch;
    }
    /*if (sc.lastName != null) {
      var lastNameSearch = "startsWith(surname,'" + sc.lastName + "')";
      originalUrl = originalUrl + lastNameSearch;
    }*/
    var accessToken =
        await LoginService.getInstance().getAuth().getAccessToken();
    final response = await http
        .get(originalUrl, headers: {"Authorization": "Bearer " + accessToken});

    if (response.statusCode == 200) {
      print(response.toString());
//      Iterable l = json.decode(response.body);
//      return l.map((Map model)=> Profile.fromJson(model)).toList();
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<Profile> getProfileById(String Id) async {
    String url = AppConstants.GET_PROFILE_BY_ID_URL + Id;
    var accessToken =
        await LoginService.getInstance().getAuth().getAccessToken();
    final response = await http
        .get(url, headers: {"Authorization": "Bearer " + accessToken});

    if (response.statusCode == 200) {
      print(response);
      return Profile.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}
