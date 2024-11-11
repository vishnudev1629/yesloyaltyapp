import 'package:Yes_Loyalty/core/db/shared/shared_prefernce.dart';
import 'package:Yes_Loyalty/core/model/get_support_model/get_support_model.dart';
import 'package:Yes_Loyalty/core/model/get_support_validation/get_support_validation.dart';
import 'package:dartz/dartz.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:Yes_Loyalty/core/constants/const.dart';

class GetSupportService {
  static Future<Either<GetSupportValidation, GetSupportModel>> contactUs({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) async {
   
    String accessToken =
        await GetSharedPreferences.getAccessToken() ?? 'Access Token empty';
    final token = accessToken;

    final url = Uri.parse('${ApiConstants.baseUrl}user/get-support');

    // Define form data
    Map<String, String> formData = {
      'name': name,
      'email': email,
      'subject': subject,
      'message': message,
    };

    // Encode the form data
    final response = await http.post(url,
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: formData);
    try {
      if (response.statusCode == 200) {
        var jsonMap = json.decode(response.body);
        GetSupportModel getSupportModel = GetSupportModel.fromJson(jsonMap);
       

        return right(getSupportModel);
      } else if (response.statusCode == 500) {
        var jsonMap = json.decode(response.body);
        var validate = GetSupportValidation.fromJson(jsonMap);
         
        return left(validate);
      }
    } catch (e) {
  
      var jsonMap = json.decode(response.body);
      var validate = GetSupportValidation.fromJson(jsonMap);
      return left(validate);
    }
    var jsonMap = json.decode(response.body);
    var validate = GetSupportValidation.fromJson(jsonMap);
    return left(validate);
  }
}
