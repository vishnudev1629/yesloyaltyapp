import 'dart:convert';
import 'package:Yes_Loyalty/core/model/failure/mainfailure.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:Yes_Loyalty/core/constants/const.dart';
import 'package:Yes_Loyalty/core/db/shared/shared_prefernce.dart';
import 'package:Yes_Loyalty/core/model/user_details/user_details.dart';

class FetchUserService {
  static Future<Either<MainFailure, UserDetails>>  fetchUserData() async {
    final url = Uri.parse('${ApiConstants.baseUrl}dashboard');

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
        UserDetails userDetails = UserDetails.fromJson(jsonData);
        await SetSharedPreferences.storeCustomerId(
            userDetails.data!.user!.customerId as int);

        return right(userDetails) ; // Return UserDetails object
      } else {
        final jsonData = json.decode(response.body);
           return left(MainFailure.serverFailure()) ; // Return UserDetails object
      }
    } catch (e) {
         return left(MainFailure.clientFailure(message: e.toString())) ; // Return UserDetails object
    }
  }
}
