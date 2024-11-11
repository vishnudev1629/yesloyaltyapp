import 'package:Yes_Loyalty/core/constants/text_styles.dart';
import 'package:Yes_Loyalty/ui/screens/misc/points_popup/layout_view.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class QrResultValidationPopup extends StatelessWidget {
  final String validationResponse;
  const QrResultValidationPopup({
    Key? key,
    required this.validationResponse,
  }) : super(key: key);

  String formatDate(String createdAt) {
    final DateTime dateTime = DateTime.parse(createdAt);
    return DateFormat('d MMMM yyyy').format(dateTime);
  }

  String formatDateTime(String createdAt) {
    try {
      final DateTime dateTime = DateTime.parse(createdAt);
      return DateFormat('dd-MM-yyyy, HH:mm:ss').format(dateTime);
    } catch (e) {
      return 'July 24 ,2024';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Stack(
        children: [
          Container(
            width: 310,
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                Image.asset(
                  'assets/animations/sorry.gif',
                  width: 110,
                  height: 110,
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Wrap(children: [
                    Text(
                      validationResponse,
                      textAlign: TextAlign.center,
                    )
                  ]),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Material(
              shape: const CircleBorder(),
              color: Colors.transparent,
              child: IconButton(
                splashRadius: 50,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: SvgPicture.asset(
                  "assets/Close.svg",
                  width: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
