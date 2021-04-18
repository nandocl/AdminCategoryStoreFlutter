import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class HttpMainService {
  static String backendUrl = 'https://url...';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  static Future<String> get(String endPoint) async {
    String url = backendUrl + endPoint;
    var res = await http.get(Uri.parse(url), headers: headers);
    if (res.statusCode == 200) {
      return res.body;
    }
    return null;
  }

  static Future<String> post(String endPoint, Map<String, dynamic> body) async {
    String url = backendUrl + endPoint;
    var res = await http.post(Uri.parse(url),
        headers: headers, body: convert.jsonEncode(body));
    if (res.statusCode == 200) {
      return res.body;
    }
    return null;
  }

  static Future<String> put(String endPoint, Map<String, dynamic> body) async {
    String url = backendUrl + endPoint;
    var res = await http.put(Uri.parse(url),
        headers: headers, body: convert.jsonEncode(body));
    if (res.statusCode == 200) {
      return res.body;
    }
    return null;
  }

  static Future<bool> delete(String endPoint) async {
    String url = backendUrl + endPoint;
    var res = await http.delete(Uri.parse(url), headers: headers);
    if (res.statusCode == 200) {
      return true;
    }
    return null;
  }
}
