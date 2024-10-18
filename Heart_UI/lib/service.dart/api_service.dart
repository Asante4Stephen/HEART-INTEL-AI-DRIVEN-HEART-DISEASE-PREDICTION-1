import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String _baseUrl = 'https://heart-disease-detector.onrender.com';

  Future<dynamic> checkHeartDisease({
    required int age,
    required int sex,
    required int chestPainType,
    required double restingBloodPressure,
    required double serumCholesterol,
    required int fastingBloodSugarLevel,
    required int restingElectrocardiographicResults,
    required int maximumHeartRate,
    required int exerciseInducedAngina,
    required double stDepression,
    required int slope,
    required int numberOfMajorVessels,
    required int thalliumStressTestResults,
  }) async {
    final url = Uri.parse('$_baseUrl/heart-api/');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'age': age,
          'sex': sex,
          'chest_pain_type' : chestPainType,
          'resting_blood_pressure': restingBloodPressure,
          'serum_cholesterol': serumCholesterol,
          'fasting_blood_sugar_level': fastingBloodSugarLevel,
          'resting_electrocardiographoc_results': restingElectrocardiographicResults,
          'maximum_heart_rate': maximumHeartRate,
          'exercise_induced_agina': exerciseInducedAngina,
          'st_depression': stDepression,
          'slope': slope,
          'number_of_major_vessels': numberOfMajorVessels,
          'thallium_stress_test_results': thalliumStressTestResults
        }),
      );

      if (response.statusCode == 200) {
       
        try {
          return jsonDecode(response.body);
        } catch (e) {
         
          return response.body;
        }
      } else {
        return {
          'error': 'Failed to check heart disease: ${response.statusCode}'
        };
      }
    } catch (e) {
      return {'error': 'An error occurred: $e'};
    }
  }
}
