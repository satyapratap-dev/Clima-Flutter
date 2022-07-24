import 'package:http/http.dart';
import 'dart:convert';

class NetworkHelper {
  final String _url;
  NetworkHelper(this._url);

  Future getData() async {
    var uri = Uri.parse(_url);
    var response = await get(uri);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
  }
}
