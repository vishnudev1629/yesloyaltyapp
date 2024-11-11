import 'package:Yes_Loyalty/ui/widgets/buttons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Yes_Loyalty/core/constants/common.dart';
import 'package:Yes_Loyalty/core/constants/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:Yes_Loyalty/core/constants/text_styles.dart';
import 'package:Yes_Loyalty/core/db/shared/shared_prefernce.dart';

import 'package:Yes_Loyalty/core/view_model/store_details/store_details_bloc.dart';
import 'package:Yes_Loyalty/core/view_model/store_list/store_list_bloc.dart';

import 'package:Yes_Loyalty/core/view_model/user_details/user_details_bloc.dart';

import 'package:Yes_Loyalty/ui/widgets/appbar.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class VerifyCode extends StatefulWidget {
  const VerifyCode({super.key});

  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  var a = '22';

  @override
  void initState() {
    context
        .read<UserDetailsBloc>()
        .add(const UserDetailsEvent.fetchUserDetails());
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      a = GetSharedPreferences.getAccessToken.toString();

      context
          .read<StoreDetailsBloc>()
          .add(StoreDetailsEvent.fetchStoreDetails(storeId: '1'));
      context
          .read<UserDetailsBloc>()
          .add(const UserDetailsEvent.fetchUserDetails());
    });
  }

  Map bankData = {};
  var bank;

  @override
  Widget build(BuildContext context) {
    context
        .read<UserDetailsBloc>()
        .add(const UserDetailsEvent.fetchUserDetails());
    double screenheight = screenHeight(context);
    double height23 = screenheight * 23 / FigmaConstants.figmaDeviceHeight;

    // Fetch user details when the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context
          .read<UserDetailsBloc>()
          .add(const UserDetailsEvent.fetchUserDetails());
      context.read<StoreListBloc>().add(const StoreListEvent.fetchStoreList());
    });

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height23),
            const HomeAppBar(
              isthereQr: false,
            ),
            SizedBox(height: height23),
            SizedBox(height: 20),
            Padding(
              padding: OuterPaddingConstant(context),
              child: VerifycodeWidget(),
            ),
          ],
        ),
      ),
    );
  }
}

class VerifycodeWidget extends StatelessWidget {
  const VerifycodeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double screenheight = screenHeight(context);
    double screenwidth = screenWidth(context);
    final spacebtwotp = screenwidth * 10 / FigmaConstants.figmaDeviceWidth;

    final otpwidth = screenwidth * 74 / FigmaConstants.figmaDeviceWidth;
    final otpheight = screenheight * 57 / FigmaConstants.figmaDeviceHeight;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Check your email",
          style: TextStyles.rubik20black33w600,
        ),
        SizedBox(height: 22),
        RichText(
          textAlign: TextAlign.left,
          softWrap: true,
          text: TextSpan(
            children: [
              TextSpan(
                text: 'We sent a reset link to',
                style: TextStyles.rubik16black77w400, // Bold style
              ),
              TextSpan(
                text: ' contact@dscode.com ',
                style: TextStyles.rubik16black33,
              ),
              TextSpan(
                text: 'enter 5 digit code that mentioned in the email',
                style: TextStyles.rubik16black77w400, // Bold style
              ),
            ],
          ),

          // TextSpan(
          //   text:
          //       "",
          //   style: TextStyles.rubik16black77w400,
          // ),
        ),
        SizedBox(height: 18),
        SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PinCodeTextField(
                keyboardType: TextInputType.number,
                autofocus: false,
                highlight: true,
                highlightColor: Colors.blue,
                defaultBorderColor: Colors.black,
                hasTextBorderColor: Colors.green,
                maxLength: 4,
                pinTextStyle: TextStyles.bold24black24,
                pinBoxRadius: 10,
                pinBoxWidth: otpwidth,
                pinBoxHeight: otpheight,
                pinBoxBorderWidth: 1,
                pinBoxOuterPadding: EdgeInsets.only(right: spacebtwotp),
                onTextChanged: (text) {},
              ),
            ],
          ),
        ),
        SizedBox(height: 26),
        ColoredButton(text: "Verify Code", onPressed: () {}),
        SizedBox(height: 19),
        Center(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Haven’t got the email yet? ',
                  style: TextStyles.rubik14black66, // Bold style
                ),
                TextSpan(
                  text: 'Resend email',
                  style: TextStyles.rubik14black33ul,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
