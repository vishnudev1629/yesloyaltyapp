import 'package:shared_preferences/shared_preferences.dart';

class SetSharedPreferences {
  static Future storeNotificationPreference(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('preference', value);
  }

  static Future storeCustomerId(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('customerId', value);
  }

  static Future storeAccessToken(String accessToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('accessToken', accessToken);
  }

  static Future storeQRResult(String qrResult) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('qrResult', qrResult);
  }

  static Future storeBranchId(String branchId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('branchId', branchId);
  }

  static Future storeBranchNAme(String BranchNAme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('BranchNAme', BranchNAme);
  }

  static Future homescreenLoaded(bool profileLoaded) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('profileLoaded', false);
  }

  static Future storeCountrycode(String countrycode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('key', countrycode);
  }

  // Method to check and clear data on the first run after reinstallation
  static Future checkAndClearFirstRunData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Check if this is the first run after installation
    bool isFirstRun = prefs.getBool('isFirstRun') ?? true;

    if (isFirstRun) {
      // If it's the first run, clear all stored data
      await prefs.clear();
      // Set the flag to false to indicate that the app has run at least once
      await prefs.setBool('isFirstRun', false);
    }
  }
}

class GetSharedPreferences {
  static Future<int?> getCustomerId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('customerId');
  }

  static Future<String?> getAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('accessToken');
  }

  static Future<String?> getQRResult() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('qrResult');
  }

  static Future<String?> getbranchId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('branchId');
  }

  static Future<String?> getBranchNAme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('BranchNAme');
  }

  static Future<void> deleteBranchId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('branchId');
  }

  static Future<void> deleteAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('accessToken');
  }

  static Future homeScreenLoaded() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('profileLoaded');
  }

  static Future getCountrycodes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('key');
  }

  static Future<bool?> getNotificationPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('preference');
  }
}
