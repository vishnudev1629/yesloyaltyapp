import 'package:Yes_Loyalty/core/constants/common.dart';
import 'package:Yes_Loyalty/core/constants/const.dart';
import 'package:Yes_Loyalty/core/constants/text_styles.dart';
import 'package:Yes_Loyalty/core/db/hive_db/boxes/country_code_box.dart';
import 'package:Yes_Loyalty/core/db/hive_db/boxes/selected_branch_box.dart';
import 'package:Yes_Loyalty/core/db/hive_db/boxes/user_details_box.dart';
import 'package:Yes_Loyalty/core/db/shared/shared_prefernce.dart';
import 'package:Yes_Loyalty/core/routes/app_route_config.dart';
import 'package:Yes_Loyalty/core/view_model/delete_account/delete_account_bloc.dart';
import 'package:Yes_Loyalty/ui/animations/toast.dart';
import 'package:Yes_Loyalty/ui/widgets/appbar.dart';
import 'package:Yes_Loyalty/ui/widgets/buttons.dart';
import 'package:Yes_Loyalty/ui/widgets/captcha_textfield.dart';
import 'package:Yes_Loyalty/ui/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';



class DeleteAccount extends StatefulWidget {
  const DeleteAccount({
    super.key,
  });

  @override
  State<DeleteAccount> createState() => _DeleteAccountState();
}

class _DeleteAccountState extends State<DeleteAccount> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _captcha = '';
  String? _captchaErrorText;
  final TextEditingController _captchaController = TextEditingController();
  final TextEditingController _userInputController = TextEditingController();
  final FocusNode captchaFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    _generateCaptcha();
  }

  void _generateCaptcha() {
    final random = Random();
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    _captcha = List.generate(6, (index) => chars[random.nextInt(chars.length)]).join();
    _captchaController.text = _captcha;
  }

  void _verifyCaptcha() {
    if (_userInputController.text == _captcha) {
      print("Matched");
    } else {
      print("Incorrect Captcha");
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenheight = screenHeight(context);
    double screenwidth = screenWidth(context);
    double height23 = screenheight * 23 / FigmaConstants.figmaDeviceHeight;
    final paddingw30 = screenwidth * 30 / FigmaConstants.figmaDeviceWidth;
    
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: BlocListener<DeleteAccountBloc, DeleteAccountState>(
          listener: (context, state) async {
            if (state.isError) {
              showCustomToast(context, 'Oops Something Went Wrong', MediaQuery.of(context).size.height * 0.7);
            } else if (!state.isLoading && state.statusCode == 1) {
              await GetSharedPreferences.deleteAccessToken();
              await GetSharedPreferences.getCountrycodes();
              await UserDetailsBox.clear();
              await countryCodeBox.clear();
              await selectedBranchBox.clear();
              showCustomToast(context, 'Account Deleted Successfully', MediaQuery.of(context).size.height * 0.8);
              Future.delayed(Duration(milliseconds: 600), () {
                if (context.mounted) {
                  return navigateTosiginCleared(context);
                }
              });
            }
          },
          child: GestureDetector(
            onTap: () {
              captchaFocus.unfocus();
            },
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            HomeAppBar(
                              onBackTap: () async {
                                Navigator.of(context).pop();
                              },
                            ),
                            SizedBox(height: height23),
                            Padding(
                              padding: EdgeInsets.only(
                                left: paddingw30,
                                right: paddingw30,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Delete account",
                                    style: TextStyles.rubik20black33w600,
                                  ),
                                  SizedBox(height: 22),
                                  Text(
                                    "Are you sure you want to delete your account?",
                                    style: TextStyles.rubik18greyw600,
                                  ),
                                  SizedBox(height: 22),
                                  Text(
                                    "Deleting your Yes Yes Loyalty account will permanently remove all public and private information associated with your profile. You must cancel your subscription before deleting your account. To confirm the permanent deletion, please fill in the CAPTCHA below and click 'Delete Account.",
                                    style: TextStyles.rubikregular16grey77w400,
                                  ),
                                  SizedBox(height: 22),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      CaptchaTextField(
                                        textEditingController: _captchaController,
                                        refresh: _generateCaptcha,
                                        textstyle: TextStyles.bold11black24,
                                      ),
                                      const SizedBox(height: 20),
                                      Textfield(
                                        focusNode: captchaFocus,
                                        errorText: _captchaErrorText,
                                        hintText: 'Enter Captcha Here',
                                        textEditingController: _userInputController,
                                      ),
                                      const SizedBox(height: 20),
                                      Center(
                                        child: ColoredButton(
                                          text: 'Delete Account',
                                          onPressed: () async {
                                            if (_userInputController.text == _captcha) {
                                              print("Matched");
                                              setState(() {
                                                _captchaErrorText = null;
                                              });

                                              context
                                                  .read<DeleteAccountBloc>()
                                                  .add(DeleteAccountEvent.deleteAccount());
                                            } else {
                                              setState(() {
                                                _captchaErrorText = 'Incorrect Captcha';
                                              });

                                              print("Not Matched");
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 50),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

