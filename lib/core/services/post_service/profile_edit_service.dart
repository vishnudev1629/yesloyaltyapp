import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'package:Yes_Loyalty/core/model/validation_response/validation_response.dart';
import 'package:http/http.dart' as http;
import 'package:Yes_Loyalty/core/constants/const.dart';
import 'package:Yes_Loyalty/core/db/shared/shared_prefernce.dart';
import 'package:dartz/dartz.dart';

class ProfileEditService {
  static Future<Either<dynamic, dynamic>> editProfile({
    required String name,
    required String email,
    required String phone,
    File? image,
  }) async {
    String accessToken =
        await GetSharedPreferences.getAccessToken() ?? 'Access Token empty';

    final url = Uri.parse('${ApiConstants.baseUrl}user/modify');

    // Create a multipart request
    var request = http.MultipartRequest('POST', url);

    // Add form fields
    request.fields['name'] = name;
    request.fields['email'] = email;
    request.fields['phone'] = phone;

    // Add image file as a multipart file if provided
    if (image != null) {
      var imagePart = http.MultipartFile(
        'image', // Field name
        image.readAsBytes().asStream(), // Byte stream
        image.lengthSync(), // Length of the file
        filename: image.path.split('/').last, // File name
      );
      request.files.add(imagePart);
    }

    // Set Authorization header with Bearer token
    request.headers['Authorization'] = 'Bearer $accessToken';

    // Send the request
    try {
      var response = await request.send();

      // Read the response body
      var responseBody = await response.stream.bytesToString();

      // Check the response status code
      if (response.statusCode == 200) {
        var jsonMap = json.decode(responseBody);
        return right(1);
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
