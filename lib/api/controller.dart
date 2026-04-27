import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myapp_01/api/model.dart';

class Controller {
  String url = 'https://69ec9e6caf4ff533142b2843.mockapi.io/worker/user';

   Future<void> addData(Model data) async {
    final res = await http.post(
      Uri.parse(url),
      headers: {'content-Type': 'application/json'},
      body: jsonEncode(data.toJson()),
    );
    
    if (res.statusCode == 201) {
      print('Data Added');
    } else {
      print('Data not fatched');
      throw Exception('Data not Fatched');
    }
    getData();
  }

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

  Future<void> updateData(Model data) async {
    final response = await http.put(
      Uri.parse('$url/${data.id}'),
      headers: {'content-Type': 'application/json'},
      body: jsonEncode(data.toJson()),
    );

    if (response.statusCode == 200) {
      print('Data Updated');
    } else if (response.statusCode == 404) {
      throw Exception('Data not found');
    } else {
      throw Exception('Failed to load data');
    }
    getData();
  }

  Future<void> delete(String id) async {
    final response = await http.delete(Uri.parse('$url/$id'));

    if (response.statusCode == 200) {
      print('Data Deleted.');
    } else {
      throw Exception('Failed to Delete data');
    }
    getData();
  }
}
