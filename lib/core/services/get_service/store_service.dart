// File: offer_list_service.dart

import 'dart:convert';
import 'package:Yes_Loyalty/core/model/failure/mainfailure.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:Yes_Loyalty/core/constants/const.dart';
import 'package:Yes_Loyalty/core/db/shared/shared_prefernce.dart';
import 'package:Yes_Loyalty/core/model/store_details/store_details.dart';
import '../../model/store_list/store_list.dart';

class StoreService {
  static Future<Either<MainFailure, StoreDetails>> fetchStoreDetails(
      {required String storeId}) async {
    final url = Uri.parse('${ApiConstants.baseUrl}branch/${storeId}/info');

    String accessToken =
        await GetSharedPreferences.getAccessToken() ?? 'Access Token empty';

    // Add your Bearer token here
    final token = accessToken;
    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        // Parse response body to UserDetails object
        final jsonData = json.decode(response.body);
        StoreDetails storeDetails = StoreDetails.fromJson(jsonData);

        return right(storeDetails); // Return UserDetails object
      } else {
        final jsonData = json.decode(response.body);
        return left(MainFailure.serverFailure()); // Return UserDetails object
      }
    } catch (e) {
      return left(MainFailure.clientFailure(
          message: e.toString())); // Return UserDetails object
    }
  }

  static Future<Either<MainFailure, StoreList>> fetchStoreList() async {
    final url = Uri.parse('${ApiConstants.baseUrl}branch/list');

    String accessToken =
        await GetSharedPreferences.getAccessToken() ?? 'Access Token empty';

    // Add your Bearer token here
    final token = accessToken;
    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        // Parse response body to UserDetails object
        final jsonData = json.decode(response.body);
        StoreList storeList = StoreList.fromJson(jsonData);

        return right(storeList); // Return UserDetails object
      } else {
        final jsonData = json.decode(response.body);
        return left(MainFailure.serverFailure()); // Return UserDetails object
      }
    } catch (e) {
      return left(MainFailure.clientFailure(
          message: e.toString())); // Return UserDetails object
    }
  }
}
