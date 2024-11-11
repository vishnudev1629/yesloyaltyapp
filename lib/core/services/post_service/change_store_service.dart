import 'dart:convert';
import 'package:Yes_Loyalty/core/model/change_store/change_store.dart';
import 'package:Yes_Loyalty/core/model/failure/mainfailure.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:Yes_Loyalty/core/constants/const.dart';
import 'package:Yes_Loyalty/core/db/shared/shared_prefernce.dart';

class ChangeStoreService {
  static Future<Either<MainFailure, ChangeStore>> changeStore(
      {required String storeId}) async {
    final url = Uri.parse('${ApiConstants.baseUrl}branch/change/${storeId}');

    String accessToken =
        await GetSharedPreferences.getAccessToken() ?? 'Access Token empty';

    // Add your Bearer token here
    final token = accessToken;
    try {
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        // Parse response body to UserDetails object
        final jsonData = json.decode(response.body);
        ChangeStore storeList = ChangeStore.fromJson(jsonData);
        return right(storeList);
      } else {
        final jsonData = json.decode(response.body);
        ChangeStore storeList = ChangeStore.fromJson(jsonData);
        return left(MainFailure.serverFailure());
      }
    } catch (e) {
      return left(MainFailure.clientFailure(message: e.toString()));
    }
  }
}
