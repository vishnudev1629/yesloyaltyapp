import 'package:flutter/material.dart';

// Function for navigating to screen 7 while clearing the stack
void navigateTosiginCleared(BuildContext context) {
  Navigator.of(context).pushNamedAndRemoveUntil(
    '/sigin',
    (Route route) => false,
  );
}

void navigateToHomeCleared(BuildContext context) =>
    Navigator.of(context).pushNamedAndRemoveUntil(
      '/home',
      (Route route) => false,
    );

void navigateBackToHome(BuildContext context) {
  Navigator.of(context).popUntil(ModalRoute.withName('/home'));
}

void navigateToSiginCleared(BuildContext context) =>
    Navigator.of(context).pushNamedAndRemoveUntil(
      '/sigin',
      (Route route) => false,
    );

void navigateToAccountCreatedSuccess(
  BuildContext context,
) =>
    Navigator.of(context).pushNamed('/accCreatedSuccess');

void navigateToSignUp(BuildContext context) =>
    Navigator.of(context).pushNamed('/signup');

void navigateToprofileEdit(BuildContext context) =>
    Navigator.of(context).pushNamed('/profileEdit');

void navigateToUserSettings(BuildContext context) =>
    Navigator.of(context).pushNamed('/userSettings');

void navigateToGetSupport(BuildContext context) =>
    Navigator.of(context).pushNamed('/getSupport');
void navigateToqrResultSCreen(BuildContext context) =>
    Navigator.of(context).pushNamed('/qrResult');

void navigateToChangePassword(BuildContext context) =>
    Navigator.of(context).pushNamed('/changepassword');

void navigateTodeleteAcc(BuildContext context) =>
    Navigator.of(context).pushNamed('/deleteAccount');

void navigateToForgotPassword(BuildContext context) =>
    Navigator.of(context).pushNamed('/forgotpassword');

void navigateToPrivacyPolicy(BuildContext context) =>
    Navigator.of(context).pushNamed('/privacy');

void navigateToTermsandCond(BuildContext context) =>
    Navigator.of(context).pushNamed('/termsAndCondition');

void navigateToOtpVerify(
  BuildContext context,
) =>
    Navigator.of(context).pushNamed('/verfyOtp');

void navigateToPasswordChange(
  BuildContext context,
) =>
    Navigator.of(context).pushNamed('/resetpassword');

void navigateTopdfScreen(BuildContext context,{required String broshureUrl}) =>
    Navigator.of(context).pushNamed('/pdfScreen',arguments: broshureUrl);
