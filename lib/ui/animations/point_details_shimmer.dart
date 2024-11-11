import 'package:Yes_Loyalty/core/constants/common.dart';
import 'package:Yes_Loyalty/core/constants/const.dart';
import 'package:Yes_Loyalty/core/constants/text_styles.dart';
import 'package:Yes_Loyalty/core/db/hive_db/adapters/user_details_adapter/user_details_adapter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shimmer/shimmer.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shimmer/shimmer.dart';
import 'package:hive/hive.dart';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PointDetailShimmer extends StatelessWidget {
  final double? height, width;

  const PointDetailShimmer({Key? key, this.height, this.width})
      : super(key: key);

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
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 71,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 27),
          Container(
            width: double.infinity,
            height: 71,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 27),
          Container(
            width: double.infinity,
            height: 71,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
