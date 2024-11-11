import 'package:Yes_Loyalty/core/db/hive_db/boxes/user_details_box.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:Yes_Loyalty/core/constants/const.dart';
import 'package:Yes_Loyalty/core/db/shared/shared_prefernce.dart';

class LogoutService {
  static Future<Either<int, int>> logout() async {
    final url = Uri.parse('${ApiConstants.baseUrl}user/logout');

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
        UserDetailsBox.clear();
        return right(1);
      } else {
        return left(0);
      }
    } catch (e) {
     return left(0);
    }
  }
}
