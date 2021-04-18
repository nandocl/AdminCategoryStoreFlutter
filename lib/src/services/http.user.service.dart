import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import '../models/user.model.dart';

class HttpUserService {
  static String backendUrl = 'monobusiness.sinticbolivia.net';
  static Map<String, String> headers = {'Content-Type': 'application/json'};
  //
  static Future<UserItem> loginWithUser(
      {String username, String password}) async {
    var user = UserItem();
    String endPoint = '/api/api1...';
    Map<String, dynamic> body = {"username": username, "password": password};
    var response =
        await http.post(Uri.http(backendUrl, endPoint, body), headers: headers);
    if (response.statusCode == 200) {
      var jsonRes = convert.jsonDecode(response.body);
      user = UserItem.fromJson(jsonRes['data']);
      return user;
    }
    return Future.error('error');
  }
}
