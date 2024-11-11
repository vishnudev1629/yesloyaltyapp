import 'dart:async';
import 'package:Yes_Loyalty/core/constants/const.dart';
import 'package:Yes_Loyalty/core/constants/text_styles.dart';
import 'package:Yes_Loyalty/core/db/hive_db/adapters/user_details_adapter/user_details_adapter.dart';
import 'package:Yes_Loyalty/core/db/hive_db/boxes/user_details_box.dart';
import 'package:Yes_Loyalty/core/routes/app_route_config.dart';
import 'package:Yes_Loyalty/core/view_model/verify_otp/verify_otp_bloc.dart';
import 'package:Yes_Loyalty/ui/animations/toast.dart';
import 'package:Yes_Loyalty/ui/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Yes_Loyalty/ui/widgets/buttons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

import 'package:flutter/cupertino.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  bool showDots = false;
  TextEditingController otpController = TextEditingController();
  TextEditingController newpasswordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  var otpErrorText;

  final FocusNode newpassFocusnode = FocusNode();
  final FocusNode confirmpassFocusnode = FocusNode();
  bool otpResent = false;
  String? selectedDialCode = "";

  String email = '';

  @override
  void initState() {
    super.initState();
    _loadDataFromHive();
  }

  @override
  void dispose() {
    otpController.dispose();
    newpasswordController.dispose();
    confirmpasswordController.dispose();
    newpassFocusnode.dispose();
    confirmpassFocusnode.dispose();
    super.dispose();
  }

  Future<void> _loadDataFromHive() async {
    UserDetailsDB userDetails = UserDetailsBox.get(0);
    if (userDetails != null) {
      setState(() {
        email = userDetails.email;
      });
    }
  }

  void _submitForm() {
    context.read<VerifyOtpBloc>().add(
        VerifyOtpEvent.resetPassword(email: email, otp: otpController.text));
  }

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    double width60 = screenwidth * 120 / FigmaConstants.figmaDeviceWidth;
    final otpwidth = (screenwidth - width60) / 6;
    final otpheight = screenheight * 57 / FigmaConstants.figmaDeviceHeight;
    final spacebtwotp = screenwidth * 10 / FigmaConstants.figmaDeviceWidth;

    return GestureDetector(
      onTap: () {
        confirmpassFocusnode.unfocus();
        newpassFocusnode.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: MultiBlocListener(
            listeners: [
              BlocListener<VerifyOtpBloc, VerifyOtpState>(
                listener: (context, state) {
                  state.maybeWhen(
                    success: (resetPasswordModel, otpSuccessModel) async {
                      if (otpSuccessModel != null) {
                        await UserDetailsBox.put(
                          0,
                          UserDetailsDB(
                              remember_token:
                                  otpSuccessModel.data.rememberToken),
                        );
                        navigateToPasswordChange(context);
                      }
                      if (resetPasswordModel != null) {
                        showCustomToast(
                            context,
                            'OTP has been resent to your email',
                            MediaQuery.of(context).size.height * 0.7);
                      }
                    },
                    failure: (error) {
                      showCustomToast(
                          context,
                          'Failed to verify OTP or resend OTP',
                          MediaQuery.of(context).size.height * 0.7);
                    },
                    validationError: (otpError, emailError) {
                      if (otpError != null) {
                        setState(() {
                          otpErrorText = otpError;
                        });
                      }
                      if (emailError != null) {
                        setState(() {
                          // _emailErrorText = emailError;
                        });
                      }
                    },
                    orElse: () {},
                  );
                },
              ),
            ],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                HomeAppBar(
                  onBackTap: () async {
                    Navigator.of(context).pop();
                  },
                  isthereQr: false,
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: OuterPaddingConstant(context),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "OTP verification",
                        style: TextStyles.rubik20black33w600,
                      ),
                      const SizedBox(height: 20),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text:
                                    'Please enter the OTP which has been sent to ',
                                style: GoogleFonts.rubik(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF777777),
                                )),
                            TextSpan(
                                text: email,
                                style: GoogleFonts.rubik(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF333333),
                                )),
                          ],
                        ),
                      ),

                      // Text(
                      //   'Enter the 6 digit OTP which has been sent to ${email}',
                      //   style: TextStyles.rubik14black33w300,
                      // ),
                      const SizedBox(height: 20),
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            PinCodeTextField(
                              controller: otpController,
                              keyboardType: TextInputType.number,
                              highlight: true,
                              highlightColor: Colors.blue,
                              defaultBorderColor: Colors.black,
                              hasTextBorderColor: Colors.green,
                              maxLength: 6,
                              pinTextStyle: TextStyles.bold24black24,
                              pinBoxRadius: 9,
                              pinBoxWidth: otpwidth,
                              pinBoxHeight: otpheight,
                              pinBoxBorderWidth: 1,
                              pinBoxOuterPadding:
                                  EdgeInsets.only(right: spacebtwotp),
                              onTextChanged: (_) {},
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                otpErrorText ?? '',
                                style: GoogleFonts.rubik(color: Colors.red),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      ColoredButton(
                        onPressed: _submitForm,
                        text: 'Verify OTP',
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Didn't you recieve the OTP?",
                            style: TextStyles.rubikregular14grey66w500,
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                otpResent = false; // Reset flag
                                otpErrorText = null; // Clear error text
                              });
                              context.read<VerifyOtpBloc>().add(
                                  VerifyOtpEvent.forgotPassword(email: email));
                            },
                            child: Text(
                              'Resend OTP',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                    ],
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
