import 'dart:async';

import 'package:Yes_Loyalty/core/constants/common.dart';
import 'package:Yes_Loyalty/core/constants/text_styles.dart';
import 'package:Yes_Loyalty/core/view_model/get_support/get_support_bloc.dart';
import 'package:Yes_Loyalty/ui/widgets/appbar.dart';
import 'package:Yes_Loyalty/ui/widgets/buttons.dart';
import 'package:Yes_Loyalty/ui/widgets/message_textfield.dart';
import 'package:Yes_Loyalty/ui/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetSupportScreen extends StatefulWidget {
  const GetSupportScreen({super.key});

  @override
  State<GetSupportScreen> createState() => _GetSupportScreenState();
}

class _GetSupportScreenState extends State<GetSupportScreen> {
  String? _nameErrorText;
  String? _emailErrorText;
  String? _subjectErrorText;
  String? _messageErrorText;
  bool _isEventInProgress = false;
  bool _isLoading = false;
  bool _isEventCalled = false;
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController subjectcontroller = TextEditingController();
  TextEditingController messagetcontroller = TextEditingController();
  final FocusNode namefocusNode = FocusNode();
  final FocusNode emailfocusNode = FocusNode();
  final FocusNode subjectfocusNode = FocusNode();
  final FocusNode messagefocusNode = FocusNode();

  @override
  void initState() {
    _isEventCalled ? emailcontroller.addListener(_validateEmail) : null;
    super.initState();
  }

  @override
  void dispose() {
    namecontroller.dispose();
    emailcontroller.dispose();
    subjectcontroller.dispose();
    messagetcontroller.dispose();
    super.dispose();
  }

  void _validateInputs() {
    setState(() {
      _nameErrorText = namecontroller.text.isEmpty ? 'Name is required' : null;
      _emailErrorText =
          emailcontroller.text.isEmpty ? 'Email is required' : null;
      _subjectErrorText =
          subjectcontroller.text.isEmpty ? 'Subject is required' : null;
      _messageErrorText =
          messagetcontroller.text.isEmpty ? 'Message is required' : null;
    });
  }

  void _validatename() {
    setState(() {
      if (namecontroller.text.isEmpty) {
        _nameErrorText = 'Name is required';
      } else {
        _nameErrorText = null;
      }
    });
  }

  void _validateEmail() {
    setState(() {
      if (emailcontroller.text.isEmpty) {
        _emailErrorText = 'Email is required';
      } else {
        _emailErrorText = null;
      }
    });
  }

  void _validateSubject() {
    setState(() {
      if (subjectcontroller.text.isEmpty) {
        _subjectErrorText = 'Subject is required';
      } else {
        _subjectErrorText = null;
      }
    });
  }

  void _validateMessage() {
    setState(() {
      if (messagetcontroller.text.isEmpty) {
        _messageErrorText = 'Message is required';
      } else {
        _messageErrorText = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    double devicePadding = outerPadding(context);

    double elementPaddingVertical = elemPaddingVertical(context);
    double perc20 = screenHeight * 0.020; // 2.00% of the screen height
    double perc187 = screenHeight * 0.0187; // 1.87% of the screen height

    return BlocListener<GetSupportBloc, GetSupportState>(
      listener: (context, state) {
        state.maybeWhen(success: (message) {
          setState(() {
            namecontroller.clear();
            emailcontroller.clear();
            subjectcontroller.clear();
            messagetcontroller.clear();
            _nameErrorText = null;
            _emailErrorText = null;
            _subjectErrorText = null;
            _messageErrorText = null;
            namecontroller.removeListener(_validatename);
            emailcontroller.removeListener(_validateEmail);
            subjectcontroller.removeListener(_validateSubject);
            messagetcontroller.removeListener(_validateMessage);
            _isEventInProgress = false;
            _isLoading = false;
          });
          Future.delayed(Duration(seconds: 2), () {
            Navigator.of(context).pop();
          });
          return GetSupportPopup(context, message: message.message.toString());
        }, failure: (error) {
          print("Failure: $error");
          setState(() {
            _isEventInProgress = false;
            _isLoading = false;
          });
        }, validationError: (message) {
          setState(() {
            _emailErrorText = message;
            _isEventInProgress = false;
            _isLoading = false;
          });
          print("Validation Error: $message");
        }, orElse: () {
          setState(() {
            _isEventInProgress = false;
            _isLoading = false;
          });
        }, loading: () {
          setState(() {
            print('loading');
            _isLoading = true;
          });
        }, initial: () {
          setState(() {
            _isLoading = false;
          });
        });
      },
      child: GestureDetector(
        onTap: () {
          namefocusNode.unfocus();
          emailfocusNode.unfocus();
          subjectfocusNode.unfocus();
          messagefocusNode.unfocus();
        },
        child: Scaffold(
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
                ),
                if (_isLoading)
                  LinearProgressIndicator(
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
                    backgroundColor: Colors.red.withOpacity(0.3),
                  ),
                const SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: devicePadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Get support",
                        style: TextStyles.rubik20black33w600,
                      ),
                      const SizedBox(height: 20),
                      Textfield(
                        focusNode: namefocusNode,
                        errorText: _nameErrorText,
                        hintText: 'Name*',
                        textEditingController: namecontroller,
                        isSpecialCharAllowed: false,
                      ),
                      SizedBox(height: elementPaddingVertical),
                      Textfield(
                        focusNode: emailfocusNode,
                        errorText: _emailErrorText,
                        hintText: 'Email*',
                        textEditingController: emailcontroller,
                      ),
                      SizedBox(height: elementPaddingVertical),
                      Textfield(
                        focusNode: subjectfocusNode,
                        errorText: _subjectErrorText,
                        hintText: 'Subject*',
                        textEditingController: subjectcontroller,
                        isSpecialCharAllowed: false,
                      ),
                      SizedBox(height: elementPaddingVertical),
                      MessageTextfield(
                        focusNode: messagefocusNode,
                        hintText: 'Message*',
                        textEditingController: messagetcontroller,
                        errorText: _messageErrorText,
                        isSpecialCharAllowed: false,
                      ),
                      const SizedBox(height: 20),
                      ColoredButton(
                        onPressed: _isEventInProgress
                            ? null
                            : () {
                                if (emailcontroller.text.isEmpty ||
                                    namecontroller.text.isEmpty ||
                                    subjectcontroller.text.isEmpty ||
                                    messagetcontroller.text.isEmpty) {
                                  _validateInputs();
                                  namecontroller.addListener(_validatename);
                                  emailcontroller.addListener(_validateEmail);
                                  subjectcontroller
                                      .addListener(_validateSubject);
                                  messagetcontroller
                                      .addListener(_validateMessage);
                                  print("empty");
                                  return;
                                }
                                print("not empty");
                                setState(() {
                                  _isEventCalled = true;
                                  _isEventInProgress = true;
                                });
                                namefocusNode.unfocus();
                                emailfocusNode.unfocus();
                                subjectfocusNode.unfocus();
                                messagefocusNode.unfocus();

                                context.read<GetSupportBloc>().add(
                                    GetSupportEvent.getSupport(
                                        name: namecontroller.text,
                                        email: emailcontroller.text,
                                        subject: subjectcontroller.text,
                                        message: messagetcontroller.text));
                              },
                        text: 'Contact Us',
                      ),
                    ],
                  ),
                ),
                SizedBox(height: perc187),
                SizedBox(height: perc20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<bool> GetSupportPopup(context, {required String message}) async {
  return await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$message We will get back to you soon."),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                width: 100,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFFF6D70),
                      Color(0xFFEE1F23),
                    ],
                  ),
                ),
                child: Center(
                    child: Text(
                  "Close",
                  style: TextStyles.rubikmedium16whiteFF,
                )),
              ),
            ),
          ],
        ),
      );
    },
  );
}
