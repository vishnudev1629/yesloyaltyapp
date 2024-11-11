// ignore_for_file: use_build_context_synchronously

import 'package:Yes_Loyalty/core/constants/common.dart';
import 'package:Yes_Loyalty/core/constants/const.dart';
import 'package:Yes_Loyalty/core/db/hive_db/adapters/notification_adater/notification_adapter.dart';
import 'package:Yes_Loyalty/core/db/hive_db/adapters/user_details_adapter/user_details_adapter.dart';
import 'package:Yes_Loyalty/core/db/hive_db/boxes/notification_box.dart';
import 'package:Yes_Loyalty/core/routes/app_route_config.dart';
import 'package:Yes_Loyalty/core/view_model/qr_scanning/qr_scanning_bloc.dart';
import 'package:Yes_Loyalty/core/view_model/user_details/user_details_bloc.dart';
import 'package:Yes_Loyalty/ui/animations/toast.dart';
import 'package:Yes_Loyalty/ui/widgets/qr_result_popup.dart';
import 'package:Yes_Loyalty/ui/widgets/qr_result_validationPopup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeAppBar extends StatefulWidget {
  final bool isthereQr;
  final bool isthereback;
  final VoidCallback? onBackTap; // Define the callback function
  final bool isVisible;
  const HomeAppBar({
    super.key,
    this.isthereQr = true,
    this.isthereback = true,
    this.onBackTap,
    this.isVisible = true,
  });

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  String qrResult = 'Scanned Data will appear here';
  String userId = 'e';
  String offerStatus = '';

  @override
  void initState() {
    super.initState();
  }

  Future<void> loadUserDetails() async {
    final userDetailsBox = await Hive.openBox<UserDetailsDB>('UserDetailsBox');
    final userDetails = userDetailsBox.get(0);

    if (userDetails != null) {
      setState(() {
        userId = userDetails.customer_id;
      });
    } else {}
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await loadUserDetails();
    });
    final screenwidth = screenWidth(context);
    final paddingw10 = screenwidth * 10 / FigmaConstants.figmaDeviceWidth;
    final paddingw20 = screenwidth * 20 / FigmaConstants.figmaDeviceWidth;

    return BlocConsumer<QrScanningBloc, QrScanningState>(
      listener: (context, state) {
        state.maybeMap(
          loading: (_) {},
          success: (successState) {
            WidgetsBinding.instance.addPostFrameCallback((_) async {
              context
                  .read<UserDetailsBloc>()
                  .add(const UserDetailsEvent.fetchUserDetails());
            });
            if (successState.response.data?.loyaltyStatus ==
                "loyalty_credited") {
              NotificationBox.put(
                0,
                NotificationDB(
                    isOfferAvailbleonNextTr: false,
                    points_required: successState.response.data!
                        .offerEligibility!.pointsRequired as int),
              );
              setState(() {
                offerStatus =
                    "${successState.response.data!.transaction?.transactionValue} Points added to your account";
              });
            }
            if (successState.response.data?.loyaltyStatus == "offer_eligible") {
              NotificationBox.put(
                0,
                NotificationDB(
                    isOfferAvailbleonNextTr: true,
                    points_required: successState.response.data!
                        .offerEligibility!.pointsRequired as int),
              );
              setState(() {
                offerStatus = "${successState.response.message}";
              });
            }
            if (successState.response.data?.loyaltyStatus == "offer_applied") {
              NotificationBox.put(
                0,
                NotificationDB(
                    isOfferAvailbleonNextTr: false,
                    points_required: successState.response.data!
                        .offerEligibility!.pointsRequired as int),
              );
              setState(() {
                offerStatus =
                    "Congradulations! you are eligible for availing the offer";
              });
            }

            return showDialog(
              context: context,
              builder: (BuildContext context) {
                return PopScope(
                  // Allow dismissing the popup on initial back press
                  canPop: true,
                  onPopInvoked: (didPop) {
                    // Check if it's the first back press
                    final isFirstPop = !Navigator.of(context).canPop();
                    if (didPop && isFirstPop) {
                      // Close the dialog without navigation
                      Navigator.of(context)
                          .pop(); // No need for (false) argument
                    }
                  },
                  child: QrResultPopup(
                    isOfferApplied: successState.response.data?.loyaltyStatus ==
                            "offer_applied"
                        ? true
                        : false,
                    storeName: '${successState.response.data!.store?.name}',
                    isCredited:
                        '${successState.response.data!.transaction?.transactionType}' ==
                                "credit"
                            ? true
                            : false,
                    coins:
                        '${successState.response.data!.transaction?.transactionValue}',
                    offerStatus: offerStatus,
                    transactionID:
                        '${successState.response.data!.transaction?.id}',
                    cashierName:
                        '${successState.response.data!.cashier?.name.toString()}',
                    transactionTime:
                        '${successState.response.data!.transaction?.transactionTime.toString()}',
                  ), // Your dialog content
                );
              },
            );
          },
          failure: (failureState) {
            debugPrint(failureState.error.toString());
          },
          validationError: (state) {
            String _nameErrorText = '';
            setState(() {
              if (state.qr_id != null && state.qr_id.isNotEmpty) {
                _nameErrorText = state.qr_id.toString();
              } else if (state.message != null && state.message.isNotEmpty) {
                _nameErrorText = state.message;
              } else {
                _nameErrorText = 'An unknown error occurred';
              }
            });

            return showDialog(
              context: context,
              builder: (BuildContext context) {
                return PopScope(
                  canPop: true,
                  onPopInvoked: (didPop) {
                    final isFirstPop = !Navigator.of(context).canPop();
                    if (didPop && isFirstPop) {
                      Navigator.of(context).pop();
                    }
                  },
                  child: QrResultValidationPopup(
                    validationResponse: _nameErrorText,
                  ),
                );
              },
            );
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        return Visibility(
          visible: widget.isVisible,
          child: Padding(
            padding: EdgeInsets.only(
              left: paddingw10,
              right: paddingw10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                widget.isthereback
                    ? Visibility(
                        visible: widget.isthereback,
                        child: InkWell(
                          radius: 233,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(23)),
                          onTap: widget.onBackTap,
                          child: Material(
                            color: Colors
                                .transparent, // Ensure the Material is invisible
                            child: Container(
                              padding: EdgeInsets.only(
                                left: paddingw20,
                                right: paddingw20,
                                top: 10,
                                bottom: 10,
                              ),
                              child: SvgPicture.asset("assets/back_arrow.svg"),
                            ),
                          ),
                        ),
                      )
                    : InkWell(
                        radius: 233,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(23)),
                        child: Material(
                          color: Colors
                              .transparent, // Ensure the Material is invisible
                          child: Container(
                            padding: EdgeInsets.only(
                              left: paddingw20,
                              right: paddingw20,
                              top: 10,
                              bottom: 10,
                            ),
                            child: const SizedBox(width: 9),
                          ),
                        ),
                      ),
                const Spacer(),
                Container(
                  constraints: const BoxConstraints(
                    maxHeight: 70, // Set maximum height
                    maxWidth: 160, // Set maximum width
                  ),
                  child: Image.asset(
                    'assets/yes_loyality_s.png',
                    fit: BoxFit
                        .contain, // Maintain aspect ratio while fitting the image within the box
                  ),
                ),
                const Spacer(),
                InkWell(
                  radius: 233,
                  borderRadius: BorderRadius.all(Radius.circular(23)),
                  onTap: () async {
                    await loadUserDetails();
                    await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AiBarcodeScanner(
                          onDispose: () {
                            /// This is called when the barcode scanner is disposed.
                            /// You can write your own logic here.
                            debugPrint("Barcode scanner disposed!");
                          },
                          hideGalleryButton: true,
                          controller: MobileScannerController(
                            detectionSpeed: DetectionSpeed.noDuplicates,
                          ),
                          onDetect: (BarcodeCapture capture) {
                            final String? scannedValue =
                                capture.barcodes.first.rawValue;
                            debugPrint("Barcode scanned: $scannedValue");

                            if (scannedValue == null || scannedValue.isEmpty) {
                              debugPrint("Invalid QR code scanned");
                              // Handle invalid QR code scenario (e.g., show a message to the user)
                              return;
                            }

                            // Assuming valid QR code, continue processing
                            context.read<QrScanningBloc>().add(
                                  QrScanningEvent.postscannedResult(
                                    QrId: scannedValue,
                                  ),
                                );
                            navigateBackToHome(context);
                          },
                          validator: (value) {
                            if (value.barcodes.isEmpty) {
                              return false;
                            }
                            if (!(value.barcodes.first.rawValue
                                    ?.contains('flutter.dev') ??
                                false)) {
                              return false;
                            }
                            return true;
                          },
                        ),
                      ),
                    );
                  },
                  child: Material(
                    color:
                        Colors.transparent, // Ensure the Material is invisible
                    child: Container(
                      padding: EdgeInsets.only(
                        left: paddingw20,
                        right: paddingw20,
                        top: 10,
                        bottom: 10,
                      ),
                      child: Visibility(
                        visible: widget.isthereQr,
                        child: SvgPicture.asset(
                          'assets/qr_code.svg',
                          fit: BoxFit
                              .contain, // Ensure the SVG fits within the 10x10 area
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
    );
  }
}
