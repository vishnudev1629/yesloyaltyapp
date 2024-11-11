import 'package:Yes_Loyalty/core/constants/text_styles.dart';
import 'package:Yes_Loyalty/ui/screens/misc/points_popup/layout_view.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class QrResultPopup extends StatelessWidget {
  final bool isOfferApplied;
  final String coins;
  final String offerStatus;
  final String storeName;
  final String transactionID;
  final String cashierName;
  final bool isCredited;
  final String transactionTime;
  const QrResultPopup({
    Key? key,
    required this.coins,
    required this.isCredited,
    required this.storeName,
    required this.transactionID,
    required this.cashierName,
    required this.transactionTime,
    required this.offerStatus,
    required this.isOfferApplied,
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
                isOfferApplied
                    ? Image.asset(
                        'assets/animations/gift.gif',
                        width: 110,
                        height: 110,
                      )
                    : PaymentStatusWidget(
                        isCredited: isCredited,
                      ),
                const SizedBox(height: 10),
                Text(
                  isCredited ? 'Loyalty Credited' : 'Offer Availed',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text("${coins} Points",
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                Text(
                  "${offerStatus}",
                  style: TextStyles.rubikregular14black70,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
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
                const SizedBox(height: 9),
                Row(
                  children: [
                    Text('Store Name',
                        style: TextStyle(fontSize: 10, color: Colors.grey)),
                    Spacer(),
                    Text(storeName,
                        style: TextStyle(fontSize: 10, color: Colors.black)),
                  ],
                ),
                const SizedBox(height: 9),
                Row(
                  children: [
                    Text('Cashier Name',
                        style: TextStyle(fontSize: 10, color: Colors.grey)),
                    Spacer(),
                    Text(cashierName,
                        style: TextStyle(fontSize: 10, color: Colors.black)),
                  ],
                ),
                const SizedBox(height: 9),
                Row(
                  children: [
                    Text('Transaction ID',
                        style: TextStyle(fontSize: 10, color: Colors.grey)),
                    Spacer(),
                    Text(transactionID,
                        style: TextStyle(fontSize: 10, color: Colors.black)),
                  ],
                ),
                const SizedBox(height: 9),
                Row(
                  children: [
                    Text('Transaction Time',
                        style: TextStyle(fontSize: 10, color: Colors.grey)),
                    Spacer(),
                    Text(formatDateTime(transactionTime),
                        style: TextStyle(fontSize: 10, color: Colors.black)),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Material(
              shape: CircleBorder(),
              color: Colors.transparent,
              child: IconButton(
                splashRadius: 50,
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
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
