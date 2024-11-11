// import 'package:yes_loyality/core/constants/common.dart';
// import 'package:yes_loyality/core/constants/const.dart';
// import 'package:yes_loyality/core/constants/text_styles.dart';
// import 'package:yes_loyality/ui/widgets/appbar.dart';
// import 'package:yes_loyality/ui/widgets/buttons.dart';
// import 'package:yes_loyality/ui/widgets/number_textfield.dart';
// import 'package:yes_loyality/ui/widgets/textfield.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_svg/svg.dart';

// class ProfileUpdate extends StatelessWidget {
//   const ProfileUpdate({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     double screenheight = screenHeight(context);
//     double height29 = screenheight * 29 / FigmaConstants.figmaDeviceHeight;
//     double height8 = screenheight * 8 / FigmaConstants.figmaDeviceHeight;
//     double height22 = screenheight * 22 / FigmaConstants.figmaDeviceHeight;
//     double height140 = screenheight * 140 / FigmaConstants.figmaDeviceHeight;
//     EdgeInsets outerpadding = OuterPaddingConstant(context);

//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               const SizedBox(height: 22),
//               const HomeAppBar(),
//               SizedBox(height: height29),
//               Center(
//                 child: Padding(
//                   padding: outerpadding,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Align(
//                         alignment: Alignment.centerRight,
//                         child: SvgPicture.asset('assets/edit_icon.svg'),
//                       ),
//                       const CircleAvatar(
//                         radius: 40,
//                         backgroundImage: AssetImage('assets/john.jpg'),
//                         backgroundColor: Colors.white,
//                       ),
//                       SizedBox(height: height8),
//                       Text(
//                         'Jane',
//                         style: TextStyles.rubik16red23w700,
//                       ),
//                       SizedBox(height: height22),
//                        Textfield(
//                         hintText: 'Name',
//                       ),
//                       SizedBox(height: height22),
//                        Textfield(
//                         hintText: 'Address',
//                       ),
//                       SizedBox(height: height22),
//                        Textfield(
//                         hintText: 'email',
//                       ),
//                       SizedBox(height: height22),
//                       const NumberTextFieldWithCountry(),
//                       SizedBox(height: height140),
//                       SolidColorButton(
//                         text: 'Save',
//                         onPressed: () {},
//                         backgroundColor: Color(0xFF2DC962),
//                         borderColor: Color(0xFF2DC962),
//                       ),
//                       const SizedBox(height: 34)
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
