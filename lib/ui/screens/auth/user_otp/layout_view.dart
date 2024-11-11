import 'package:Yes_Loyalty/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:Yes_Loyalty/core/constants/common.dart';
import 'package:Yes_Loyalty/core/constants/const.dart';
import 'package:Yes_Loyalty/core/constants/text_styles.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class Enter_otp_page extends StatelessWidget {
  const Enter_otp_page({super.key});

  @override
  Widget build(BuildContext context) {
    double screenheight = screenHeight(context);
    double screenwidth = screenWidth(context);

    double sizedBoxHeight1 =
        screenheight * 190 / FigmaConstants.figmaDeviceHeight;
    double sizedBoxHeight2 =
        screenheight * 20 / FigmaConstants.figmaDeviceHeight;
    double sizedBoxHeight3 =
        screenheight * 24 / FigmaConstants.figmaDeviceHeight;
    double sizedBoxHeight4 =
        screenheight * 60 / FigmaConstants.figmaDeviceHeight;
    double sizedBoxHeight5 =
        screenheight * 45 / FigmaConstants.figmaDeviceHeight;
    double sizedBoxHeight6 =
        screenheight * 14 / FigmaConstants.figmaDeviceHeight;
    final otpwidth = screenwidth * 74 / FigmaConstants.figmaDeviceWidth;
    final otpheight = screenheight * 57 / FigmaConstants.figmaDeviceHeight;
    final spacebtwotp = screenwidth * 10 / FigmaConstants.figmaDeviceWidth;
    EdgeInsets outerpadding = OuterPaddingConstant(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: outerpadding,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: sizedBoxHeight1,
              ),
              Image.asset(
                'assets/Yes_Loyalty_log.png',
              ),
              SizedBox(
                height: sizedBoxHeight2,
              ),
              Center(child: Text("Enter OTP", style: TextStyles.bold24black24)),
              SizedBox(
                height: sizedBoxHeight3,
              ),
              Center(
                child: Text(
                    "A verification code has been sent to (219)555-O114",
                    textAlign: TextAlign.center,
                    style: TextStyles.semibold16grey77),
              ),
              SizedBox(
                height: sizedBoxHeight4,
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    PinCodeTextField(
                        keyboardType: TextInputType.number,
                        autofocus: false,
                        highlight: true,
                        highlightColor: Colors.blue,
                        defaultBorderColor: Colors.black,
                        hasTextBorderColor: Colors.green,
                        maxLength: 4,
                        pinTextStyle: TextStyles.bold24black24,
                        pinBoxRadius: 10,
                        pinBoxWidth: otpwidth,
                        pinBoxHeight: otpheight,
                        pinBoxBorderWidth: 1,
                        pinBoxOuterPadding: EdgeInsets.only(right: spacebtwotp),
                        onTextChanged: (text) {})
                  ],
                ),
              ),
              SizedBox(
                height: sizedBoxHeight5,
              ),
              ColoredButton(
                  text: 'Verify',
                  onPressed: () {
                    
                
                  }),
              SizedBox(
                height: sizedBoxHeight6,
              ),
              ColorlessButton(
                onPressed: () {},
                text: 'Cancel',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//-------------------