import 'package:Yes_Loyalty/core/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ExpenseList extends StatelessWidget {
  final String image;
  final String status;

  final String points;
  final bool isPointRecieved;
  const ExpenseList({
    required this.image,
    required this.status,
    required this.points,
    required this.isPointRecieved,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 71,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(13)),
      child: Row(
        children: [
          const SizedBox(width: 16),
          SvgPicture.asset(image),
          const SizedBox(width: 10),
          Text(
            status,
            style: TextStyles.rubik16black33,
          ),
          const Spacer(),
          RichText(
            text: TextSpan(
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16), // Style for the whole text
              children: <TextSpan>[
                TextSpan(
                  text: points, // Text before the percentage
                  style: TextStyles.rubik16black33w600,
                ),
                TextSpan(
                  text: ' pts', // Percentage sign
                  style: TextStyles.rubik13black33w400,
                ),
              ],
            ),
          ),
          const SizedBox(width: 9)
        ],
      ),
    );
  }
}
