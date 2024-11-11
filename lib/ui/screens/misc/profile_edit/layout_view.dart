import 'dart:async';
import 'dart:io';
import 'package:Yes_Loyalty/core/db/hive_db/adapters/country_code_adapter/country_code_adapter.dart';
import 'package:Yes_Loyalty/core/db/hive_db/boxes/country_code_box.dart';
import 'package:Yes_Loyalty/core/db/hive_db/boxes/selected_branch_box.dart';
import 'package:Yes_Loyalty/core/db/hive_db/boxes/user_details_box.dart';
import 'package:Yes_Loyalty/core/routes/app_route_config.dart';
import 'package:Yes_Loyalty/core/view_model/user_details/user_details_bloc.dart';
import 'package:Yes_Loyalty/ui/animations/toast.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:Yes_Loyalty/core/constants/common.dart';
import 'package:Yes_Loyalty/core/constants/const.dart';
import 'package:Yes_Loyalty/core/constants/text_styles.dart';
import 'package:Yes_Loyalty/core/db/hive_db/adapters/user_details_adapter/user_details_adapter.dart';
import 'package:Yes_Loyalty/core/db/shared/shared_prefernce.dart';
import 'package:Yes_Loyalty/core/view_model/logout/logout_bloc.dart';
import 'package:Yes_Loyalty/core/view_model/profile_edit/profile_edit_bloc.dart';
import 'package:Yes_Loyalty/ui/widgets/appbar.dart';
import 'package:Yes_Loyalty/ui/widgets/buttons.dart';
import 'package:Yes_Loyalty/ui/widgets/name_textfield.dart';
import 'package:Yes_Loyalty/ui/widgets/number_textfield.dart';
import 'package:Yes_Loyalty/ui/widgets/textfield.dart';
import 'package:path/path.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({Key? key}) : super(key: key);

  @override
  _ProfileEditState createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  bool _isEditable = false;
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController phonecontroller = TextEditingController();
  final FocusNode namefocusNode = FocusNode();
  final FocusNode emailfocusNode = FocusNode();
  final FocusNode phonefocusNode = FocusNode();
  String? fileName = '';
  String? filePath = '';
  bool myVisibility = false;
  String? selectedDialCode = "+61";
  String? selectedCountryCode = "AU";
  var _emailErrorText;
  var _phoneErrorText;
  var _nameErrorText;

  bool _formSubmitted = false; // Add this boolean flag
  late final ValueNotifier<UserDetailsDB?> _userDetailsNotifier;
  late final ValueNotifier<CountryCodeDB?> _countrucodeNotifier;
  dynamic img_url;

  @override
  void initState() {
    super.initState();
    _loadCountryCode();
    _userDetailsNotifier = ValueNotifier<UserDetailsDB?>(null);
    _countrucodeNotifier = ValueNotifier<CountryCodeDB?>(null);
    phonecontroller.addListener(_onPhoneChanged);
    _loadDataFromHive(UserDetailsBox);
    _loadCountryDataFromHive(countryCodeBox);
  }

  _loadDataFromHive(UserDetailsBox) async {
    final customerId = await GetSharedPreferences.getCustomerId();
    UserDetailsDB userDetails = UserDetailsBox.get(0);
    if (userDetails != null) {
      // Update the text controllers with data from userDetails
      namecontroller.text = userDetails.name;
      emailcontroller.text = userDetails.email;
      phonecontroller.text = userDetails.phone;
      img_url = userDetails.image;
    }
    setState(() {
      _userDetailsNotifier.value = userDetails;
    });
  }

  _loadCountryDataFromHive(countryCodeBox) async {
    CountryCodeDB codeDB = countryCodeBox.get(0);
    if (codeDB != null) {
      setState(() {
        selectedDialCode = codeDB.dial_code;
        selectedCountryCode = codeDB.country_code;
        _countrucodeNotifier.value = codeDB;
      });
    }
  }

  Future<void> _loadCountryCode() async {
    String? countryCode = await GetSharedPreferences.getCountrycodes();

    setState(() {
      selectedCountryCode = countryCode ?? 'AU';
    });
  }

  @override
  void dispose() {
    phonecontroller.removeListener(_onPhoneChanged);
    super.dispose();
  }

  void _onPhoneChanged() {
    if (_formSubmitted) {
      _validatePhone(phonecontroller.text);
    }
  }

  void _openFilePicker(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      String? selectedFilePath = result.files.single.path;
      String? selectedFileName = basename(selectedFilePath!);

      if (!_isValidImageFile(selectedFileName)) {
        showCustomToast(
            context, 'Please select a valid image file (PNG or JPEG)', 200);
        return;
      }

      setState(() {
        filePath = selectedFilePath;
        fileName = selectedFileName;
      });

      print("Selected file: $fileName");
    }
  }

  bool _isValidImageFile(String fileName) {
    String extension = fileName.split('.').last.toLowerCase();
    return extension == 'png' || extension == 'jpeg' || extension == 'jpg';
  }

  void _validatePhone(String value) {
    setState(() {
      if (value.isEmpty) {
        _phoneErrorText = 'Phone no is required';
      } else {
        _phoneErrorText = null;
      }
    });
  }

  Future<void> _saveCountryCodeToHive(
      String dialCode, String countryCode) async {
    final box = await Hive.openBox<CountryCodeDB>('countryCodeBox');
    final countryCodeDB =
        CountryCodeDB(dial_code: dialCode, country_code: countryCode);
    await box.put(0, countryCodeDB);
    print("Saved to Hive: $dialCode, $countryCode");
  }

  void _submitForm(BuildContext context) async {
    Future.delayed(Duration(seconds: 1), () {
      context
          .read<UserDetailsBloc>()
          .add(const UserDetailsEvent.fetchUserDetails());
    });

    setState(() {
      _formSubmitted = true;
      _validatePhone(phonecontroller.text);
    });

    // Async operations before setState
    final customerId = await GetSharedPreferences.getCustomerId();
    File? file;
    if (filePath != null &&
        (filePath!.toLowerCase().endsWith('.jpg') ||
            filePath!.toLowerCase().endsWith('.jpeg') ||
            filePath!.toLowerCase().endsWith('.png'))) {
      file = File(filePath!);
      context.read<ProfileEditBloc>().add(
            ProfileEditEvent.profileEdit(
              image: file,
              name: namecontroller.text,
              email: emailcontroller.text,
              phone: '+${selectedDialCode}${phonecontroller.text}',
            ),
          );
    } else {
      context.read<ProfileEditBloc>().add(
            ProfileEditEvent.profileEdit(
              name: namecontroller.text,
              email: emailcontroller.text,
              phone: '+${selectedDialCode}${phonecontroller.text}',
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    context
        .read<UserDetailsBloc>()
        .add(const UserDetailsEvent.fetchUserDetails());
    Future<bool> _onBackPressed() async {
      if (!_isEditable) {
        Navigator.of(context).pop();
      }
      setState(() {
        _isEditable = false;
      });
      // Navigate to SignInScreen if isActive is true
      //  Navigator.of(context).pop();
      return false; // Prevent leaving the screen
    }

    double screenheight = screenHeight(context);
    double height23 = screenheight * 23 / FigmaConstants.figmaDeviceHeight;
    double height8 = screenheight * 8 / FigmaConstants.figmaDeviceHeight;
    double height22 = screenheight * 22 / FigmaConstants.figmaDeviceHeight;
    double height86 = screenheight * 86 / FigmaConstants.figmaDeviceHeight;
    EdgeInsets outerpadding = OuterPaddingConstant(context);

    return MultiBlocListener(
      listeners: [
        BlocListener<UserDetailsBloc, UserDetailsState>(
          listener: (context, state) async {
            if (state.userDetails.data != null) {
              UserDetailsBox.put(
                0,
                UserDetailsDB(
                  customer_id:
                      state.userDetails.data?.user?.customerId.toString(),
                  email: state.userDetails.data?.user?.email.toString(),
                  image: state.userDetails.data?.user?.imgUrl.toString(),
                  name: state.userDetails.data?.user!.name.toString() as String,
                  phone: state.userDetails.data?.user?.phoneNumber.toString(),
                  wallet_balance:
                      state.userDetails.data?.user?.walletBalance.toString(),
                  wallet_total:
                      state.userDetails.data?.user?.walletTotal.toString(),
                  wallet_used:
                      state.userDetails.data?.user?.walletUsed.toString(),
                  dial_code:
                      state.userDetails.data?.user?.countryCode.toString(),
                ),
              );
            }
            if (state.userDetails.data != null) {
              // Update the Hive database with new user details
              await countryCodeBox.put(
                0,
                CountryCodeDB(
                  country_code: state.userDetails.data?.user!.countryAlphaCode
                      .toString() as String,
                  dial_code: state.userDetails.data?.user?.countryCode
                      .toString() as String,
                ),
              );
            }
          },
        ),
        BlocListener<ProfileEditBloc, ProfileEditState>(
          listener: (context, state) {
            state.maybeMap(
              loading: (_) {},
              success: (successState) {
                setState(() {
                  _isEditable = false;
                });
                context
                    .read<UserDetailsBloc>()
                    .add(UserDetailsEvent.fetchUserDetails());

                showCustomToast(
                  context, "Profile updated successfully!",
                  MediaQuery.of(context).size.height *
                      0.7, // Adjust vertical position here
                );
              },
              failure: (failureState) {
                // Show failure message
                showCustomToast(context, 'Sorry we are currently unavailable!',
                    MediaQuery.of(context).size.height * 0.7);
              },
              validationError: (validationErrorState) {
                setState(() {
                  _nameErrorText = validationErrorState.nameError;
                  _emailErrorText = validationErrorState.emailError;
                  _phoneErrorText = validationErrorState.phoneError;
                });
                String errorMessage;
                if (_emailErrorText != null && _emailErrorText.isNotEmpty) {
                  errorMessage = _emailErrorText;
                } else if (_nameErrorText != null &&
                    _nameErrorText.isNotEmpty) {
                  errorMessage = _nameErrorText;
                } else if (_phoneErrorText != null &&
                    _phoneErrorText.isNotEmpty) {
                  errorMessage = _phoneErrorText;
                } else {
                  errorMessage = "OOPS SOMETHING WENT WRONG";
                }

                showCustomToast(
                  context,
                  errorMessage,
                  MediaQuery.of(context).size.height *
                      0.7, // Adjust vertical position here
                );
              },
              orElse: () {},
            );
          },
        ),
        BlocListener<LogoutBloc, LogoutState>(
          listener: (context, state) async {
            if (state.isError) {
              showCustomToast(context, 'Failed to logout',
                  MediaQuery.of(context).size.height * 0.7);
            } else if (!state.isLoading && state.statusCode != 0) {
              await GetSharedPreferences.deleteAccessToken();
              await selectedBranchBox.clear();
              await UserDetailsBox.clear();
              await countryCodeBox.clear();
              if (context.mounted) {
                return navigateTosiginCleared(context);
              }
            }
          },
        ),
      ],
      child: WillPopScope(
        onWillPop: _onBackPressed,
        child: GestureDetector(
          onTap: () {
            namefocusNode.unfocus();
            emailfocusNode.unfocus();
            phonefocusNode.unfocus();
          },
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        SizedBox(height: height23),
                        HomeAppBar(
                          isthereback: true,
                          isthereQr: false,
                          onBackTap: _onBackPressed,
                        ),
                        SizedBox(height: height23),
                        Center(
                          child: Padding(
                            padding: outerpadding,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: !_isEditable
                                      ? null
                                      : () {
                                          _openFilePicker(context);
                                        },
                                  customBorder: const CircleBorder(),
                                  child: SizedBox(
                                    height: 81,
                                    width: 81,
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      fit: StackFit.expand,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Colors
                                                  .black, // Customize border color
                                              width: 1.0, // Adjust border width
                                            ),
                                          ),
                                          child: CircleAvatar(
                                            radius: 40,
                                            backgroundColor: Color.fromARGB(
                                                255, 235, 234, 234),
                                            child: filePath != null &&
                                                    filePath!.isNotEmpty
                                                ? ClipOval(
                                                    child: Image.file(
                                                      File(filePath!),
                                                      fit: BoxFit.cover,

                                                      width:
                                                          77, // Adjusted to fit within the padding
                                                      height:
                                                          77, // Adjusted to fit within the padding
                                                    ),
                                                  )
                                                : (img_url != null &&
                                                        img_url.isNotEmpty
                                                    ? ClipOval(
                                                        child: Image.network(
                                                          img_url,
                                                          fit: BoxFit.cover,
                                                          width:
                                                              77, // Adjusted to fit within the padding
                                                          height:
                                                              77, // Adjusted to fit within the padding
                                                          loadingBuilder: (context,
                                                              child,
                                                              loadingProgress) {
                                                            if (loadingProgress ==
                                                                null) {
                                                              return child;
                                                            }
                                                            return Center(
                                                              child:
                                                                  CircularProgressIndicator(
                                                                value: loadingProgress
                                                                            .expectedTotalBytes !=
                                                                        null
                                                                    ? loadingProgress
                                                                            .cumulativeBytesLoaded /
                                                                        loadingProgress
                                                                            .expectedTotalBytes!
                                                                    : null,
                                                              ),
                                                            );
                                                          },
                                                          errorBuilder: (context,
                                                                  error,
                                                                  stackTrace) =>
                                                              const Icon(
                                                            Icons.person,
                                                            color: Colors.grey,
                                                            size: 30,
                                                          ),
                                                        ),
                                                      )
                                                    : ClipOval(
                                                        child: Container(
                                                          color: const Color
                                                              .fromARGB(255,
                                                              235, 234, 234),
                                                          child: const Icon(
                                                            Icons.person,
                                                            size: 59,
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                      )),
                                          ),
                                        ),
                                        if (_isEditable)
                                          Positioned(
                                              right: -6,
                                              bottom: 0,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: const Color.fromARGB(
                                                        255, 248, 99, 88),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50)),
                                                height: 30,
                                                width: 30,
                                                child: const Icon(
                                                  size: 15,
                                                  Icons.camera_alt_rounded,
                                                  color: Colors.white,
                                                ),
                                              ))
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: height8),
                                Text(
                                  namecontroller.text,
                                  style: TextStyles.rubik16black24,
                                ),
                                Column(
                                  children: _isEditable
                                      ? [
                                          SizedBox(height: height22),
                                          NameTextfield(
                                            focusNode: namefocusNode,
                                            hintText: '',
                                            textstyle: TextStyle(),
                                            textEditingController:
                                                namecontroller,
                                            errorText: _nameErrorText,
                                          ),
                                          SizedBox(height: height22),
                                          Textfield(
                                            focusNode: emailfocusNode,
                                            textEditingController:
                                                emailcontroller,
                                            errorText: _emailErrorText,
                                          ),
                                          SizedBox(height: height22),
                                          NumberTextFieldWithCountry(
                                            focusNode: phonefocusNode,
                                            selectedCountryCode:
                                                selectedCountryCode,
                                            selectedDialCode:
                                                selectedCountryCode,
                                            phoneController: phonecontroller,
                                            onCountryChanged: (String
                                                    newDialCode,
                                                String newCountryCode) async {
                                              setState(() {
                                                selectedDialCode = newDialCode;
                                                selectedCountryCode =
                                                    newCountryCode;
                                              });
                                            },
                                            errorText: _phoneErrorText,
                                          ),
                                          SizedBox(height: height86),
                                        ]
                                      : [
                                          SizedBox(height: height22),
                                          NameTextfield(
                                            focusNode: namefocusNode,
                                            hintText: '',
                                            textstyle:
                                                TextStyles.rubikregular16hint,
                                            enabled: false,
                                            textEditingController:
                                                namecontroller,
                                            errorText: _nameErrorText,
                                          ),
                                          SizedBox(height: height22),
                                          Textfield(
                                            focusNode: emailfocusNode,
                                            textstyle:
                                                TextStyles.rubikregular16hint,
                                            textEditingController:
                                                emailcontroller,
                                            errorText: _emailErrorText,
                                            enabled: false,
                                          ),
                                          SizedBox(height: height22),
                                          NumberTextFieldWithCountry(
                                            focusNode: phonefocusNode,
                                            enabled: false,
                                            selectedCountryCode:
                                                selectedCountryCode,
                                            selectedDialCode:
                                                selectedCountryCode,
                                            phoneController: phonecontroller,
                                            onCountryChanged: (String
                                                    newDialCode,
                                                String newCountryCode) async {
                                              setState(() {
                                                selectedDialCode = newDialCode;
                                                selectedCountryCode =
                                                    newCountryCode;
                                              });
                                            },
                                            errorText: _phoneErrorText,
                                          ),
                                          SizedBox(height: height86),
                                        ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Padding(
                        padding: outerpadding,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            _isEditable
                                ? SolidColorButton(
                                    text: 'Save',
                                    onPressed: () async {
                                      _submitForm(context);
                                    },
                                    backgroundColor: const Color(0xFF2DC962),
                                    borderColor: const Color(0xFF2DC962),
                                  )
                                : SolidColorButton(
                                    text: 'Edit Profile',
                                    onPressed: () {
                                      // Hide log out button when update profile button is clicked
                                      setState(() {
                                        _isEditable = !_isEditable;
                                      });
                                      // Put your update profile logic here
                                    },
                                    backgroundColor: const Color(0xFF1B92FF),
                                    borderColor: const Color(0xFF1B92FF),
                                  ),
                            const SizedBox(height: 12),
                            const SizedBox(height: 34)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
