import 'dart:async';

import 'package:Yes_Loyalty/core/db/hive_db/adapters/country_code_adapter/country_code_adapter.dart';
import 'package:Yes_Loyalty/core/db/hive_db/boxes/country_code_box.dart';
import 'package:Yes_Loyalty/core/view_model/qr_scanning/qr_scanning_bloc.dart';
import 'package:Yes_Loyalty/ui/screens/home/sub_screen/settings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:Yes_Loyalty/core/constants/common.dart';
import 'package:Yes_Loyalty/core/constants/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Yes_Loyalty/core/constants/text_styles.dart';
import 'package:Yes_Loyalty/core/db/hive_db/adapters/branch_list_adater/branch_list_adapter.dart';
import 'package:Yes_Loyalty/core/db/hive_db/adapters/selected_branch_adater/selected_adapter.dart';
import 'package:Yes_Loyalty/core/db/hive_db/adapters/user_details_adapter/user_details_adapter.dart';
import 'package:Yes_Loyalty/core/db/hive_db/boxes/branch_list_box.dart';
import 'package:Yes_Loyalty/core/db/hive_db/boxes/selected_branch_box.dart';
import 'package:Yes_Loyalty/core/db/hive_db/boxes/user_details_box.dart';
import 'package:Yes_Loyalty/core/db/shared/shared_prefernce.dart';
import 'package:Yes_Loyalty/core/view_model/store_details/store_details_bloc.dart';
import 'package:Yes_Loyalty/core/view_model/store_list/store_list_bloc.dart';
import 'package:Yes_Loyalty/core/view_model/transaction_details/transaction_details_bloc.dart';
import 'package:Yes_Loyalty/core/view_model/user_details/user_details_bloc.dart';
import 'package:Yes_Loyalty/ui/screens/home/sub_screen/history.dart';
import 'package:Yes_Loyalty/ui/screens/home/sub_screen/profile.dart';
import 'package:Yes_Loyalty/ui/screens/home/sub_screen/offers.dart';
import 'package:Yes_Loyalty/ui/screens/home/widgets/location_details.dart';
import 'package:Yes_Loyalty/ui/widgets/appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ValueNotifier<String?> _selectedBranchNotifier;
  int _selectedIndex = 1;
  bool _isBackPressed = false; // Add this flag

  static final List<Widget> _screens = [
    const History(),
    const Profile(),
    const Offers(),
    const SettingsScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  var a = '22';
  List<StoreData> storeDataList = [];

  @override
  void initState() {
    _loadCountryCode();
    context
        .read<UserDetailsBloc>()
        .add(const UserDetailsEvent.fetchUserDetails());
    BlocListener<UserDetailsBloc, UserDetailsState>(
      listener: (context, state) async {
        UserDetailsBox.put(
          0,
          UserDetailsDB(
            customer_id: state.userDetails.data?.user?.customerId.toString(),
            email: state.userDetails.data?.user?.email.toString(),
            image: state.userDetails.data?.user?.imgUrl.toString(),
            name: state.userDetails.data?.user?.name.toString() as String,
            phone: state.userDetails.data?.user?.phoneNumber.toString(),
            wallet_balance:
                state.userDetails.data?.user?.walletBalance.toString(),
            wallet_total: state.userDetails.data?.user?.walletTotal.toString(),
            wallet_used: state.userDetails.data?.user?.walletUsed.toString(),
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
    _selectedBranchNotifier = ValueNotifier(null);

    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      a = GetSharedPreferences.getAccessToken.toString();

      context
          .read<StoreDetailsBloc>()
          .add(StoreDetailsEvent.fetchStoreDetails(storeId: '1'));
      context
          .read<UserDetailsBloc>()
          .add(const UserDetailsEvent.fetchUserDetails());
      _checkBranchAndShowModal();
    });
  }

  Future<void> _checkBranchAndShowModal() async {
    bool hasSelectedBranch = await _getSelectedBranch();
    if (!hasSelectedBranch) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showModal(context);
      });
    }
  }

  Future<bool> _getSelectedBranch() async {
    try {
      final selectedBranchBox = Hive.box<SelectedBranchDB>('selectedBranchBox');
      final selectedBranch = selectedBranchBox.get('selectedBranchDetail');
      if (selectedBranch != null) {
        _selectedBranchNotifier.value = selectedBranch.selctedBranchName;
        return true;
      }
    } catch (error) {
      print('Error fetching data from Hive: $error');
      // Handle errors appropriately, e.g., display an error message
    }
    return false;
  }

  Map bankData = {};
  var bank;
  bool isexit = false;
  String _countryCode = 'Loading...';
  Future<void> _loadCountryCode() async {
    String? countryCode = await GetSharedPreferences.getCountrycodes();

    setState(() {
      _countryCode = countryCode ?? 'No country code found';
    });
  }

  @override
  Widget build(BuildContext context) {
    
    context
        .read<UserDetailsBloc>()
        .add(const UserDetailsEvent.fetchUserDetails());
    double screenheight = screenHeight(context);
    double height23 = screenheight * 23 / FigmaConstants.figmaDeviceHeight;
    // Define getData function outside the Timer callback
    void getProfileData() async {
      // Fetch user details
      context.read<StoreListBloc>().state.storeDetails;
    }

// Call getData immediately and then start the periodic timer

    // Fetch user details when the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context
          .read<UserDetailsBloc>()
          .add(const UserDetailsEvent.fetchUserDetails());
      context.read<StoreListBloc>().add(const StoreListEvent.fetchStoreList());
    });

    // double screenwidth = screenWidth(context);

    double height22 = screenheight * 22 / FigmaConstants.figmaDeviceHeight;
    double height92 = screenheight * 92 / FigmaConstants.figmaDeviceHeight;
    double height10 = screenheight * 10 / FigmaConstants.figmaDeviceHeight;
    Map<String, dynamic> row = {};
    final Box<UserDetailsDB> UserDetailsBox =
        Hive.box<UserDetailsDB>('UserDetailsBox');

    Future<List<UserDetailsDB>> _getCountryCodes() async {
      return UserDetailsBox.values.toList();
    }

    return WillPopScope(
      onWillPop: () async {
        if (_selectedIndex == 1) {
          SystemNavigator.pop();

          // Allow exit
        } else if (_selectedIndex == 0 ||
            _selectedIndex == 2 ||
            _selectedIndex == 3) {
          setState(() {
            _selectedIndex = 1;
          });
          return false; // Prevent exit
        }

        return false; // Prevent exit by default
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        body: MultiBlocListener(
          listeners: [
            BlocListener<StoreListBloc, StoreListState>(
                listener: (context, state) async {
              for (var store in state.storeDetails.data!) {
                // Create a new StoreData object for each store
                var storeData = StoreData(
                    id: store.id?.toInt() ?? 1,
                    name: store.name.toString(),
                    locality: store.address);
                // Add the StoreData object to the list
                storeDataList.add(storeData);
              }

              // Add data to Hive box
              BranchListBox.clear().then(
                (_) {
                  for (var data in storeDataList) {
                    BranchListBox.put(
                      data.id,
                      BranchListDB(
                        id: data.id,
                        selctedBranchName: data.name,
                        locality: data.locality,
                      ),
                    );
                  }
                },
              );
            }),
            BlocListener<UserDetailsBloc, UserDetailsState>(
              listener: (context, state) async {
                await UserDetailsBox.put(
                  0,
                  UserDetailsDB(
                    customer_id:
                        state.userDetails.data?.user?.customerId.toString(),
                    email: state.userDetails.data?.user?.email.toString(),
                    image: state.userDetails.data?.user?.imgUrl.toString(),
                    name:
                        state.userDetails.data?.user!.name.toString() as String,
                    phone: state.userDetails.data?.user?.phone.toString(),
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
                await countryCodeBox.put(
                  0,
                  CountryCodeDB(
                    country_code: state.userDetails.data?.user!.countryAlphaCode
                        .toString() as String,
                    dial_code: state.userDetails.data?.user?.countryCode
                        .toString() as String,
                  ),
                );
                await SetSharedPreferences.storeCountrycode(
                  state.userDetails.data?.user!.countryAlphaCode.toString()
                      as String,
                );
              },
            ),
          ],
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height23),
                HomeAppBar(
                  onBackTap: () async {
                    setState(() {
                      if (_selectedIndex == 0 ||
                          _selectedIndex == 2 ||
                          _selectedIndex == 3) {
                        _selectedIndex = 1; // Navigate to Profile
                      } else if (_selectedIndex == 1) {
                        showExitPopup(context); // Show exit popup
                      }
                    });
                  },
                  isthereback: _selectedIndex == 0 ||
                      _selectedIndex == 2 ||
                      _selectedIndex == 3,
                ),
                Visibility(
                    visible: _selectedIndex == 3 ? false : true,
                    child: SizedBox(height: height23)),
                LocationDetails(
                  isVisible: _selectedIndex == 3 ? false : true,
                ),
                Visibility(
                    visible: _selectedIndex == 3 ? false : true,
                    child: SizedBox(height: height23)),
                Expanded(
                  child: _screens[_selectedIndex],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 92.0,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: SizedBox(
                  width: 24.0, // Set a fixed width
                  height: 24.0, // Set a fixed height
                  child: _selectedIndex == 0
                      ? SvgPicture.asset(
                          'assets/bottom_nav/clock.svg',
                          colorFilter: const ColorFilter.mode(
                            Colors.red,
                            BlendMode.srcIn,
                          ),
                        )
                      : SvgPicture.asset(
                          'assets/bottom_nav/clock.svg',
                          colorFilter: const ColorFilter.mode(
                            Colors.grey,
                            BlendMode.srcIn,
                          ),
                        ),
                ),
                label: 'History',
              ),
              BottomNavigationBarItem(
                icon: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: _selectedIndex == 1
                      ? SvgPicture.asset(
                          'assets/profile.svg',
                          colorFilter: const ColorFilter.mode(
                            Colors.red,
                            BlendMode.srcIn,
                          ),
                        )
                      : SvgPicture.asset(
                          'assets/profile.svg',
                          colorFilter: const ColorFilter.mode(
                            Colors.grey,
                            BlendMode.srcIn,
                          ),
                        ),
                ),
                label: 'Profile',
              ),
              BottomNavigationBarItem(
                icon: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: _selectedIndex == 2
                      ? SvgPicture.asset(
                          'assets/offers.svg',
                          colorFilter: const ColorFilter.mode(
                            Colors.red,
                            BlendMode.srcIn,
                          ),
                        )
                      : SvgPicture.asset(
                          'assets/offers.svg',
                          colorFilter: const ColorFilter.mode(
                            Colors.grey,
                            BlendMode.srcIn,
                          ),
                        ),
                ),
                label: 'Offers',
              ),
              BottomNavigationBarItem(
                icon: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: _selectedIndex == 3
                      ? SvgPicture.asset(
                          'assets/bottom_nav/settings.svg',
                          colorFilter: const ColorFilter.mode(
                            Colors.red,
                            BlendMode.srcIn,
                          ),
                        )
                      : SvgPicture.asset(
                          'assets/bottom_nav/settings.svg',
                          colorFilter: const ColorFilter.mode(
                            Colors.grey,
                            BlendMode.srcIn,
                          ),
                        ),
                ),
                label: 'Settings',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.red,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }

  Future<bool> showExitPopup(context) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            height: 90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Do you want to exit?"),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          SystemNavigator.pop();
                          //exit(0);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red.shade800),
                        child: const Text("Yes"),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      child: const Text("No",
                          style: TextStyle(color: Colors.black)),
                    ))
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void _showModal(context) {
    List<BranchListDB> filteredBranchList;
    String searchTerm = '';
    final TextEditingController _textEditingController =
        TextEditingController(); // Define the controller
    showModalBottomSheet(
      isDismissible: false,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
      ),
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return DraggableScrollableSheet(
              maxChildSize: 0.8,
              initialChildSize: 0.7,
              minChildSize:
                  0.5, // Set a smaller minChildSize to enable scrolling
              expand: false,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Column(
                  children: [
                    const SizedBox(height: 21),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Please select a branch to continue",
                            style: TextStyles.rubikregular16black33,
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () async {
                              Navigator.of(context).pop();
                            },
                            icon: SvgPicture.asset(
                              "assets/Close.svg",
                              color: Colors.black,
                              width: 15,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 500,
                      height: 1,
                      color: const Color.fromARGB(255, 211, 211, 208),
                    ),
                    const SizedBox(height: 9),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 14, top: 8, right: 14, bottom: 8),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller:
                                  _textEditingController, // Assign the controller

                              onChanged: (value) {
                                searchTerm = value;
                              },
                              decoration: InputDecoration(
                                hintText: "Search Location",
                                contentPadding: const EdgeInsets.all(8),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: const BorderSide(),
                                ),
                                prefixIcon: const Icon(Icons.search),
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: IconButton(
                                    icon: const Icon(
                                      FontAwesomeIcons.eraser,
                                      size: 24,
                                      color: Colors.red,
                                    ),
                                    color: const Color(0xFF1F91E7),
                                    onPressed: () async {
                                      setState(() {
                                        searchTerm =
                                            ''; // Clear the search term
                                        _textEditingController.clear();
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 9),
                    ValueListenableBuilder<Box<BranchListDB>>(
                      valueListenable:
                          Hive.box<BranchListDB>('BranchListBox').listenable(),
                      builder: (context, box, _) {
                        final branchList = box.values.toList();
                        if (branchList.isEmpty) {
                          return const CircularProgressIndicator();
                        } else {
                          if (searchTerm.isNotEmpty) {
                            filteredBranchList = branchList
                                .where((branch) => branch.selctedBranchName
                                    .toLowerCase()
                                    .contains(searchTerm.toLowerCase()))
                                .toList();
                          } else {
                            filteredBranchList = List.from(branchList);
                          }
                          return Expanded(
                            child: ListView.separated(
                              controller: scrollController,
                              itemCount: filteredBranchList.length +
                                  1, // Add 1 for the static item
                              itemBuilder: (context, index) {
                                if (index == 0) {
                                  // Static item
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 14, right: 14),
                                    child: InkWell(
                                      onTap: () async {
                                        await GetSharedPreferences
                                            .deleteBranchId();

                                        await selectedBranchBox.put(
                                          'selectedBranchDetail',
                                          SelectedBranchDB(
                                              selctedBranchName:
                                                  'All Branches'),
                                        );
                                        context
                                            .read<TransactionDetailsBloc>()
                                            .add(const TransactionDetailsEvent
                                                .fetchTransactionDetails());

                                        Navigator.of(context)
                                            .pop(); // Close the bottom sheet
                                      },
                                      child: SizedBox(
                                        width: 200,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 23, top: 2, right: 23),
                                          child: Column(
                                            children: [
                                              const SizedBox(height: 12),
                                              Row(
                                                children: [
                                                  const SizedBox(width: 27),
                                                  Text(
                                                    "All Branches",
                                                    style: TextStyles
                                                        .rubik16black33,
                                                  ),
                                                  const Spacer(),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  const SizedBox(width: 27),
                                                  Text(
                                                    "See Transaction in all branches",
                                                    style: TextStyles
                                                        .rubik14black33,
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 12),
                                              SvgPicture.asset(
                                                  "assets/StaticLine.svg"), // Replace StaticLine with your static line asset
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  // Dynamic items
                                  dynamic branch =
                                      filteredBranchList[index - 1];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 14, right: 14),
                                    child: InkWell(
                                      onTap: () async {
                                        Navigator.of(context)
                                            .pop(); // Close the bottom sheet
                                        await SetSharedPreferences
                                            .storeBranchId(
                                                branch.id.toString());

                                        await selectedBranchBox.put(
                                          'selectedBranchDetail',
                                          SelectedBranchDB(
                                            selctedBranchName:
                                                '${filteredBranchList[index - 1].selctedBranchName}, ${filteredBranchList[index - 1].locality}',
                                          ),
                                        );
                                        context
                                            .read<TransactionDetailsBloc>()
                                            .add(const TransactionDetailsEvent
                                                .fetchTransactionDetails());

                                        // _isModalOpenNotifier.value =
                                        //     false; // Modal is closed
                                      },
                                      child: Stack(
                                        children: [
                                          SizedBox(
                                            width: double.infinity,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 23, top: 2, right: 23),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const SizedBox(height: 12),
                                                  Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                          "assets/Map icon.svg"),
                                                      const SizedBox(width: 13),
                                                      Text(
                                                        "${branch.selctedBranchName}",
                                                        style: TextStyles
                                                            .rubik16black33,
                                                      ),
                                                      const Spacer(),
                                                    ],
                                                  ),
                                                  Wrap(
                                                    direction: Axis.horizontal,
                                                    alignment:
                                                        WrapAlignment.start,
                                                    children: [
                                                      const SizedBox(width: 0),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          left: 25,
                                                          top: 10,
                                                        ),
                                                        child: Text(
                                                          "${branch.locality?.isEmpty ?? true ? '' : branch.locality}",
                                                          style: TextStyles
                                                              .rubik14black33,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 12),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.bottomRight,
                                            child: IconButton(
                                              splashRadius: 25,
                                              onPressed: () {
                                                context
                                                    .read<StoreDetailsBloc>()
                                                    .add(StoreDetailsEvent
                                                        .fetchStoreDetails(
                                                      storeId:
                                                          filteredBranchList[
                                                                  index - 1]
                                                              .id
                                                              .toString(),
                                                    ));
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return PopScope(
                                                      // Allow dismissing the popup on initial back press
                                                      canPop: true,
                                                      onPopInvoked: (didPop) {
                                                        // Check if it's the first back press
                                                        final isFirstPop =
                                                            !Navigator.of(
                                                                    context)
                                                                .canPop();

                                                        if (didPop &&
                                                            isFirstPop) {
                                                          // Close the dialog without navigation
                                                          Navigator.of(context)
                                                              .pop();
                                                        }
                                                      },
                                                      child: StoreDetails(
                                                        storeId:
                                                            filteredBranchList[
                                                                    index - 1]
                                                                .id
                                                                .toString(),
                                                      ), // Your dialog content
                                                    );
                                                  },
                                                );
                                              },
                                              icon: SvgPicture.asset(
                                                  "assets/Eye icon.svg"),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }
                              },
                              separatorBuilder: (context, index) {
                                return SvgPicture.asset("assets/Line.svg");
                              },
                            ),
                          );
                        }
                      },
                    )
                  ],
                );
              },
            );
          },
        );
      },
    );
    Widget buildListItem(int index) {
      return Padding(
        padding: const EdgeInsets.only(
          left: 14,
          right: 14,
        ),
        child: SizedBox(
          width: 200,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 23,
              top: 2,
              right: 23,
            ),
            child: Column(
              children: [
                const SizedBox(height: 12),
                Row(
                  children: [
                    SvgPicture.asset("assets/Map icon.svg"),
                    const SizedBox(width: 13),
                    Text(
                      "Thrippunithura",
                      style: TextStyles.rubik16black33,
                    ),
                    const Spacer(),
                    InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return PopScope(
                                // Allow dismissing the popup on initial back press
                                canPop: true,
                                onPopInvoked: (didPop) {
                                  // Check if it's the first back press
                                  final isFirstPop =
                                      !Navigator.of(context).canPop();

                                  if (didPop && isFirstPop) {
                                    // Close the dialog without navigation
                                    Navigator.of(context)
                                        .pop(); // No need for (false) argument
                                  }
                                },
                                child: const StoreDetails(
                                  storeId: 'h',
                                ), // Your dialog content
                              );
                            },
                          );
                        },
                        child: SvgPicture.asset("assets/Eye icon.svg")),
                    // IconButton(
                    //     onPressed: () {
                    //       showDialog(
                    //         context: context,
                    //         builder: (BuildContext context) {
                    //           return PopScope(
                    //             // Allow dismissing the popup on initial back press
                    //             canPop: true,
                    //             onPopInvoked: (didPop) {
                    //               // Check if it's the first back press
                    //               final isFirstPop =
                    //                   !Navigator.of(context)
                    //                       .canPop();

                    //               if (didPop && isFirstPop) {
                    //                 // Close the dialog without navigation
                    //                 Navigator.of(context)
                    //                     .pop(); // No need for (false) argument
                    //               }
                    //             },
                    //             child:
                    //                 const StoreDetails(), // Your dialog content
                    //           );
                    //         },
                    //       );
                    //     },
                    //     icon: SvgPicture.asset(
                    //         "assets/Eye icon.svg")),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(width: 27),
                    Text("Kerala, India", style: TextStyles.rubik14black33),
                  ],
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      );
    }
  }
}

class StoreData {
  final int id;
  final String name;
  var locality;

  StoreData({
    required this.id,
    required this.name,
    required this.locality,
  });
}

class UsersData {
  dynamic customer_id;
  final String name;
  final String email;
  final String image;

  UsersData({
    required this.customer_id,
    required this.name,
    required this.email,
    required this.image,
  });
}
