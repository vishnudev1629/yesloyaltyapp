import 'dart:convert';
import 'package:Yes_Loyalty/core/model/failure/mainfailure.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:Yes_Loyalty/core/constants/const.dart';
import 'package:Yes_Loyalty/core/db/shared/shared_prefernce.dart';
import 'package:Yes_Loyalty/core/model/transaction_details/transaction_details.dart';


class FetchTransactionService {
  static  Future<Either<MainFailure, TransactionDetails>>  fetchTransactinData() async {
    String? storedBranchId = await GetSharedPreferences.getbranchId();
    // Check if the stored branch ID is not empty
    if (storedBranchId != null && storedBranchId.isNotEmpty) {
      // Use the stored branch ID instead of the default value
      String branchid = storedBranchId;
    }

    // Construct the URL based on the branch ID
    final url = storedBranchId != null && storedBranchId.isNotEmpty
        ? Uri.parse(
            '${ApiConstants.baseUrl}user/transaction?branch_id=$storedBranchId')
        : Uri.parse('${ApiConstants.baseUrl}user/transaction');
    // Print the stored access token
    String accessToken =
        await GetSharedPreferences.getAccessToken() ?? 'Access Token empty';

  try {
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $accessToken',
        },
      );

      if (response.statusCode == 200) {
        // Parse response body to UserDetails object
        final jsonData = json.decode(response.body);
        TransactionDetails userDetails = TransactionDetails.fromJson(jsonData);

        print("fetching successfull ${userDetails.data?[0].storeId}");
        return right(userDetails) ; // Return UserDetails object
      } else {
        print("fetching failed");
        final jsonData = json.decode(response.body);
        return left(MainFailure.serverFailure()) ; // Return UserDetails object
      }
    } catch (e) {
      return left(MainFailure.clientFailure(message: e.toString())) ; // Return UserDetails object
    }
  }
}

