import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:uri/uri.dart';

class RequestAssistant {
  static Future<dynamic> getRequest(url) async {
    Uri url2 = Uri.parse(url);

    http.Response response = await http.get(url2);
    try {
      if (response.statusCode == 200) {
        String jSonData = response.body;
        var decodeData = jsonDecode(jSonData);
        return decodeData;
      } else {
        return "Failed, No response.";
      }
    } catch (exp) {
      return "Failed.";
    }
  }
}
