import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:Yes_Loyalty/core/constants/const.dart';
import 'package:Yes_Loyalty/core/db/shared/shared_prefernce.dart';

class DeleteAccountService {
  static Future<Either<int, int>> deleteAccount() async {
    final url = Uri.parse('${ApiConstants.baseUrl}user/account/delete');

    String accessToken =
        await GetSharedPreferences.getAccessToken() ?? 'Access Token empty';

    // Add your Bearer token here
    final token =
        'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMDg5OTcxYTEzMDE4MWM3MzM3ODZkZDRiNmQzN2NiY2M4NDA3ZWE1YTRhYjNmNzUzZDQ2ZTEzOWYwZTgzODIxZDJhNjIwNzg0ZWU5OGY1MDMiLCJpYXQiOjE3MTc3NDUwOTcuMzc0NTgyLCJuYmYiOjE3MTc3NDUwOTcuMzc0NTg0LCJleHAiOjE3NDkyODEwOTcuMzczMDIxLCJzdWIiOiIxOTEiLCJzY29wZXMiOltdfQ.pr8gFdb0H3hbll8lW2sZckjhPaHq6ACZ5WFl3HHkGkYECTAOPqx7NHhBZ557O0yj8hy3McgqMYOjlr_V9nor32O_GPzqICO30LkzGHwtIYdc8Q2bfKRAYRyab3vnMJJE7qloMNJgOUirnCcm3VmRiyQ6j3c9WOaEav7DQTnI_JL5yDG1B0CZwfuuXhzs0LUej8fTgyNde-l3NIKlcDCbfSRNc-2LHU2rlYp9AZM28WQysxzWe0f4B7pnUUBo9nrRg5JhD55t0ny0wC9j0sMWSVA5HaDy8ZhQCkKzTMKSHb3rDti3QUe93Vw0nA-k7DaY54gkPEvtAoI-Tvjicc1ZtRym_09rWoFktEdsFhCYrB6Pad7tgKK2_WMEQrJX6GvognH1FjHTmizwARlyaqQbtIdtM2X8gLItm2b5Dm7YhuI_OjxrHD4V1rNAlVLo9UPCgmbuQT7L_1h8MSEJ8H56401k37q__35xPv0k-dzWHdNveVBnkDzIRbSm4ryMQsQaRrfWWdbUhc7DTvrmso3-QYTfAzls_ucG3GfFLqs2srQ1sHQabQygCPuCVFgB5KsYRtDRE5kCyksJdYbvHMAFQMT4h-XuT3KDayXLaMp-S0qIOImmIZndDW9mbIpQ9FQz1k4LHdUOk4SgxEGNHkY-G--n9zMQXWBCaVV-OseTeL8';
    try {
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $accessToken',
        },
      );

      if (response.statusCode == 200) {
        return right(1); 
      } else {
        // Handle other status codes
        return left(0);
      }
    } catch (e) {
      return  left(0);
    }
  }
}
