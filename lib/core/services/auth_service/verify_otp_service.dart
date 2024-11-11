import 'package:Yes_Loyalty/core/db/shared/shared_prefernce.dart';
import 'package:Yes_Loyalty/core/model/otp_failure_model/otp_failure_model.dart';
import 'package:Yes_Loyalty/core/model/otp_success_model/otp_success_model.dart';
import 'package:Yes_Loyalty/core/model/update_password_model/update_password_model.dart';
import 'package:dartz/dartz.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:Yes_Loyalty/core/constants/const.dart';

class verifyOtpService {
  static Future<Either<OtpFailureModel, OtpVerificationResponse>> verifyOtp({
    required String email,
    required String otp,
  }) async {
    String accessToken =
        await GetSharedPreferences.getAccessToken() ?? 'Access Token empty';
    final token = accessToken;

    final url = Uri.parse('${ApiConstants.baseUrl}user/verify/otp');
    Map<String, dynamic> formData = {
      'email': email,
      'otp': otp,
    };

    final response = await http.post(url,
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: formData);
    try {
      if (response.statusCode == 200) {
        var jsonMap = json.decode(response.body);
        OtpVerificationResponse updatePasswordModel =
            OtpVerificationResponse.fromJson(jsonMap);

        return right(updatePasswordModel);
      } else if (response.statusCode == 500) {
        var jsonMap = json.decode(response.body);
        var validate = OtpFailureModel.fromJson(jsonMap);

        return left(validate);
      }
    } catch (e) {
      rethrow;
    }
    var jsonMap = json.decode(response.body);
    var validate = OtpFailureModel.fromJson(jsonMap);

    return left(validate);
  }
}
