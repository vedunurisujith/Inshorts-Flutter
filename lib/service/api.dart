import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:inshortapp/models/model.dart';

class Api_Manager {
  Future<Welcome> getNews() async {
    var client = http.Client();
    var welcome = null;
    try {
      var response = await client.get(
          'http://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=a859f7dbd8c64a88b9a344442698b58d');

      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        welcome = Welcome.fromJson(jsonMap);
      }
    } catch (Exception) {
      return welcome;
    }
    return welcome;
  }
}
