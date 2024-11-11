import 'dart:io';

import 'package:Yes_Loyalty/core/routes/app_route_config.dart';
import 'package:Yes_Loyalty/core/services/auth_service/login_services.dart';
import 'package:Yes_Loyalty/ui/animations/toast.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:jumping_dot/jumping_dot.dart';
import 'package:Yes_Loyalty/core/constants/common.dart';
import 'package:Yes_Loyalty/core/constants/text_styles.dart';
import 'package:Yes_Loyalty/core/view_model/login/login_bloc.dart';
import 'package:Yes_Loyalty/ui/widgets/buttons.dart';
import 'package:Yes_Loyalty/ui/widgets/password_textfield.dart';
import 'package:Yes_Loyalty/ui/widgets/textfield.dart';
import 'package:http/http.dart' as http;

class SignInScreen extends StatefulWidget {
  static const routeName = '/signIn';
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool showDots = false;
  final _formKey = GlobalKey<FormState>();
  String _ipAddress = 'Fetching...'; // Default text while fetching
  String _platform = 'Unknown'; // To store the platform
  String _location = 'Fetching location...'; // To store the location
  final _passwordController = TextEditingController();
  final _emailcontroller = TextEditingController();
  final FocusNode emailfocusNode = FocusNode();
  final FocusNode passwordfocusNode = FocusNode();
  String? _emailErrorText;
  String? _passwordErrorText;
  bool _formSubmitted = false; // Add this boolean flag
  String? fcmToken;

  @override
  void initState() {
    super.initState();
    _emailcontroller.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
    //getToken();
    // FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
    //   fcmToken = newToken;
    //   print("New FCM Token: $newToken");
    //   // You can save this new token to your backend or database
    // });
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // Connectivity()
      //     .onConnectivityChanged
      //     .listen((List<ConnectivityResult> results) {
      //   // Check if any connection type is available
      //   if (results.isNotEmpty &&
      //       results.any((result) => result != ConnectivityResult.none)) {
      //     _loadData(); // Retry loading data when connection is back
      //     _callApi();
      //   }
      // });

   //   await _loadData(); // Load data and then call API
      // Listen for connectivity changes
    });
  }

  // Future<void> _loadData() async {
  //   await _fetchIpAddress(); // Fetch the IP address
   // _detectPlatform(); // Detect the platform (Android or iOS)
    // await _fetchLocation(); // Fetch the location

    // After all data is fetched, call the API
    // await _callApi();
  // }

  Future<void> _fetchIpAddress() async {
    try {
      final response = await http.get(Uri.parse('https://api.ipify.org'));
      if (response.statusCode == 200) {
        setState(() {
          _ipAddress = response.body; // Set the public IP address
        });
      } else {
        setState(() {
          _ipAddress = 'Failed to get IP address'; // Error handling
        });
      }
    } catch (e) {
      setState(() {
        _ipAddress = 'Failed to get IP address'; // Error handling
      });
    }
  }

  void _detectPlatform() {
    // Detect if the device is Android or iOS
    if (Platform.isAndroid) {
      setState(() {
        _platform = 'Android';
      });
    } else if (Platform.isIOS) {
      setState(() {
        _platform = 'iOS';
      });
    }
  }

  // Future<void> _fetchLocation() async {
  //   try {
  //     bool serviceEnabled;
  //     LocationPermission permission;

  //     // Check if location services are enabled
  //     serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //     if (!serviceEnabled) {
  //       setState(() {
  //         _location = 'Location services are disabled';
  //       });
  //       return;
  //     }

  //     // Request location permission if not already granted
  //     permission = await Geolocator.checkPermission();
  //     if (permission == LocationPermission.denied) {
  //       permission = await Geolocator.requestPermission();
  //       if (permission == LocationPermission.denied) {
  //         setState(() {
  //           _location = 'Location permission denied';
  //         });
  //         return;
  //       }
  //     }

  //     if (permission == LocationPermission.deniedForever) {
  //       setState(() {
  //         _location = 'Location permissions are permanently denied';
  //       });
  //       return;
  //     }

  //     // Get the current position
  //     Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high,
  //     );

  //     // Perform reverse geocoding to get the address from coordinates
  //     List<Placemark> placemarks = await placemarkFromCoordinates(
  //       position.latitude,
  //       position.longitude,
  //     );

  //     // Get the first placemark and set the location name
  //     Placemark place = placemarks[0];
  //     setState(() {
  //       _location = '${place.locality}'; // Example: Kochi, Kerala, India
  //     });
  //   } catch (e) {
  //     setState(() {
  //       _location = 'Failed to get location name: $e';
  //     });
  //   }
  // }

  // Future<void> _callApi() async {
  //   await DeviceRegistrationService.registerNewDevice(
  //     fcmToken: fcmToken ??
  //         'dLkweieTQEySMBf585B3n5:APA91bFkWunYnYCh88yMu_j0oYpA5QqgjxVxXY5v_6IFDFozFodKFiwDVpXeJN0G3kTiFt_g97zc4q2PSsQCG_Djmpfhr7jQdsyTTpNbR7BY9DG7m35Dc1zB6yC-zJXEND6TIjKHad0G',
  //     ipAddress: _ipAddress, // Use the fetched IP address
  //     platform: _platform, // Use the detected platform
  //     location: _location, // Use the dynamic location
  //   );
  // }

  @override
  void dispose() {
    _emailcontroller.removeListener(_onEmailChanged);
    _passwordController.removeListener(_onPasswordChanged);
    super.dispose();
  }

  void _onEmailChanged() {
    if (_formSubmitted) {
      // Only validate if the form has been submitted at least once
      _validateEmail(_emailcontroller.text);
    }
  }

  void _validateEmail(String value) {
    if (value.isEmpty) {
      setState(() {
        _emailErrorText = 'Email is required';
      });
    } else if (!value.contains('@')) {
      setState(() {
        _emailErrorText = 'Invalid format';
      });
    } else {
      // Clear error if value becomes non-empty
      if (_emailErrorText != null) {
        setState(() {
          _emailErrorText = null;
        });
      }
    }
  }

  void _onPasswordChanged() {
    if (_formSubmitted) {
      // Only validate if the form has been submitted at least once
      _validatePassword(_passwordController.text);
    }
  }

  void _validatePassword(String value) {
    setState(() {
      if (value.isEmpty) {
        _passwordErrorText = 'Password is required';
      } else if (value.length < 8) {
        _passwordErrorText = 'Password must be at least 8 characters long';
      } else {
        _passwordErrorText = null;
      }
    });
  }

  void _submitForm() async {
    // bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();

    // if (!isLocationServiceEnabled) {
    //   // Show a SnackBar or dialog to enable location services
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //       content: Text('Location services are disabled. Please enable them.'),
    //       action: SnackBarAction(
    //         label: 'Settings',
    //         onPressed: () {
    //           // Optionally, you can navigate to the location settings
    //           Geolocator.openLocationSettings();
    //         },
    //       ),
    //     ),
    //   );
    //   return; // Exit the function if location services are disabled
    // }

    setState(() {
      _formSubmitted =
          true; // Set form submitted to true when the button is clicked
      // Validate password field
      _validateEmail(_emailcontroller.text);
      _validatePassword(_passwordController.text);
    });

    if (_emailcontroller.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      setState(() {
        showDots = true;
      });
      BlocProvider.of<LoginBloc>(context).add(
        LoginEvent.signInWithEmailAndPassword(
          // email: _emailcontroller.text,
          // password: _passwordController.text,
          // fcm_token: fcmToken,
          email: 'daniel344@gmail.com',
          password: 'Daniel@222333',
          fcm_token:
              'eTG2JJfyQD228OVh24YQWR:APA91bFmCH9ys_PXbbCkDvlMbq-xeoyK_yT_NBLgBfQgqzm09sIS5JNScfJuf_xO4pTJU7QuXpwXhDyy7RvVST0Rn-XMKx26tBeJSlLYSHVVRWO8pMACPZyE0xsASn8BU17Nmb0DlrWz',
        ),
      );
    }
  }

  //   // Get FCM token
  // Future<void> getToken() async {
  //   FirebaseMessaging messaging = FirebaseMessaging.instance;

  //   // Request notification permissions for iOS (not needed for Android)
  //   await messaging.requestPermission();

  //   // Get the token
  //   String? token = await messaging.getToken();
  //   setState(() {
  //     fcmToken = token;
  //   });
  //   print("FCM Token: $token");
  // }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double devicePadding = outerPadding(context);
    double elementPaddingVertical = elemPaddingVertical(context);
    double perc20 = screenHeight * 0.020;
    double perc187 = screenHeight * 0.0187;
    double perc281 = screenHeight * 0.0281;
    double perc375 = screenHeight * 0.0375;

    return GestureDetector(
      onTap: () {
        emailfocusNode.unfocus();
        passwordfocusNode.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              state.maybeMap(
                authsuccess: (value) {
                  setState(() {
                    showDots = false;
                  });
                  return navigateToHomeCleared(context);
                },
                authError: (value) {
                  setState(() {
                    showDots = false;
                  });
                  showCustomToast(
                    context,
                    "Oops something went wrong!",
                    MediaQuery.of(context).size.height * 0.9,
                  );
                },
                validationError: (value) {
                  setState(() {
                    showDots = false;
                  });
                  showCustomToast(
                    context,
                    value.Error == 'User not found.'
                        ? 'User not found.'
                        : value.Error == 'The Account has been Dismissed.'
                            ? 'The Account has been Dismissed.'
                            : 'Enter valid email or password',
                    MediaQuery.of(context).size.height *
                        0.9, // Adjust vertical position here
                  );
                },
                orElse: () {
                  // Handle other states or do nothing
                },
              );
            },
            builder: (context, state) {
              return Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: devicePadding),
                  child: Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // const SizedBox(
                          //   height: 70,
                          // ),

                          FractionallySizedBox(
                            widthFactor: 0.75, // Take full available width
                            child: Image.asset(
                              'assets/yes_loyality_s.png',
                              fit: BoxFit
                                  .contain, // Maintain aspect ratio while fitting the image within the box
                            ),
                          ),

                          SizedBox(height: perc20),
                          Text(
                            'Hello, Welcome back !',
                            style: TextStyles.bold24black24,
                          ),
                          SizedBox(height: perc20),
                          Text(
                            'Sign in to continue',
                            style: TextStyles.semibold16grey77,
                          ),

                          SizedBox(height: perc281),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Textfield(
                                focusNode: emailfocusNode,
                                errorText: _emailErrorText,
                                hintText: 'Enter Email',
                                textEditingController: _emailcontroller,
                              ),
                              SizedBox(height: elementPaddingVertical),
                              PassWordTextfield(
                                focusNode: passwordfocusNode,
                                errorText: _passwordErrorText,
                                hintText: 'Enter Password',
                                textEditingController: _passwordController,
                              ),
                              //SizedBox(height: 5),
                              TextButton(
                                onPressed: () {
                                  navigateToForgotPassword(context);
                                },
                                child: IntrinsicWidth(
                                  // Wrap the child with IntrinsicWidth
                                  child: Align(
                                    child: Text(
                                      'Forgot your password?',
                                      style: TextStyles.medium16black00,
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          ColoredButton(
                            onPressed: _submitForm,
                            text: 'Sign In',
                          ),
                          SizedBox(height: perc187),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account?  ",
                                style: TextStyles.rubikregular16grey77w400,
                              ),
                              InkWell(
                                onTap: () {
                                  navigateToSignUp(context);
                                },
                                child: Text(
                                  "Sign Up",
                                  style: TextStyles.medium16black3B,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Visibility(
                          visible: showDots,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 30),
                            child: Container(
                              width: 120,
                              height: 40,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(137, 212, 210, 210),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                              ),
                              child: JumpingDots(
                                color: const Color.fromARGB(210, 255, 109, 111),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
