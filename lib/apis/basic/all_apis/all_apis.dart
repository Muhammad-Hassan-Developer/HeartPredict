import 'package:heart_prediction/apis/basic/basic_urls.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AllApis{
 static  Future<String> predictHeartDiseaseApi() async {
    final prediction = Uri.parse('https://prediction-d7d561d9ab6c.herokuapp.com/predict');

    final Map<String,double> data = {
      "age": 63,
      "sex": 1,
      "cp": 3,
      "trestbps": 145,
      "chol": 233,
      "fbs": 1,
      "restecg": 0,
      "thalach": 150,
      "exang": 0,
      "oldpeak": 2.3,
      "slope": 0,
      "ca": 0,
      "thal": 1
    };

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