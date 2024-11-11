import 'package:Yes_Loyalty/core/db/hive_db/adapters/country_code_adapter/country_code_adapter.dart';
import 'package:Yes_Loyalty/core/db/hive_db/adapters/notification_adater/notification_adapter.dart';
import 'package:Yes_Loyalty/core/db/hive_db/boxes/country_code_box.dart';
import 'package:Yes_Loyalty/core/db/hive_db/boxes/notification_box.dart';
import 'package:Yes_Loyalty/core/db/shared/shared_prefernce.dart';
import 'package:Yes_Loyalty/core/notification/local_notification.dart';
import 'package:Yes_Loyalty/core/notification/push_notifications.dart';
import 'package:Yes_Loyalty/core/view_model/change_password/change_password_bloc.dart';
import 'package:Yes_Loyalty/core/view_model/change_store/change_store_bloc.dart';
import 'package:Yes_Loyalty/core/view_model/delete_account/delete_account_bloc.dart';
import 'package:Yes_Loyalty/core/view_model/forgot_password/forgot_password_bloc.dart';
import 'package:Yes_Loyalty/core/view_model/get_support/get_support_bloc.dart';
import 'package:Yes_Loyalty/core/view_model/notification_preference/notification_prefernce_bloc.dart';
import 'package:Yes_Loyalty/core/view_model/qr_scanning/qr_scanning_bloc.dart';
import 'package:Yes_Loyalty/core/view_model/reset_password/reset_password_bloc.dart';
import 'package:Yes_Loyalty/core/view_model/verify_otp/verify_otp_bloc.dart';
import 'package:Yes_Loyalty/ui/screens/auth/acc_created_success/layout_view.dart';
import 'package:Yes_Loyalty/ui/screens/auth/user_signin/layout_view.dart';
import 'package:Yes_Loyalty/ui/screens/auth/user_signup/layout_view.dart';
import 'package:Yes_Loyalty/ui/screens/home/layout_view.dart';
import 'package:Yes_Loyalty/ui/screens/misc/password-reset/reset-password.dart';
import 'package:Yes_Loyalty/ui/screens/misc/password-reset/password-forgot.dart';
import 'package:Yes_Loyalty/ui/screens/misc/password-reset/verify-otp.dart';
import 'package:Yes_Loyalty/ui/screens/misc/profile_edit/layout_view.dart';
import 'package:Yes_Loyalty/ui/screens/pdf/pdf_screen.dart';
import 'package:Yes_Loyalty/ui/screens/settings/privacy/privacy_screen.dart';
import 'package:Yes_Loyalty/ui/screens/settings/support/support_screen.dart';
import 'package:Yes_Loyalty/ui/screens/settings/terms_and_condition/terms_and_condition.dart';
import 'package:Yes_Loyalty/ui/screens/settings/user/change_password/change_password.dart';
import 'package:Yes_Loyalty/ui/screens/settings/user/delete_account/delete_account.dart';
import 'package:Yes_Loyalty/ui/screens/settings/user/user_settings.dart';
import 'package:Yes_Loyalty/ui/screens/splash/splash_screen.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:Yes_Loyalty/core/db/hive_db/adapters/branch_list_adater/branch_list_adapter.dart';
import 'package:Yes_Loyalty/core/db/hive_db/adapters/selected_branch_adater/selected_adapter.dart';
import 'package:Yes_Loyalty/core/db/hive_db/adapters/user_details_adapter/user_details_adapter.dart';
import 'package:Yes_Loyalty/core/db/hive_db/boxes/branch_list_box.dart';
import 'package:Yes_Loyalty/core/db/hive_db/boxes/selected_branch_box.dart';
import 'package:Yes_Loyalty/core/db/hive_db/boxes/user_details_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Yes_Loyalty/core/view_model/login/login_bloc.dart';
import 'package:Yes_Loyalty/core/view_model/offer_info/offer_info_bloc.dart';
import 'package:Yes_Loyalty/core/view_model/offers_list/offers_list_bloc.dart';
import 'package:Yes_Loyalty/core/view_model/profile_edit/profile_edit_bloc.dart';
import 'package:Yes_Loyalty/core/view_model/register/register_bloc.dart';
import 'package:Yes_Loyalty/core/view_model/logout/logout_bloc.dart';
import 'package:Yes_Loyalty/core/view_model/store_details/store_details_bloc.dart';
import 'package:Yes_Loyalty/core/view_model/store_list/store_list_bloc.dart';
import 'package:Yes_Loyalty/core/view_model/transaction_details/transaction_details_bloc.dart';
import 'package:Yes_Loyalty/core/view_model/user_details/user_details_bloc.dart';
// import 'package:timezone/data/latest.dart' as tz;

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await SetSharedPreferences.checkAndClearFirstRunData();

  // Initialize Hive
  await Hive.initFlutter();
  Hive.registerAdapter(SelectedBranchDBAdapter());
  Hive.registerAdapter(BranchListDBAdapter());
  Hive.registerAdapter(UserDetailsDBAdapter());
  Hive.registerAdapter(CountryCodeDBAdapter());
  Hive.registerAdapter(NotificationDBAdapter());

  selectedBranchBox = await Hive.openBox<SelectedBranchDB>('selectedBranchBox');
  countryCodeBox = await Hive.openBox<CountryCodeDB>('countryCodeBox');
  BranchListBox = await Hive.openBox<BranchListDB>('BranchListBox');
  UserDetailsBox = await Hive.openBox<UserDetailsDB>('UserDetailsBox');
  NotificationBox = await Hive.openBox<NotificationDB>('NotificationBox');

  void checkAccessTokenForNotification(String? deepLink) async {
    final String? accessToken = await GetSharedPreferences.getAccessToken();

    if (accessToken != null) {
      // User is logged in
      if (deepLink == null || deepLink.isEmpty) {
        // If deep link is null or empty, navigate to splash screen
        navigatorKey.currentState?.pushNamed('/');
      } else {
        // Handle the deep link routing
        if (deepLink == 'tab/offers') {
          navigatorKey.currentState?.pushNamed('/home');
        } else if (deepLink == 'tab/home') {
          navigatorKey.currentState?.pushNamed('/home');
        } else {
          // Handle other deep links if any
        }
      }
    } else {
      // User is not logged in, navigate to splash screen
      navigatorKey.currentState?.pushNamed('/');
    }
  }

  // Lock orientation to portrait mode
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // Initialize notification services
  // await LocalNotificationService.init();
  // tz.initializeTimeZones();
  // await PushNotificationsService.init();

  // Handle notifications in background
  // FirebaseMessaging.onBackgroundMessage(
  //     PushNotificationsService.onBackgroundMessage);

  // Handle notifications when app is launched from terminated state
  // final RemoteMessage? initialMessage =
  //     await FirebaseMessaging.instance.getInitialMessage();
  // if (initialMessage != null) {
  //   final data = initialMessage.data;
  //   final deepLink = data['deep_link']; // Replace with your key

  //   // Check access token and handle deep link navigation
  //   checkAccessTokenForNotification(deepLink);
  // }

  // Handle notifications when app is in foreground
  // FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
  //   if (message.data.isNotEmpty) {
  //     // Fetch data from the message
  //     final data = message.data;
  //     final deepLink = data['deep_link']; // Replace with your key
  //     print('deepest link $deepLink');

  //     // Handle notification tap in foreground
  //     await PushNotificationsService.onForeroundNotificationTapped(
  //         message, navigatorKey);

  //     // Check access token and deep link to route the user
  //     checkAccessTokenForNotification(deepLink);
  //   }
  // });

  // Handle notification taps when the app is in background
  // FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
  //   if (message.data.isNotEmpty) {
  //     // Fetch data from the message
  //     final data = message.data;
  //     final deepLink = data['deep_link']; // Replace with your key
  //     print('deepest link $deepLink');

  //     // Handle notification tap in foreground
  //     await PushNotificationsService.onForeroundNotificationTapped(
  //         message, navigatorKey);

  //     // Check access token and deep link to route the user
  //     checkAccessTokenForNotification(deepLink);
  //   }
  // });

  // Run the app
  runApp(const MyApp());
}

///---------------------------------------------------------------------------

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => RegisterBloc(),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(),
        ),
        BlocProvider(
          create: (context) => UserDetailsBloc(),
        ),
        BlocProvider(
          create: (context) => OffersListBloc(),
        ),
        BlocProvider(
          create: (context) => OfferInfoBloc(),
        ),
        BlocProvider(
          create: (context) => StoreDetailsBloc(),
        ),
        BlocProvider(
          create: (context) => StoreListBloc(),
        ),
        BlocProvider(
          create: (context) => TransactionDetailsBloc(),
        ),
        BlocProvider(
          create: (context) => ProfileEditBloc(),
        ),
        BlocProvider(
          create: (context) => ChangePasswordBloc(),
        ),
        BlocProvider(
          create: (context) => GetSupportBloc(),
        ),
        BlocProvider(
          create: (context) => DeleteAccountBloc(),
        ),
        BlocProvider(
          create: (context) => ForgotPasswordBloc(),
        ),
        BlocProvider(
          create: (context) => VerifyOtpBloc(),
        ),
        BlocProvider(
          create: (context) => ResetPasswordBloc(),
        ),
        BlocProvider(
          create: (context) => QrScanningBloc(),
        ),
        BlocProvider(
          create: (context) => ChangeStoreBloc(),
        ),
        BlocProvider(
          create: (context) => OffersListBloc(),
        ),
        BlocProvider(
          create: (context) => NotificationPrefernceBloc(),
        ),
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: false),
        initialRoute: '/',
        onUnknownRoute: (settings) => MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        ),
        routes: {
          '/': (context) => const SplashScreen(),
          '/sigin': (context) => const SignInScreen(),
          '/accCreatedSuccess': (context) =>
              const AccountCreatedSuccessScreen(),
          '/signup': (context) => SignupScreen(),
          '/profileEdit': (context) => const ProfileEdit(),
          '/changepassword': (context) => const ChangePassWord(),
          '/forgotpassword': (context) => const ForgotPassWord(),
          '/verfyOtp': (context) => const VerifyOtpScreen(),
          '/userSettings': (context) => const UserSettings(),
          '/getSupport': (context) => const GetSupportScreen(),
          '/resetpassword': (context) => const ResetPasswordChangeScreen(),
          '/deleteAccount': (context) => const DeleteAccount(),
          '/home': (context) => const HomeScreen(),
          '/privacy': (context) => const PrivacyScreen(),
          '/termsAndCondition': (context) => const TermsAndConditionScreen(),
           '/pdfScreen': (context) => const PdfScreen(),
        },
      ),
    );
  }
}
