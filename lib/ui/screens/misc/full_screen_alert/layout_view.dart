import 'package:Yes_Loyalty/core/constants/common.dart';
import 'package:Yes_Loyalty/core/constants/const.dart';
import 'package:Yes_Loyalty/core/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class EnterOtpVerified extends StatelessWidget {
  const EnterOtpVerified({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () async {

   
    
    });
    
    final screenheight = screenHeight(context);
    //double screenwidth = screenWidth(context);
    final sizedboxh1 = screenheight * 134 / FigmaConstants.figmaDeviceHeight;
    final sizedboxh2 = screenheight * 48.52 / FigmaConstants.figmaDeviceHeight;
    final sizedboxh3 = screenheight * 29 / FigmaConstants.figmaDeviceHeight;
    final sizedboxh4 = screenheight * 16 / FigmaConstants.figmaDeviceHeight;

    EdgeInsets outerpadding = OuterPaddingConstant(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: outerpadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: sizedboxh1),
                Image.asset('assets/Yes_Loyalty_log.png'),
                SizedBox(height: sizedboxh2),
                // Image.asset('assets/verified_success.png'),
                SvgPicture.asset(
                  'assets/verified_success.svg',
                ),

                SizedBox(height: sizedboxh3),
                Center(
                  child: Text(
                    'Account Created Successfully',
                    textAlign: TextAlign.center,
                    style: TextStyles.bold24black24,
                  ),
                ),
                SizedBox(height: sizedboxh4),
                Center(
                  child: Text(
                    'Your account created successfully',
                    textAlign: TextAlign.center,
                    style: TextStyles.semibold16grey77,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
