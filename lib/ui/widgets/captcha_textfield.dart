import 'package:Yes_Loyalty/core/constants/common.dart';
import 'package:Yes_Loyalty/core/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class CaptchaTextField extends StatelessWidget {
  var errorText;
  final String? hintText;
  final bool enabled;
  final VoidCallback refresh;
  TextEditingController textEditingController;
  final TextStyle textstyle;

  CaptchaTextField({
    super.key,
    this.hintText,
    required this.textEditingController,
    required this.textstyle,
    required this.refresh,
    this.errorText,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    double elempaddingHorizontal = elemPaddingHorizontal(context);
    double elempaddingVertical = elemGapVertical(context);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFE5E5E5), // Set the entire background to grey
        borderRadius: BorderRadius.circular(9),
        border: Border.all(
          color: Colors.grey, // Set border color to grey
          width: 1, // Set border width
        ),
      ),
      child: TextField(
        readOnly: true,
        style: TextStyles.rubikregular16black24w400,
        enabled: enabled,
        controller: textEditingController,
        decoration: InputDecoration(
          // labelText: "Captcha",

          contentPadding: EdgeInsets.symmetric(
            horizontal: elempaddingHorizontal,
            vertical: elempaddingVertical,
          ),
          hintText: hintText,
          errorText: errorText,
          border: InputBorder.none, // Remove default border
          suffixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: refresh,
              child: SvgPicture.asset(
                'assets/refresh_icon.svg',
                height: 2,
                width: 5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
