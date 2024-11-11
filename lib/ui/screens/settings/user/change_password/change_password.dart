import 'package:Yes_Loyalty/core/constants/common.dart';
import 'package:Yes_Loyalty/core/constants/text_styles.dart';
import 'package:Yes_Loyalty/core/db/hive_db/boxes/country_code_box.dart';
import 'package:Yes_Loyalty/core/db/hive_db/boxes/selected_branch_box.dart';
import 'package:Yes_Loyalty/core/db/hive_db/boxes/user_details_box.dart';
import 'package:Yes_Loyalty/core/db/shared/shared_prefernce.dart';
import 'package:Yes_Loyalty/core/routes/app_route_config.dart';
import 'package:Yes_Loyalty/core/view_model/change_password/change_password_bloc.dart';
import 'package:Yes_Loyalty/ui/animations/toast.dart';
import 'package:Yes_Loyalty/ui/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Yes_Loyalty/ui/widgets/buttons.dart';
import 'package:Yes_Loyalty/ui/widgets/password_textfield.dart';

class ChangePassWord extends StatefulWidget {
  const ChangePassWord({super.key});

  @override
  State<ChangePassWord> createState() => _ChangePassWordState();
}

class _ChangePassWordState extends State<ChangePassWord> {
  bool showDots = false;
  final _currentpasswordController = TextEditingController();
  final _newpasswordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();

  var _currentpasswordErorText;
  var _newpasswordErorText;
  var _confirmpasswordErorText;
  final FocusNode currentpassFocusnode = FocusNode();
  final FocusNode newpassFocusnode = FocusNode();
  final FocusNode confirmpassFocusnode = FocusNode();
  bool _formSubmitted = false; // Add this boolean flag
  String? selectedDialCode = "";

  @override
  void initState() {
    super.initState();
    _currentpasswordController.addListener(_onCurrentPasswordChanged);
    _newpasswordController.addListener(_onNewPasswordChanged);
    _confirmpasswordController.addListener(_onConfirmPasswordChanged);
  }

  @override
  void dispose() {
    _currentpasswordController.removeListener(_onCurrentPasswordChanged);
    _newpasswordController.removeListener(_onNewPasswordChanged);
    _confirmpasswordController.removeListener(_onConfirmPasswordChanged);
    _currentpasswordController.dispose();
    _newpasswordController.dispose();
    _confirmpasswordController.dispose();
    super.dispose();
  }

  void _onCurrentPasswordChanged() {
    if (_formSubmitted) {
      _validateCurrentPassword(_currentpasswordController.text);
    }
  }

  void _onNewPasswordChanged() {
    if (_formSubmitted) {
      _validateNewPassword(_newpasswordController.text);
      _validateConfirmPassword(
        password: _newpasswordController.text,
        confirmpassword: _confirmpasswordController.text,
      );
    }
  }

  void _onConfirmPasswordChanged() {
    if (_formSubmitted) {
      _validateConfirmPassword(
        password: _newpasswordController.text,
        confirmpassword: _confirmpasswordController.text,
      );
    }
  }

  void _validateCurrentPassword(String value) {
    setState(() {
      if (value.isEmpty) {
        _currentpasswordErorText = 'Password is required';
      } else if (value.length < 8) {
        _currentpasswordErorText =
            'Password must be at least 8 characters long';
      } else {
        _currentpasswordErorText = null; // Clear error if valid
      }
    });
  }

  void _validateNewPassword(String value) {
    setState(() {
      if (value.isEmpty) {
        _newpasswordErorText = 'Password is required';
      } else if (value.length < 8) {
        _newpasswordErorText = 'Password must be at least 8 characters long';
      } else {
        _newpasswordErorText = null; // Clear error if valid
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
      } else if (confirmpassword.length < 8) {
        _confirmpasswordErorText =
            'Password must be at least 8 characters long';
      } else if (password != confirmpassword) {
        _confirmpasswordErorText = 'Passwords do not match';
      } else {
        _confirmpasswordErorText = null; // Clear error if valid
      }
    });
  }

  void _submitForm() {
    setState(() {
      _formSubmitted =
          true; // Set form submitted to true when the button is clicked
      // Validate password field

      _validateCurrentPassword(_currentpasswordController.text);
      _validateNewPassword(_newpasswordController.text);
      _validateConfirmPassword(
        password: _newpasswordController.text,
        confirmpassword: _confirmpasswordController.text,
      );

      if (_confirmpasswordController.text.isNotEmpty &&
          _currentpasswordController.text.isNotEmpty &&
          _newpasswordController.text.isNotEmpty) {
        BlocProvider.of<ChangePasswordBloc>(context)
            .add(ChangePasswordEvent.changePassWord(
          confirmPassword: _confirmpasswordController.text,
          currentPassword: _currentpasswordController.text,
          newPassword: _newpasswordController.text,
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double devicePadding = outerPadding(context);
    double elementPaddingVertical = elemPaddingVertical(context);

    return GestureDetector(
      onTap: () {
        confirmpassFocusnode.unfocus();
        newpassFocusnode.unfocus();
        currentpassFocusnode.unfocus();
      },
      child: BlocConsumer<ChangePasswordBloc, ChangePasswordState>(
          listener: (context, state) {
        state.map(
          initial: (_) {},
          loading: (_) {},
          success: (_) async {
            setState(() {
              _currentpasswordErorText = null;
              _newpasswordErorText = null;
              _confirmpasswordErorText = null;
            });

            showCustomToast(
              context, "Password Changed successfully",
              MediaQuery.of(context).size.height *
                  0.7, // Adjust vertical position here
            );
            await GetSharedPreferences.deleteAccessToken();
            await GetSharedPreferences.getCountrycodes();
            await selectedBranchBox.clear();
            await UserDetailsBox.clear();
            await countryCodeBox.clear();

            Future.delayed(Duration(milliseconds: 1500), () {
              return navigateTosiginCleared(context);
            });
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
              _currentpasswordErorText = state.currentPasswordError;
              _newpasswordErorText = state.newPasswordError;
              _confirmpasswordErorText = state.confirmPasswordError;
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
            child: Column(children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 20),
                  HomeAppBar(
                    onBackTap: () async {
                      Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Text(
                      "Set a new password",
                      style: TextStyles.rubik20black33w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: devicePadding),
                    child: Column(
                      children: [
                        Text(
                          'Create a new password. Ensure it differs from previous ones for security',
                          style: TextStyles.rubik16black77w400,
                        ),
                        const SizedBox(height: 20),
                        PassWordTextfield(
                          focusNode: currentpassFocusnode,
                          errorText: _currentpasswordErorText,
                          hintText: 'Current Password*',
                          textEditingController: _currentpasswordController,
                        ),
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
                      ],
                    ),
                  ),
                  SizedBox(height: elementPaddingVertical),
                  Center(
                    child: ColoredButton(
                      onPressed: _submitForm,
                      text: 'Update Password',
                    ),
                  ),
                ],
              ),
            ]),
          ),
        );
      }),
    );
  }
}
