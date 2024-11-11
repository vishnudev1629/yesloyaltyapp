// File: offer_list_service.dart

import 'dart:convert';
import 'package:Yes_Loyalty/core/model/failure/mainfailure.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:Yes_Loyalty/core/constants/const.dart';
import 'package:Yes_Loyalty/core/db/shared/shared_prefernce.dart';
import 'package:Yes_Loyalty/core/model/offers_info/offers_info.dart';
import 'package:Yes_Loyalty/core/model/offers_list/offers_list.dart';

class OffersService {
  static Future<Either<MainFailure, OffersList>> fetchOfferListData() async {
    String? storedBranchId = await GetSharedPreferences.getbranchId();
    final url = storedBranchId != null && storedBranchId.isNotEmpty
        ? Uri.parse('${ApiConstants.baseUrl}branch/$storedBranchId/offers/list')
        : Uri.parse('${ApiConstants.baseUrl}branch/offers/list');

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
        print('response --------------------- ${response.statusCode}');
        // Parse response body to UserDetails object
        final jsonData = json.decode(response.body);
        OffersList offersList = OffersList.fromJson(jsonData);
        print(offersList.data?[0].brochure);
        return right(offersList);
      } else {
        print('response --------------------- ${response.statusCode}');
        final jsonData = json.decode(response.body);
        return left(MainFailure.serverFailure());
      }
    } catch (e) {
      return left(MainFailure.clientFailure(message: e.toString()));
    }
  }

  static Future<Either<MainFailure, OffersInfo>> fetchOfferInfo() async {
    final url = Uri.parse('${ApiConstants.baseUrl}branch/1000/offers/12');

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
        final jsonData = json.decode(response.body);
        OffersInfo offersInfo = OffersInfo.fromJson(jsonData);
        return right(offersInfo);
      } else {
        final jsonData = json.decode(response.body);
        return left(MainFailure.serverFailure());
      }
    } catch (e) {
      return left(MainFailure.clientFailure(message: e.toString()));
    }
  }
}
