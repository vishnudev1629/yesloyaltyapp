import 'package:Yes_Loyalty/core/db/shared/shared_prefernce.dart';
import 'package:Yes_Loyalty/core/model/otp_failure_model/otp_failure_model.dart';
import 'package:Yes_Loyalty/core/model/reset_password_model/reset_password_model.dart';
import 'package:dartz/dartz.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:Yes_Loyalty/core/constants/const.dart';

class ResetPasswordService {
  static Future<Either<OtpFailureModel, ResetPasswordModel>> verifyOtp(
      {required String password,
      required String password_confirm,
      required String remember_token}) async {
    String accessToken =
        await GetSharedPreferences.getAccessToken() ?? 'Access Token empty';
    final token = accessToken;

    final url = Uri.parse('${ApiConstants.baseUrl}user/password/reset');
    Map<String, dynamic> formData = {
      'password': password,
      'password_confirm': password_confirm,
      'remember_token': remember_token,
    };

    final response = await http.post(url,
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: formData);
    try {
      if (response.statusCode == 200) {
        var jsonMap = json.decode(response.body);

        ResetPasswordModel resetPasswordModel =
            ResetPasswordModel.fromJson(jsonMap);

        return right(resetPasswordModel);
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
