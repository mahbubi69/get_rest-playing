import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class Network {
  final String baseUrl = "https://api.npoint.io/99c279bb173a6e28359c/";

  Future<dynamic> getMethod() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      var resp = json.decode(response.body);
      print(resp);
      return resp;
    } else {
      print('url not connetted');
    }
  }
}
