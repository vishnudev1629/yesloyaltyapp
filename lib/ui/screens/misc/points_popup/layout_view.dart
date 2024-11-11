import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PointsCredited extends StatelessWidget {
  final String paymentTime;
  final String barnchName;
  final String cashierName;
  final String transactionId;
  final String coins;
  final bool isCredited;
  const PointsCredited(
      {Key? key,
      required this.paymentTime,
      required this.coins,
      required this.barnchName,
      required this.isCredited,
      required this.cashierName,
      required this.transactionId})
      : super(key: key);

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
                PaymentStatusWidget(
                  isCredited: isCredited,
                ),
                const SizedBox(height: 10),
                Text(
                  isCredited ? 'Loyalty Credited' : 'Loyalty Debited',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text('${coins} Points',
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
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
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text('Transaction Id',
                        style: TextStyle(fontSize: 10, color: Colors.grey)),
                    Spacer(),
                    Text(transactionId ?? '',
                        style: TextStyle(fontSize: 10, color: Colors.black)),
                  ],
                ),
                const SizedBox(height: 9),
                Row(
                  children: [
                    Text('Branch',
                        style: TextStyle(fontSize: 10, color: Colors.grey)),
                    Spacer(),
                    Text(barnchName,
                        style: TextStyle(fontSize: 10, color: Colors.black)),
                  ],
                ),
                const SizedBox(height: 9),
                Row(
                  children: [
                    Text('Cashier Name',
                        style: TextStyle(fontSize: 10, color: Colors.grey)),
                    Spacer(),
                    Text(cashierName ?? '',
                        style: TextStyle(fontSize: 10, color: Colors.black)),
                  ],
                ),
                const SizedBox(height: 9),
                Row(
                  children: [
                    Text('Payment Time',
                        style: TextStyle(fontSize: 10, color: Colors.grey)),
                    Spacer(),
                    Text(paymentTime,
                        style: TextStyle(fontSize: 10, color: Colors.black)),
                  ],
                ),
                const SizedBox(height: 9),
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

class PaymentStatusWidget extends StatefulWidget {
  bool isCredited;
  PaymentStatusWidget({Key? key, this.isCredited = true}) : super(key: key);

  @override
  State<PaymentStatusWidget> createState() => _PaymentStatusWidgetState();
}

class _PaymentStatusWidgetState extends State<PaymentStatusWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000), // Adjust duration as needed
    );

    // Define the animation curve (optional)
    final curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    // Define the animation
    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curvedAnimation);

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    // Dispose the animation controller when not needed
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80, // Adjust width as needed
      height: 80, // Adjust height as needed
      decoration: BoxDecoration(
        color: widget.isCredited
            ? const Color.fromARGB(255, 240, 255, 248)
            : Color.fromARGB(255, 255, 240, 240), // Red background color
        borderRadius: BorderRadius.circular(80), // Border radius of 80
      ),
      child: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Opacity(
              opacity: _animation.value,
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: widget.isCredited
                      ? const Color(0xFF23A26D)
                      : Color.fromARGB(255, 236, 41, 41),
                  borderRadius: BorderRadius.circular(90),
                ),
                child: const Icon(
                  Icons.check,
                  color: Color.fromARGB(255, 255, 255, 255),
                  size: 40.0,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
