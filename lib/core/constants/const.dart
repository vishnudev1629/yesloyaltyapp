import 'package:Yes_Loyalty/core/constants/common.dart';
import 'package:flutter/material.dart';

class ColorConstants {
  static const purpleColor96 = Color(0xFFC83E96);
  static const whiteColorFF = Color(0xFFFFFFFF);
  static const greyF7 = Color(0xFFF7F7F7);
  static const grey = Colors.grey;
  static const greyD9 = Color(0xFFD9D9D9);
  static const greyD7 = Color(0xFFD7D7D7);
  static const greyF5 = Color(0xFF2DC962);
  static const Color purpleColorF8 = Color(0xFFFFEBF8);
  static const Color secondaryTextColor = Color(0xFF777777);
  static const Color dividerColor = Color(0xFFEDEDED);
}

class ApiConstants {
 // static const String baseUrl = 'https://yesyesloyalty.agatebc.in/api/'; - prod
 static const String baseUrl = 'https://yyldev.agatebc.in/api/'; //dev
//static const String baseUrl = 'https://yl.tekpeak.in/api/';
}

class WidthConstants {
  static const double buttonWidth = 330;
  static const double buttonHeight = 50;
  static const double sizedboxWidth = 25;
}

EdgeInsets OuterPaddingConstant(BuildContext context) {
  double screenwidth = MediaQuery.of(context).size.width;
  double width30 = screenwidth * 30 / FigmaConstants.figmaDeviceWidth;
  return EdgeInsets.only(left: width30, right: width30);
}

class FigmaConstants {
  static const double figmaDeviceHeight = 852;
  static const double figmaDeviceWidth = 393;
}

class HorizontalSpacing extends StatelessWidget {
  final double width;
  const HorizontalSpacing({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: spacingHorizontal(
      context,
      width: width,
    ));
  }
}

class VerticalSpacing extends StatelessWidget {
  final double height;
  const VerticalSpacing({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: spacingVertical(
      context,
      height: height,
    ));
  }
}
