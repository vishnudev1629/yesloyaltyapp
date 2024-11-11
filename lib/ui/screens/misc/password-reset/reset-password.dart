import 'package:Yes_Loyalty/core/constants/common.dart';
import 'package:Yes_Loyalty/core/constants/text_styles.dart';
import 'package:Yes_Loyalty/core/db/hive_db/adapters/user_details_adapter/user_details_adapter.dart';
import 'package:Yes_Loyalty/core/db/hive_db/boxes/user_details_box.dart';
import 'package:Yes_Loyalty/core/routes/app_route_config.dart';
import 'package:Yes_Loyalty/core/view_model/reset_password/reset_password_bloc.dart';
import 'package:Yes_Loyalty/ui/animations/toast.dart';
import 'package:Yes_Loyalty/ui/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Yes_Loyalty/ui/widgets/buttons.dart';
import 'package:Yes_Loyalty/ui/widgets/password_textfield.dart';

class ResetPasswordChangeScreen extends StatefulWidget {
  const ResetPasswordChangeScreen({super.key});

  @override
  State<ResetPasswordChangeScreen> createState() =>
      _ResetPasswordChangeScreenState();
}

class _ResetPasswordChangeScreenState extends State<ResetPasswordChangeScreen> {
  bool showDots = false;

  final _newpasswordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();

  var _newpasswordErorText;
  var _confirmpasswordErorText;
  final FocusNode currentpassFocusnode = FocusNode();
  final FocusNode newpassFocusnode = FocusNode();
  final FocusNode confirmpassFocusnode = FocusNode();
  bool _formSubmitted = false; // Add this boolean flag
  String? selectedDialCode = "";
  var remember_token = "";

  @override
  void initState() {
    super.initState();
    _loadDataFromHive();
    _confirmpasswordController.addListener(_onNewPassWordChanged);
    _newpasswordController.addListener(_onNewPassWordChanged);
  }

  _loadDataFromHive() async {
    UserDetailsDB userDetails = UserDetailsBox.get(0);
    if (userDetails != null) {
      // Update the text controllers with data from userDetails
      setState(() {
        remember_token = userDetails.remember_token.toString();
      });
    }
  }

  @override
  void dispose() {
    _confirmpasswordController.removeListener(_onNewPassWordChanged);
    _newpasswordController.removeListener(_onNewPassWordChanged);
    super.dispose();
  }

  void _onCurrentPasswordChanged() {
    if (_formSubmitted) {
      // Only validate if the form has been submitted at least once
    }
  }

  void _onNewPassWordChanged() {
    if (_formSubmitted) {
      // Only validate if the form has been submitted at least once
      _validateConfirmPassword(
        confirmpassword: _confirmpasswordController.text.toString(),
        password: _newpasswordController.text.toString(),
      );
      _validatenewPassword(
        password: _newpasswordController.text.toString(),
      );
    }
  }

  void _validatenewPassword({
    required String password,
  }) {
    setState(() {
      if (password.isEmpty) {
        _newpasswordErorText = 'Password is required';
      } else if (password.length < 8) {
        _newpasswordErorText = 'Password must be at least 8 characters long';
      } else if (!password.contains(RegExp(r'[A-Z]'))) {
        _newpasswordErorText = 'Password must contain at least one uppercase';
      } else if (!password.contains(RegExp(r'[a-z]'))) {
        _newpasswordErorText = 'Password must contain at least one lowercase';
      } else if (!password.contains(RegExp(r'[0-9]'))) {
        _newpasswordErorText = 'Password must contain at least one digit';
      } else if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
        _newpasswordErorText = 'Should contain at least one special character';
      } else {
        _newpasswordErorText = null;
      }
    });
  }

  void _validateConfirmPassword({
    required String password,
    required String confirmpassword,
  }) {
    setState(() {
      if (confirmpassword.isEmpty) {
        _confirmpasswordErorText = 'Password is required';
      }
      if (password.isEmpty) {
        _newpasswordErorText = 'Password is required';
      } else if (password != confirmpassword &&
          _confirmpasswordController.text.length > 0) {
        _confirmpasswordErorText = 'Passwords do not match';
      } else if (_newpasswordController.text.isEmpty &&
          _confirmpasswordController.text.isEmpty) {
        _newpasswordErorText = null;
        _confirmpasswordErorText = null;
      }
    });
  }

  void _submitForm() {
    setState(() {
      _formSubmitted =
          true; // Set form submitted to true when the button is clicked
      // Validate password field
      _newpasswordErorText = _newpasswordErorText;
      _validateConfirmPassword(
        password: _newpasswordController.text,
        confirmpassword: _confirmpasswordController.text,
      );
      if (_newpasswordController.text.isEmpty ||
          _confirmpasswordController.text.isEmpty) {
        return;
      }
      BlocProvider.of<ResetPasswordBloc>(context).add(
          ResetPasswordEvent.forgotPassword(
              password: _newpasswordController.text,
              password_confirm: _confirmpasswordController.text,
              remember_token: remember_token));
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double elementPaddingVertical = elemPaddingVertical(context); 
    double perc20 = screenHeight * 0.020; // 2.00% of the screen height
    double perc187 = screenHeight * 0.0187; // 1.87% of the screen height
 

    return GestureDetector(
        onTap: () {
          confirmpassFocusnode.unfocus();
          newpassFocusnode.unfocus();
          currentpassFocusnode.unfocus();
        },
        child: BlocConsumer<ResetPasswordBloc, ResetPasswordState>(
            listener: (context, state) {
          state.map(
            initial: (_) {},
            loading: (_) {},
            success: (_) {
              showCustomToast(
                context, "Your password has been successfully changed",
                MediaQuery.of(context).size.height *
                    0.85, // Adjust vertical position here
              );
              setState(() {
                _newpasswordErorText = null;
                _confirmpasswordErorText = null;
              });
              navigateToSiginCleared(context);
            },
            failure: (state) {
              showCustomToast(
                context, "Password Change Failed",
                MediaQuery.of(context).size.height *
                    0.7, // Adjust vertical position here
              );
            },
            validationError: (state) {
              setState(() {
                _newpasswordErorText = state.passwordError;
                _confirmpasswordErorText = state.passwordConfirmError;
              });

              showCustomToast(
                context, "Password Change Failed",
                MediaQuery.of(context).size.height *
                    0.7, // Adjust vertical position here
              );
            },
          );
        }, builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 20),
                  HomeAppBar(
                    onBackTap: () async {
                      Navigator.of(context).pop();
                    },
                    isthereQr: false,
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: outerPadding(context)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Set a new password",
                          style: TextStyles.rubik20black33w600,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Create a new password. Ensure it differs from previous ones for security',
                          style: TextStyles.rubik16black77w400,
                        ),
                        const SizedBox(height: 20),
                        SizedBox(height: elementPaddingVertical),
                        PassWordTextfield(
                          focusNode: newpassFocusnode,
                          errorText: _newpasswordErorText,
                          hintText: 'New Password*',
                          textEditingController: _newpasswordController,
                        ),
                        SizedBox(height: elementPaddingVertical),
                        PassWordTextfield(
                          focusNode: confirmpassFocusnode,
                          errorText: _confirmpasswordErorText,
                          hintText: 'Confirm Password*',
                          textEditingController: _confirmpasswordController,
                        ),
                        SizedBox(height: perc187),
                        SizedBox(height: perc187),
                        SizedBox(height: perc20),
                        ColoredButton(
                          onPressed: _submitForm,
                          text: 'Update Password',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }));
  }
}
