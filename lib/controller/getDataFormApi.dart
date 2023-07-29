import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as a;

class GetDataFormApi {
  static List<dynamic> genres = [];

  Future<void> getDataGenres() async {
    var response = await a.get(
        Uri.parse(
            "https://raw.githubusercontent.com/erik-sytnyk/movies-list/master/db.json"),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        });

    if (response.statusCode == 200) {
      genres = jsonDecode(response.body)["genres"];
      debugPrint(genres.toString());
    } else {
      throw Exception("Failed to load data");
    }
  }
}
