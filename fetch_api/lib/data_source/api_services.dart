import 'dart:convert';

import 'package:fetch_api/data_source/api_url.dart';
import 'package:fetch_api/models/user.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<List<User>> fetchUser() {
    return http
        .get(ApisUrl().API_USER_LIST)
        // return data if response is recieves
        .then(
      (http.Response reponse) {
        final String jsonBody = reponse.body;
        final int statusCode = reponse.statusCode;

        // check error
        if (statusCode != 200 || jsonBody == null) {
          print(reponse.reasonPhrase);
          throw new Exception("Error load API");
        }

        // the response body is decoded from JSON
        final JsonDecoder _decoder = JsonDecoder();
        final userListContainer =
            _decoder.convert(jsonBody); // convert and return json body

            // return data as json after convert 
        final List userList = userListContainer['result'];
        return userList.map((contactRaw) => User.fromJson(contactRaw)).toList();
      },
    );
  }
}
