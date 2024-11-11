import 'package:Yes_Loyalty/core/db/shared/shared_prefernce.dart';
import 'package:Yes_Loyalty/core/model/change_password_validation/change_password_validation.dart';
import 'package:dartz/dartz.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:Yes_Loyalty/core/constants/const.dart';


class ChangePassWordService {
  static Future<Either<dynamic, dynamic>> changePassword(
      {required String currentPassword,
      required String newPassword,
      required String confirmPassword}) async {
    String accessToken =
        await GetSharedPreferences.getAccessToken() ?? 'Access Token empty';
    final token = accessToken;

    final url = Uri.parse('${ApiConstants.baseUrl}user/password');

    // Define form data
    Map<String, String> formData = {
      'current_password': currentPassword,
      'password': newPassword,
      'confirm_password': confirmPassword,
    };

    // Encode the form data
    final response = await http.post(url,
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: formData);

    // Check the response status code
    if (response.statusCode == 200) {

      var jsonMap = json.decode(response.body);
      return right(jsonMap);
    } else if (response.statusCode == 500) {
  

        var jsonMap = json.decode(response.body);
        var validate = ChangePasswordValidation.fromJson(jsonMap);
        return left(validate);
    } else {
      return left("Unexpected error occurred");
    }
  }
}
