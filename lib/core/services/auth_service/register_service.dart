import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:Yes_Loyalty/core/constants/const.dart';
import 'package:dartz/dartz.dart';
import 'package:Yes_Loyalty/core/model/validation_response/validation_response.dart';

class RegsiterService {
  static Future<Either<dynamic, dynamic>> register({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String password_confirm,
  }) async {
    final url = Uri.parse('${ApiConstants.baseUrl}user/register');

    // Define form data
    Map<String, String> formData = {
      "name": name,
      "email": email,
      "phone": phone,
      "password": password,
      "password_confirm": password_confirm,
    };

    // Encode the form data
    var request = http.MultipartRequest('POST', url);
    formData.forEach((key, value) {
      request.fields[key] = value;
    });

    // Send the request
    try {
      var response = await request.send();

      // Read the response body
      var responseBody = await response.stream.bytesToString();

      // Check the response status code
      if (response.statusCode == 200) {
        var jsonMap = json.decode(responseBody);
        return right(jsonMap);
      } else if (response.statusCode == 500) {
        var jsonMap = json.decode(responseBody);
        var validate = ValidationResponse.fromJson(jsonMap);
        return left(validate);
      }
    } catch (e) {
      return left(e.toString());
    }
    return left("Unexpected error occurred");
  }
}
