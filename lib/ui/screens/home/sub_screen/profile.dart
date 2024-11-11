import 'package:Yes_Loyalty/core/db/hive_db/adapters/country_code_adapter/country_code_adapter.dart';
import 'package:Yes_Loyalty/core/db/hive_db/adapters/notification_adater/notification_adapter.dart';
import 'package:Yes_Loyalty/core/db/hive_db/adapters/user_details_adapter/user_details_adapter.dart';
import 'package:Yes_Loyalty/core/db/hive_db/boxes/country_code_box.dart';
import 'package:Yes_Loyalty/core/db/hive_db/boxes/user_details_box.dart';
import 'package:Yes_Loyalty/core/routes/app_route_config.dart';

import 'package:Yes_Loyalty/ui/animations/point_details_shimmer.dart';
import 'package:Yes_Loyalty/ui/animations/profile_shimmer.dart';
import 'package:Yes_Loyalty/ui/animations/toast.dart';
import 'package:Yes_Loyalty/ui/screens/home/widgets/notification.dart';
import 'package:Yes_Loyalty/ui/screens/misc/profile_edit/layout_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Yes_Loyalty/core/constants/common.dart';
import 'package:Yes_Loyalty/core/constants/const.dart';
import 'package:Yes_Loyalty/core/constants/text_styles.dart';
import 'package:Yes_Loyalty/core/db/shared/shared_prefernce.dart';
import 'package:Yes_Loyalty/core/view_model/user_details/user_details_bloc.dart';
import 'package:Yes_Loyalty/ui/screens/home/widgets/available_balance.dart';
import 'package:Yes_Loyalty/ui/screens/home/widgets/expense_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    double screenheight = screenHeight(context);
    double height23 = screenheight * 23 / FigmaConstants.figmaDeviceHeight;
    EdgeInsets outerpadding = OuterPaddingConstant(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          const ProfileSection(),
          SizedBox(height: height23),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ValueListenableBuilder<Box<NotificationDB>>(
                  valueListenable:
                      Hive.box<NotificationDB>('NotificationBox').listenable(),
                  builder: (context, box, _) {
                    bool visiblity = false;
                    int points_required = 0;
                    if (box.isEmpty) {
                      visiblity = false;
                    }
                    if (box.isNotEmpty) {
                      final NotificationDetails = box.getAt(0);
                      visiblity = true;
                      points_required =
                          NotificationDetails?.points_required.toInt() as int;
                    }

                    return Visibility(
                      visible: visiblity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          points_required == 0
                              ? UpcomingStatusNofificationWidget(
                                  outerpadding: outerpadding)
                              : PointsRequiredNofificationWidget(
                                  outerpadding: outerpadding,
                                  pointsRequired: points_required,
                                ),
                          SizedBox(height: height23),
                        ],
                      ),
                    );
                  }),
            ],
          ),
          Padding(
            padding: outerpadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'LOYALTY DETAILS',
                  style: TextStyles.rubik14black33,
                ),
                SizedBox(height: height23),
                ValueListenableBuilder<Box<UserDetailsDB>>(
                  valueListenable:
                      Hive.box<UserDetailsDB>('UserDetailsBox').listenable(),
                  builder: (context, box, _) {
                    final userDetails = box.values.toList();
                    if (userDetails.isEmpty) {
                      return const PointDetailShimmer();
                    } else if (userDetails != null && userDetails.isNotEmpty) {
                      return Column(
                        children: [
                          ExpenseList(
                            image: 'assets/points_received.svg',
                            points: '${userDetails[0].wallet_total}',
                            status: 'Total Points Received',
                            isPointRecieved: true,
                          ),
                          const SizedBox(height: 27),
                          ExpenseList(
                            image: 'assets/points_utilized.svg',
                            points: '${userDetails[0].wallet_used}',
                            status: 'Total Points Utilized',
                            isPointRecieved: false,
                          ),
                          const SizedBox(height: 27),
                          AvailableBalance(
                            image: 'assets/available_balance.svg',
                            content: 'Available Balance',
                            points: '${userDetails[0].wallet_balance}',
                            status: 'Available Balance',
                          ),
                        ],
                      );
                    }
                    return const PointDetailShimmer();
                  },
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileSection extends StatefulWidget {
  const ProfileSection({
    super.key,
  });

  @override
  State<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  @override
  void initState() {
    context
        .read<UserDetailsBloc>()
        .add(const UserDetailsEvent.fetchUserDetails());
    BlocListener<UserDetailsBloc, UserDetailsState>(
      listener: (context, state) async {
        await UserDetailsBox.put(
          0,
          UserDetailsDB(
            customer_id: state.userDetails.data?.user?.customerId.toString(),
            email: state.userDetails.data?.user?.email.toString(),
            image: state.userDetails.data?.user?.imgUrl.toString(),
            name: state.userDetails.data?.user!.name.toString() as String,
            phone: state.userDetails.data?.user?.phoneNumber.toString(),
            wallet_balance:
                state.userDetails.data?.user?.walletBalance.toString(),
            wallet_total: state.userDetails.data?.user?.walletTotal.toString(),
            wallet_used: state.userDetails.data?.user?.walletUsed.toString(),
            dial_code: state.userDetails.data?.user?.countryCode.toString(),
          ),
        );
        if (state.userDetails.data != null) {
          // Update the Hive database with new user details
          await countryCodeBox.put(
            0,
            CountryCodeDB(
              country_code: state.userDetails.data?.user?.countryCode.toString()
                  as String,
              dial_code: state.userDetails.data?.user?.countryCode.toString()
                  as String,
            ),
          );
        }
      },
    );
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context
          .read<UserDetailsBloc>()
          .add(const UserDetailsEvent.fetchUserDetails());
    });
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
    return BlocListener<UserDetailsBloc, UserDetailsState>(
      listener: (context, state) async {
        UserDetailsBox.put(
          0,
          UserDetailsDB(
            customer_id: state.userDetails.data?.user?.customerId.toString(),
            email: state.userDetails.data?.user?.email.toString(),
            image: state.userDetails.data?.user?.imgUrl.toString(),
            name: state.userDetails.data?.user!.name.toString() as String,
            phone: state.userDetails.data?.user?.phoneNumber.toString(),
            wallet_balance:
                state.userDetails.data?.user?.walletBalance.toString(),
            wallet_total: state.userDetails.data?.user?.walletTotal.toString(),
            wallet_used: state.userDetails.data?.user?.walletUsed.toString(),
            dial_code: state.userDetails.data?.user?.countryCode.toString(),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: outerpadding,
              child: ValueListenableBuilder<Box<UserDetailsDB>>(
                valueListenable:
                    Hive.box<UserDetailsDB>('UserDetailsBox').listenable(),
                builder: (context, box, _) {
                  final userDetails = box.values.toList();

                  if (userDetails.isEmpty) {
                    return const ProfileShimmer();
                  } else if (userDetails != null && userDetails.isNotEmpty) {
                    return Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color.fromARGB(255, 255, 128, 130),
                                Color.fromARGB(255, 253, 87, 89),
                                Color.fromARGB(255, 255, 81, 84),
                                Color.fromARGB(255, 249, 58, 62),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(15)),
                        child: LayoutBuilder(builder: (context, constraints) {
                          double containerHeight = constraints.maxHeight;
                          return Stack(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(width: width15),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(height: height18),
                                      // CircleAvatar(
                                      //   radius: 30,
                                      //   backgroundColor: Colors.white,
                                      //   child: ClipOval(
                                      //       child: Image.network(
                                      //           "${userDetails[0].image}")),
                                      // ),
                                      CircleAvatar(
                                        radius: 30,
                                        backgroundColor: Colors.white,
                                        child: Container(
                                          padding: EdgeInsets.all(
                                              2), // Adjust the padding value to control the border thickness
                                          decoration: BoxDecoration(
                                            color: Colors.white, // Border color
                                            shape: BoxShape.circle,
                                          ),
                                          child: ClipOval(
                                            child: Image.network(
                                              "${userDetails[0].image}",
                                              fit: BoxFit.cover,
                                              width:
                                                  56, // Adjusted to fit within the padding
                                              height:
                                                  56, // Adjusted to fit within the padding
                                              loadingBuilder: (context, child,
                                                  loadingProgress) {
                                                if (loadingProgress == null)
                                                  return child;
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
                                              errorBuilder: (context, error,
                                                      stackTrace) =>
                                                  Icon(
                                                Icons.person,
                                                color: Colors.grey,
                                                size: 30,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                      // const CircleAvatar(
                                      //   radius: 30,
                                      //   backgroundColor: Colors.white,
                                      //   child: ClipOval(
                                      //       child: Icon(
                                      //     Icons.person,
                                      //     size: 50,
                                      //     color: Colors.grey,
                                      //   )),
                                      // ),
                                    ],
                                  ),
                                  SizedBox(width: width15),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: height18),
                                      Text(
                                        limitString(
                                            'Hello ${userDetails[0].name}', 19),
                                        style: TextStyles.rubik18whiteFF,
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        limitString(
                                            '${userDetails[0].email}', 18),
                                        style: TextStyles.rubik14whiteFF,
                                      ),
                                      const SizedBox(height: 4),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          // Text(
                                          //   'Customer Id : $customerid',
                                          //   style: TextStyles.ibmMono14whiteFF,
                                          // ),
                                          Text(
                                            'Customer Id: ${userDetails[0].customer_id}',
                                            style: TextStyles.rubik14whiteFF,
                                          ),
                                          SizedBox(width: 9),
                                          //  IconButton(onPressed: (), icon: icon)
                                          InkWell(
                                            onTap: () async {
                                              String textToCopy =
                                                  "${userDetails[0].customer_id}";

                                              // Copy text to clipboard
                                              await Clipboard.setData(
                                                  ClipboardData(
                                                      text: textToCopy));

                                              showCustomToast(
                                                context,
                                                "Customer ID copied to the clipboard",
                                                MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.85, // Adjust vertical position here
                                              );
                                            },
                                            child: Icon(
                                              Icons.copy,
                                              color: Colors.white,
                                              size: 15,
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(height: height21),
                                    ],
                                  ),
                                  const Spacer(),
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(height: height18),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: width20)
                                ],
                              ),
                              Positioned(
                                // top: 220,
                                right: 5,
                                top: 20,
                                child: IconButton(
                                  onPressed: () {
                                    navigateToprofileEdit(context);
                                  },
                                  icon: SvgPicture.asset(
                                    "assets/Eye icon.svg",
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          );
                        }));
                  }
                  return const ProfileShimmer();
                },
              )),
        ],
      ),
    );
  }

  String limitString(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return text.substring(0, maxLength) + '...';
    }
  }
}
