
import 'package:Yes_Loyalty/core/constants/const.dart';
import 'package:Yes_Loyalty/core/constants/text_styles.dart';
import 'package:Yes_Loyalty/core/db/hive_db/adapters/user_details_adapter/user_details_adapter.dart';
import 'package:Yes_Loyalty/core/db/hive_db/boxes/user_details_box.dart';
import 'package:Yes_Loyalty/core/routes/app_route_config.dart';
import 'package:Yes_Loyalty/core/view_model/forgot_password/forgot_password_bloc.dart';
import 'package:Yes_Loyalty/ui/animations/toast.dart';
import 'package:Yes_Loyalty/ui/widgets/appbar.dart';
import 'package:Yes_Loyalty/ui/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Yes_Loyalty/ui/widgets/buttons.dart';


class ForgotPassWord extends StatefulWidget {
  const ForgotPassWord({super.key});

  @override
  State<ForgotPassWord> createState() => _ForgotPassWordState();
}

class _ForgotPassWordState extends State<ForgotPassWord> {
  bool showDots = false;
  final _emailController = TextEditingController();

  var _emailErrorText;

  final FocusNode currentpassFocusnode = FocusNode();
  final FocusNode newpassFocusnode = FocusNode();
  final FocusNode confirmpassFocusnode = FocusNode();
  bool formSubmitted = false; // Add this boolean flag
  String? selectedDialCode = "";
  bool _isRequestPending = false; 

  @override
  void initState() {
    _emailController.addListener(_validateEmail);
    super.initState();
  }

  @override
  void dispose() {
    _emailController.removeListener(_validateEmail);
    super.dispose();
  }

  void _validateEmail() {
    final email = _emailController.text;
    setState(() {
      if (email.isEmpty) {
        _emailErrorText = 'The email field is required';
      } else {
        _emailErrorText = null;
      }
    });
  }

  void _submitForm() {
      if (_isRequestPending) {
      return; 
    }

    setState(() {
      _validateEmail();
        _isRequestPending = true;
      formSubmitted =
          true; // Set form submitted to true when the button is clicked
      // Validate password field

      BlocProvider.of<ForgotPasswordBloc>(context).add(
          ForgotPasswordEvent.forgotPassword(email: _emailController.text));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (message) async {
            await UserDetailsBox.put(
              0,
              UserDetailsDB(
                email: _emailController.text,
              ),
            );

            setState(() {
                _isRequestPending = false;
              _emailErrorText = null;
            });
            showCustomToast(context, 'OTP has been sent your email',
                MediaQuery.of(context).size.height * 0.7);
            navigateToOtpVerify(
              context,
            );
          },
          failure: (error) {
             setState(() {
              _isRequestPending = false;
            });
            showCustomToast(context, 'Oops something went wrong',
                MediaQuery.of(context).size.height * 0.7);
          },
          validationError: (message) {
            setState(() {
                 _isRequestPending = false;
              _emailErrorText = '${message.toString()}';
            });
          },
          orElse: () {
             setState(() {
              _isRequestPending = false;
            });
          },
        );
      },
      child: GestureDetector(
        onTap: () {
          confirmpassFocusnode.unfocus();
          newpassFocusnode.unfocus();
          currentpassFocusnode.unfocus();
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  padding: OuterPaddingConstant(context),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Forgot password",
                        style: TextStyles.rubik20black33w600,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Please enter your email to reset the password',
                        style: TextStyles.rubik16black77w400,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Your Email",
                        style: TextStyles.rubik16black33w600,
                      ),
                      const SizedBox(height: 20),
                      Textfield(
                        focusNode: currentpassFocusnode,
                        errorText: _emailErrorText,
                        hintText: 'Enter Email',
                        textEditingController: _emailController,
                      ),
                      const SizedBox(height: 20),
                      ColoredButton(
                        onPressed: _submitForm,
                        text: 'Reset Password',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
