// import 'package:barcode_widget/barcode_widget.dart';
// import 'package:yes_loyality/ui/screens/misc/points_popup/layout_view.dart';
// import 'package:dotted_line/dotted_line.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';

// class BarCodePopup extends StatelessWidget {
//   const BarCodePopup({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     WidgetsBinding.instance.addPostFrameCallback((_) async {
//       // BlocProvider.of<ViewUserIdBloc>(context)
//       //     .add(const ViewUserIdEvent.getUserData());
//     });
//     return Dialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//       child: Container(
//         width: 310,
//         height: 210,
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Align(
//                 alignment: Alignment.centerRight,
//                 child: GestureDetector(
//                     // onTap: () {
//                     //   Navigator.pop(context); // Close the dialog
//                     // },
//                     child: SvgPicture.asset(
//                   "assets/Close.svg",
//                   width: 20,
//                 ))),
//             const SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child:
//                    BarcodeWidget(
//                     barcode: Barcode.code128(),
//                     data: "hbj",
//                     width: 200,
//                     height: 100,
//                   ),
               
//             ),
//             const SizedBox(height: 9),
//           ],
//         ),
//       ),
//     );
//   }
// }
