import 'package:Yes_Loyalty/core/constants/common.dart';
import 'package:Yes_Loyalty/core/constants/const.dart';
import 'package:Yes_Loyalty/core/constants/text_styles.dart';
import 'package:Yes_Loyalty/core/db/hive_db/adapters/user_details_adapter/user_details_adapter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shimmer/shimmer.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shimmer/shimmer.dart';
import 'package:hive/hive.dart';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProfileShimmer extends StatelessWidget {
  final double? height, width;

  const ProfileShimmer({Key? key, this.height, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenheight = screenHeight(context);
    double screenwidth = screenWidth(context);
    EdgeInsets outerpadding = OuterPaddingConstant(context);
    double height18 = screenheight * 18 / FigmaConstants.figmaDeviceHeight;
    double height21 = screenheight * 21 / FigmaConstants.figmaDeviceHeight;
    double height23 = screenheight * 23 / FigmaConstants.figmaDeviceHeight;
    double width15 = screenwidth * 15 / FigmaConstants.figmaDeviceWidth;
    double width20 = screenwidth * 20 / FigmaConstants.figmaDeviceWidth;
    double width30 = screenwidth * 30 / FigmaConstants.figmaDeviceWidth;
    double height10 = screenheight * 10 / FigmaConstants.figmaDeviceHeight;
    return Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade200,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 40, 40, 40),
          borderRadius: BorderRadius.circular(15)),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: width15),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: height18),
                    const CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: ClipOval(
                          child: Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.grey,
                      )),
                    ),
                  ],
                ),
                SizedBox(width: width15),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height18),
                    Text(
                      '',
                      style: TextStyles.rubik18whiteFF,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "",
                      style: TextStyles.rubik14whiteFF,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Text(
                        //   'Customer Id : $customerid',
                        //   style: TextStyles.ibmMono14whiteFF,
                        // ),
                        Text(
                          '',
                          style: TextStyles.rubik14whiteFF,
                        ),
                        SizedBox(width: 9),
                        //  IconButton(onPressed: (), icon: icon)
                     ],
                    ),
                    SizedBox(height: height21),
                  ],
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: height18),
                    ],
                  ),
                ),
                SizedBox(width: width20)
              ],
            ),
           
          ],
        ),
      ),
    );
  }
}
