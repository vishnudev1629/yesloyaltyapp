import 'package:Yes_Loyalty/core/constants/common.dart';
import 'package:Yes_Loyalty/core/constants/const.dart';
import 'package:Yes_Loyalty/core/constants/text_styles.dart';
import 'package:Yes_Loyalty/core/routes/app_route_config.dart';
import 'package:flutter/material.dart';
import 'package:Yes_Loyalty/core/db/shared/shared_prefernce.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenheight = screenHeight(context);
    double height44 = screenheight * 44 / FigmaConstants.figmaDeviceHeight;
    double height8 = screenheight * 8 / FigmaConstants.figmaDeviceHeight;
    checkAccessToken(context);

    return Scaffold(
      body: Center(
        child: Stack(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/yesyes_loyality_logo.png'),
            ],
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Text(
                  "Version 1.0.21 ${ApiConstants.baseUrl == "https://yl.tekpeak.in/api/" ? "D" : ''}",
                  style: TextStyles.rubikregular14black3B,
                ),
                SizedBox(height: height8),
                Text(
                  "Copyright @ 2024 Yes Yes Loyalty",
                  style: TextStyles.rubikregular14grey66,
                ),
                SizedBox(
                  height: height44,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  void checkAccessToken(BuildContext context) async {
    final String? accessToken = await GetSharedPreferences.getAccessToken();
    if (accessToken != null) {
      Future.delayed(const Duration(seconds: 3), () {
        return navigateToHomeCleared(context);
      });
    } else {
      // If no access token, navigate to sign-in screen after delay
      Future.delayed(const Duration(seconds: 3), () {
        return navigateTosiginCleared(context);
      });
    }
  }
}
