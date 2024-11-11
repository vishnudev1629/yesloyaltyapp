import 'package:Yes_Loyalty/core/constants/common.dart';
import 'package:Yes_Loyalty/core/constants/const.dart';
import 'package:Yes_Loyalty/core/constants/text_styles.dart';
import 'package:flutter/material.dart';

class ColorlessButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const ColorlessButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    double screenwidth = screenWidth(context);
    final buttonwidth = screenwidth * 335 / FigmaConstants.figmaDeviceWidth;

    return SizedBox(
      width: buttonwidth,
      height: 56,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            ColorConstants.whiteColorFF,
          ),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: const BorderSide(
                color: Color(0xFFEE1F23),
                width: 1.0,
              ),
            ),
          ),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyles.semibold16red23,
        ),
      ),
    );
  }
}

class SolidColorButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final Color backgroundColor;
  final Color borderColor;

  const SolidColorButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    double screenwidth = screenWidth(context);
    final buttonwidth = screenwidth * 335 / FigmaConstants.figmaDeviceWidth;
    return SizedBox(
      width: buttonwidth,
      height: 56,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              //  ColorConstants.greyF5,
              backgroundColor),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(
                color: borderColor,
                width: 1.0,
              ),
            ),
          ),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyles.medium14whiteFF,
        ),
      ),
    );
  }
}

class AddToCartButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  const AddToCartButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    double screenheight = screenHeight(context);
    double screenwidth = screenWidth(context);
    final buttonwidth = screenwidth * 133 / FigmaConstants.figmaDeviceWidth;
    final buttonheight = screenheight * 36 / FigmaConstants.figmaDeviceHeight;

    return SizedBox(
      width: buttonwidth,
      height: buttonheight,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorConstants.purpleColor96,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(text, style: TextStyles.semiBold14whiteFF),
      ),
    );
  }
}

class ColoredButton extends StatelessWidget {
  final bool isactive;
  final VoidCallback? onPressed;
  final String text;
  const ColoredButton({
    Key? key,
    required this.text,
    this.isactive = true,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = screenWidth(context);
    final buttonwidth = screenwidth * 335 / FigmaConstants.figmaDeviceWidth;

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        width: buttonwidth,
        height: 56,
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: isactive
                        ? [
                            Color(0xFFFF6D70),
                            Color(0xFFEE1F23),
                          ]
                        : [
                            Color.fromARGB(210, 255, 109, 111),
                            Color.fromARGB(207, 238, 31, 34),
                          ],
                  ),
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(5),
                onTap: onPressed,
                child: Center(
                  // Centering text vertically
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyles.rubikmedium16whiteFF,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LogoutColoredButton extends StatelessWidget {
  final bool isactive;
  final VoidCallback? onPressed;
  final String text;
  const LogoutColoredButton({
    Key? key,
    required this.text,
    this.isactive = true,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        width: double.infinity,
        height: 44,
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: isactive
                        ? [
                            Color(0xFFFF6D70),
                            Color(0xFFEE1F23),
                          ]
                        : [
                            Color.fromARGB(210, 255, 109, 111),
                            Color.fromARGB(207, 238, 31, 34),
                          ],
                  ),
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(5),
                onTap: onPressed,
                child: Center(
                  // Centering text vertically
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyles.rubikmedium16whiteFF,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PopupSectionButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  const PopupSectionButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = screenWidth(context);
    final buttonwidth = screenwidth * 95 / FigmaConstants.figmaDeviceWidth;

    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: SizedBox(
        width: buttonwidth,
        height: 28,
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(color: Color(0xFFFFFFFF)),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(5),
                onTap: onPressed,
                child: Center(
                  // Centering text vertically
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyles.rubikmedium12blue2FF,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QrResultDoneButton extends StatelessWidget {
  final bool isactive;
  final VoidCallback? onPressed;
  final String text;
  const QrResultDoneButton({
    Key? key,
    required this.text,
    this.isactive = true,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = screenWidth(context);
    final buttonwidth = screenwidth * 335 / FigmaConstants.figmaDeviceWidth;

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        width: 140,
        height: 45,
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: isactive
                        ? [
                            Color(0xFFFF6D70),
                            Color(0xFFEE1F23),
                          ]
                        : [
                            Color.fromARGB(210, 255, 109, 111),
                            Color.fromARGB(207, 238, 31, 34),
                          ],
                  ),
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(5),
                onTap: onPressed,
                child: Center(
                  // Centering text vertically
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyles.rubik14whiteFF,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
