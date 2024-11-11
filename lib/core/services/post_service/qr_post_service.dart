import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'package:Yes_Loyalty/core/model/qr_credited_model/qr_credited_model.dart';
import 'package:Yes_Loyalty/core/model/qr_validationresponse/qr_validationresponse.dart';
import 'package:Yes_Loyalty/core/model/validation_response/validation_response.dart';
import 'package:http/http.dart' as http;
import 'package:Yes_Loyalty/core/constants/const.dart';
import 'package:Yes_Loyalty/core/db/shared/shared_prefernce.dart';
import 'package:dartz/dartz.dart';

class QRPostService {
  static Future<Either<dynamic, QrCreditedModel>> postQrResponse({
    required String qr_id,
    File? image,
  }) async {
    String accessToken =
        await GetSharedPreferences.getAccessToken() ?? 'Access Token empty';
    final url = Uri.parse('${ApiConstants.baseUrl}store/scan');
    var request = http.MultipartRequest('POST', url);
    request.fields['qr_id'] = qr_id; // Use the qr_id parameter here
    request.headers['Authorization'] = 'Bearer $accessToken';

    try {
      var response = await request.send();
      var responseBody = await response.stream.bytesToString();

      print('-----------------------${response.statusCode}');
      print('-----------------------${responseBody}');

      var jsonResponse = json.decode(responseBody);

      if (response.statusCode == 200) {
        if (jsonResponse is Map<String, dynamic>) {
          QrCreditedModel qrCreditedModel =
              QrCreditedModel.fromJson(jsonResponse);
          print('-----------------------${qrCreditedModel.message}');
          return right(qrCreditedModel);
        } else {
          print('----------------------- Response is not a Map');
          return left("Response is not a Map");
        }
      } else if (response.statusCode == 500) {
        print(jsonResponse.toString());
        var validate = QrValidationresponse.fromJson(jsonResponse);
        print('-----------------errrrrrrrrrrrrrrrrr');

        print('-----------------validation error ${validate}');
        return left(validate);
      } else {
        return left("Unexpected status code: ${response.statusCode}");
      }
    } catch (e) {
      print('a-----------------------${e}');
      return left(e.toString());
    }
  }
}
