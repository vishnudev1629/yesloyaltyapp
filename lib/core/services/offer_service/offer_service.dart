import 'dart:convert';
import 'package:Yes_Loyalty/core/model/failure/mainfailure.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:Yes_Loyalty/core/db/shared/shared_prefernce.dart';
import 'package:Yes_Loyalty/core/model/offer_notfication_prefence_model/offer_notfication_prefence_model.dart';

class OfferNotificationPreferenceService {
  static Future<Either<MainFailure, OfferNotficationPrefenceModel>>
      changeNotificationPreferencee({required String offer_notify}) async {
    final url = Uri.parse('https://yyldev.agatebc.in/api/user/config/set');

    String accessToken =
        await GetSharedPreferences.getAccessToken() ?? 'Access Token empty';

    // Add your Bearer token here
    final token = accessToken;
    try {
      var request = http.MultipartRequest('POST', url)
        ..headers['Authorization'] =
            'Bearer $token'
        ..headers['content-type'] = 'multipart/form-data'
        ..fields['offer_notify'] =
            offer_notify ?? '0'; // Add the offer_notify field

      // Send the request and get the streamed response
      var streamedResponse = await request.send();

      // Convert streamed response to a full response
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        // Parse response body to OfferNotficationPrefenceModel object
        final jsonData = json.decode(response.body);
        OfferNotficationPrefenceModel storeList =
            OfferNotficationPrefenceModel.fromJson(jsonData);
        print(storeList.data?.offerNotify);
        return right(storeList);
      } else {
        print('failure');
        return left(MainFailure.serverFailure());
      }
    } catch (e) {
      print('failure');
      return left(MainFailure.clientFailure(message: e.toString()));
    }
  }
}
