import 'package:Yes_Loyalty/core/constants/text_styles.dart';
import 'package:flutter/material.dart';

class UpcomingStatusNofificationWidget extends StatelessWidget {
  const UpcomingStatusNofificationWidget({
    super.key,
    required this.outerpadding,
  });

  final EdgeInsets outerpadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: outerpadding,
      child: Container(
        height: 93.0,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 8.0,
              height: 93.0,
              color: Colors.blue,
            ),
            const SizedBox(width: 8.0),
            const Padding(
              padding: EdgeInsets.only(top: 5),
              child: Icon(
                Icons.info,
                color: Colors.blue,
              ),
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Information',
                      style: TextStyles.rubik16black24w2700,
                    ),
                    const SizedBox(height: 4.0),
                    const Text(
                      'You will receive the offer in next transaction. Please show this to the cashier before invoicing you.',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PointsRequiredNofificationWidget extends StatelessWidget {
  final pointsRequired;
  const PointsRequiredNofificationWidget({
    super.key,
    required this.outerpadding,
    this.pointsRequired,
  });

  final EdgeInsets outerpadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: outerpadding,
      child: Container(
        height: 80.0,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 8.0,
              height: 80.0,
              color: Colors.blue,
            ),
            const SizedBox(width: 8.0),
            const Padding(
              padding: EdgeInsets.only(top: 5),
              child: Icon(
                Icons.info,
                color: Colors.blue,
              ),
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Information',
                      style: TextStyles.rubik16black24w2700,
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      'You need $pointsRequired more points to avail offer',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
