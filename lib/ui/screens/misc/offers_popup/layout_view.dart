import 'package:Yes_Loyalty/core/constants/text_styles.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OffersPopup extends StatelessWidget {
  const OffersPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        children: [
          const SizedBox(height: 90),
          Center(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(9)),
              width: 310,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 27,
                  top: 27,
                  bottom: 27,
                  right: 27,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                        alignment: Alignment.centerRight,
                        child: SvgPicture.asset("assets/Close.svg")),
                    const SizedBox(height: 90),
                    Text(
                      "Offer dates",
                      style: TextStyles.regular16black33,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Offer expires 11 May 2024",
                      style: TextStyles.regular14bgrey70,
                    ),
                    const SizedBox(height: 5),
                    const DottedLine(
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.center,
                      lineLength: double.infinity,
                      lineThickness: 2.0,
                      dashLength: 9,
                      dashColor: Color(0xFFA2A2A2),
                      dashRadius: 3,
                      dashGapLength: 4.0,
                      dashGapColor: Colors.transparent,
                      dashGapRadius: 2,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          "Offer rules",
                          style: TextStyles.regular16black33,
                        ),
                        const Spacer(),
                        SvgPicture.asset('assets/Down_arrow.svg'),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text(
                        "Donec vel tortor quis justo iaculis elementum sit amet vel magna."),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          "Terms & Conditions",
                          style: TextStyles.regular16black33,
                        ),
                        const Spacer(),
                        SvgPicture.asset('assets/Down_arrow.svg'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
