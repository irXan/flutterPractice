import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myapp_01/api/model.dart';

class Controller {
  String url = 'https://69ec9e6caf4ff533142b2843.mockapi.io/worker/user';

  Future<List<Model>> getData() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((item) => Model.fromJson(item)).toList();
    } else if (response.statusCode == 404) {
      throw Exception('Data not found');
    } else {
      throw Exception('Failed to load data');
    }

  }
}