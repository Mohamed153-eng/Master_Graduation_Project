import 'package:http/http.dart' as http;
import 'dart:convert';
class ApiHelper{
 Future<dynamic> get({required String url}) async {
    http.Response response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'There Is A Proplem With Status Code ${response.statusCode}');
    }
  }
}
