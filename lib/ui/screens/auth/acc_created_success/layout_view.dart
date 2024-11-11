import 'package:Yes_Loyalty/core/constants/common.dart';
import 'package:Yes_Loyalty/core/constants/const.dart';
import 'package:Yes_Loyalty/core/constants/text_styles.dart';
import 'package:Yes_Loyalty/core/routes/app_route_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AccountCreatedSuccessScreen extends StatelessWidget {
  const AccountCreatedSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
        return navigateTosiginCleared(context);
      });
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: outerPadding(context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/accout_created_tick.svg'),
              SizedBox(height: 30),
              Text(
                "Account Created Successfully",
                style: TextStyles.rubik24black24w600,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
