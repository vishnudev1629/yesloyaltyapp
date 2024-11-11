import 'package:Yes_Loyalty/core/constants/text_styles.dart';
import 'package:Yes_Loyalty/core/db/hive_db/boxes/country_code_box.dart';
import 'package:Yes_Loyalty/core/db/hive_db/boxes/selected_branch_box.dart';
import 'package:Yes_Loyalty/core/db/hive_db/boxes/user_details_box.dart';
import 'package:Yes_Loyalty/core/db/shared/shared_prefernce.dart';
import 'package:Yes_Loyalty/core/routes/app_route_config.dart';
import 'package:Yes_Loyalty/core/view_model/logout/logout_bloc.dart';
import 'package:Yes_Loyalty/ui/animations/toast.dart';
import 'package:Yes_Loyalty/ui/screens/home/sub_screen/settings.dart';
import 'package:Yes_Loyalty/ui/widgets/appbar.dart';
import 'package:Yes_Loyalty/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class UserSettings extends StatefulWidget {
  const UserSettings({
    super.key,
  });

  @override
  State<UserSettings> createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserSettings> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
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
          const SizedBox(height: 20),
          const SizedBox(height: 10),
          SettingsContent(
              description: '  Change Password',
              icon: SvgPicture.asset(
                'assets/change_p_settings.svg',
              ),
              onTap: () {
                print("sss");

                navigateToChangePassword(context);
              }),
          SettingsContent(
              description: 'Delete Account',
              icon: SvgPicture.asset(
                'assets/delete_settings.svg',
              ),
              onTap: () {
                print("sss");

                navigateTodeleteAcc(context);
              }),
          SettingsContent(
            description: ' Logout',
            icon: SvgPicture.asset(
              'assets/logout_settings.svg',
            ),
            onTap: () {
              showExitPopup(context);
            },
          ),
        ],
      ),
    ));
  }

  Future showExitPopup(context) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          contentPadding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Logout", style: TextStyles.rubik16black33w600),
                  Spacer(),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.close))
                ],
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Column(
                  children: [
                    Text("Are you sure you want to logout your account?",
                        style: TextStyles.rubik16black33w400),
                    const SizedBox(height: 20),
                    LogoutColoredButton(
                      text: 'Logout',
                      onPressed: () async {
                        try {
                          context
                              .read<LogoutBloc>()
                              .add(const LogoutEvent.logout());
                          await GetSharedPreferences.deleteAccessToken();
                          await GetSharedPreferences.getCountrycodes();
                          await selectedBranchBox.clear();
                          await UserDetailsBox.clear();
                          await countryCodeBox.clear();
                          if (context.mounted) {
                            return navigateTosiginCleared(context);
                          }
                        } catch (e) {
                          // Handle any errors that occur during the asynchronous operations
                          print('Error during logout: $e');
                          showCustomToast(
                              context,
                              'Failed to log out. Please try again.',
                              MediaQuery.of(context).size.height * 0.7);
                        }
                      },
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "Cancel",
                          style: TextStyles.rubik16black33w300,
                        )),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
