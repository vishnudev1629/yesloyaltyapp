// import 'dart:convert';
// import 'package:Yes_Loyalty/core/constants/text_styles.dart';
// import 'package:flutter/material.dart';
// import 'package:qr_flutter/qr_flutter.dart';
// import 'package:Yes_Loyalty/core/db/shared/shared_prefernce.dart';

// class QrPopup extends StatelessWidget {
//   const QrPopup({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(20.0),
//       ),
//       child: FutureBuilder(
//         future: _loadCustomerId(), // Retrieve customer ID asynchronously
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             // Display a loading indicator while retrieving customer ID
//             return const CircularProgressIndicator();
//           } else if (snapshot.hasError) {
//             // Handle error
//             return Text('Error: ${snapshot.error}');
//           } else {
//             final jsonData = "type#user##value#${snapshot.data}";
//             final jsonString = const JsonEncoder().convert(jsonData);
//             // Customer ID loaded successfully, display QR code
//             return SizedBox(
//               width: 80,
//               height: 300,
//               child: Stack(
//                 children: [
//                   Align(
//                     alignment: Alignment.center,
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         const SizedBox(height: 0),
//                         CustomPaint(
//                           painter: QRBorderPainter(),
//                           child: QrImageView(
//                             data: jsonString,
//                             version: QrVersions.auto,
//                             size: 150,
//                           ),
//                         ),
//                         const SizedBox(height: 30),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 14),
//                           child: Column(
//                             children: [
//                               Text(
//                                 "NB: Scan the QR code at the bill desk to avail your offers.",
//                                 style: TextStyles.medium14black3B,
//                                 textAlign: TextAlign.center,
//                               )
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Positioned(
//                     bottom: 99,
//                     left: 108,
//                     child: Text(
//                       '${snapshot.data}',
//                       style: TextStyles.rubikregular16black24w400,
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }

//   Future _loadCustomerId() async {
//     var accessToken =
//         await GetSharedPreferences.getCustomerId() ?? 'Access Token empty';
//     return accessToken;
//   }
// }

// class QRBorderPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.black
//       ..strokeWidth = 2.0
//       ..style = PaintingStyle.stroke;

//     final path = Path();
//     const borderLength = 29.0; // Length of the straight border segments
//     const radius = 10.0; // Radius for the curves

//     // Top left corner
//     path.moveTo(0, borderLength);
//     path.lineTo(0, radius);
//     path.quadraticBezierTo(0, 0, radius, 0);
//     path.lineTo(borderLength, 0);

//     // Top right corner
//     path.moveTo(size.width - borderLength, 0);
//     path.lineTo(size.width - radius, 0);
//     path.quadraticBezierTo(size.width, 0, size.width, radius);
//     path.lineTo(size.width, borderLength);

//     // Bottom right corner
//     path.moveTo(size.width, size.height - borderLength);
//     path.lineTo(size.width, size.height - radius);
//     path.quadraticBezierTo(
//         size.width, size.height, size.width - radius, size.height);
//     path.lineTo(size.width - borderLength, size.height);

//     // Bottom left corner
//     path.moveTo(borderLength, size.height);
//     path.lineTo(radius, size.height);
//     path.quadraticBezierTo(0, size.height, 0, size.height - radius);
//     path.lineTo(0, size.height - borderLength);

//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }
