import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/prayer.dart';

class PrayerApiProvider {
  Client client = Client();
  final _apiKey = 'your_api_key';

  Future<Prayer> fetchTimesList() async {
    print("entered");
    final response = await client
        .get("https://muslimsalat.com/lahore.json");
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return Prayer.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}