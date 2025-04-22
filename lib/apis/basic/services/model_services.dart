import 'package:heart_prediction/apis/basic/basic_urls.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ModelServices{
 static  Future<String> predictHeartDiseaseApi(final Map<String, double>data) async {
    final prediction = Uri.parse(BasicUrls.predictionUrl);

    try {
      final response = await http.post(
        prediction,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        return result['prediction'].toString(); // just "1" or "0"
      } else {
        return 'Error: ${response.statusCode}';
      }
    } catch (e) {
      return 'Exception: $e';
    }
  }
}