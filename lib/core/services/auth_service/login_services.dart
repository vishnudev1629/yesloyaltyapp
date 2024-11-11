// ignore_for_file: non_constant_identifier_names

import 'package:Yes_Loyalty/core/db/shared/shared_prefernce.dart';
import 'package:Yes_Loyalty/core/model/login_validation/login_validation.dart';
import 'package:dartz/dartz.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:Yes_Loyalty/core/constants/const.dart';
import 'package:Yes_Loyalty/core/model/login/login.dart';

class LoginService {
  static Future<Either<LoginValidation, Login>> login({
    required String email,
    required String password,
    String? fcm_token,
  }) async {
    final url = Uri.parse('${ApiConstants.baseUrl}user/login');

    // Define form data
    Map<String, String> formData = {
      'email': email,
      'password': password,
      'fcm_token': fcm_token ?? '',
    };

    // Encode the form data
    var response = await http.post(url, body: formData);

    // Check the response status code
    if (response.statusCode == 200) {
      // Decode the response body
  print('${response.body}');
      var jsonMap = json.decode(response.body);

      // Construct Login object from parsed data
      var login = Login.fromJson(jsonMap);

      var accessToken =
          await SetSharedPreferences.storeAccessToken(login.misc.accessToken) ??
              'Access Token empty';
      return right(login);
    } else if (response.statusCode == 500) {
        print('${response.body}');
      var jsonMap = json.decode(response.body);
      
      var validate = LoginValidation.fromJson(jsonMap);

      return left(validate);
    } else {
      print('${response.body}');
      throw Exception('Failed to login: ${response.body}');
    }
  }
}



class DeviceRegistrationService {
  static Future<void> registerNewDevice({
    required String fcmToken,
    required String ipAddress,
    required String platform,
    required String location,
    String? deviceId,
    String? deviceModel,
    String? osVersion,
    String? deviceName,
  }) async {
    final url = Uri.parse('https://yyldev.agatebc.in/api/user/register-new-device');

    // Define form data
    var request = http.MultipartRequest('POST', url)
      ..fields['fcm_token'] = fcmToken
      ..fields['ip_address'] = ipAddress
      ..fields['platform'] = platform
      ..fields['location'] = location
      ..fields['device_id'] = deviceId ?? ''
      ..fields['device_model'] = deviceModel ?? ''
      ..fields['os_version'] = osVersion ?? ''
      ..fields['device_name'] = deviceName ?? '';

    // Send request
    try {
      final response = await request.send();
      final responseData = await http.Response.fromStream(response);
      
      if (response.statusCode == 200) {
        // Handle success
        print('Device registered successfully: ${responseData.body}');
      } else {
        // Handle error
        print('Failed to register device: ${responseData.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
