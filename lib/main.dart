import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:xeniusapp/business_logic/models/comparative/comparative_report.dart';
import 'package:xeniusapp/constants.dart';
import 'package:xeniusapp/locator.dart';
import 'package:xeniusapp/splash_screen.dart';
import 'package:xeniusapp/ui/view/fortgot_password/password_input_view.dart';
import 'package:xeniusapp/ui/view/fortgot_password/password_reset_otp.dart';
import 'package:xeniusapp/ui/view/fortgot_password/reset_password_view.dart';

import 'package:xeniusapp/ui/view/home/home.dart';
import 'package:xeniusapp/ui/view/login/login_view.dart';
import 'package:xeniusapp/ui/view/profile/user_profile_dialog.dart';
import 'package:xeniusapp/ui/view/recharge/coupon_recharge_view.dart';
import 'package:xeniusapp/ui/view/report/comparative_report_view.dart';
import 'package:xeniusapp/ui/view/report/daily_report_view.dart';
import 'package:xeniusapp/ui/view/report/monthly_report/monthly_report_view.dart';
import 'package:xeniusapp/ui/view/util/change_password_view.dart';

import 'package:xeniusapp/ui/view/util/notification_settings.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setupLoactor();
  _setUpLogging();
  runApp(XeniusApp());
}

void _setUpLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}

class XeniusApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _XeniusAppState createState() => _XeniusAppState();
}

class _XeniusAppState extends State<XeniusApp> {
  String loginId;
  String password;

  String _message = '';

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  _register() {
    _firebaseMessaging.getToken().then((value) async {
      SharedPreferences userPref = await SharedPreferences.getInstance();
      userPref.setString('fcmToken', value);
      print(value);
    });
  }

  @override
  void initState() {
    initPref();
    super.initState();
    getMessage();
    _register();
  }

  void getMessage() {
    _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) async {
      showOverlayNotification((context) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          child: SafeArea(
            child: ListTile(
              leading: Container(
                margin: EdgeInsets.only(top: 48.0),
                child: CircleAvatar(
                  radius: 80.0,
                  backgroundColor: Colors.white,
                  child: Image.asset('assets/images/ic_xenius_logo.png'),
                ),
              ),
              title: Text("${message['notification']['title']}"),
              subtitle: Text("${message['data']['url']}"),
              trailing: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    OverlaySupportEntry.of(context).dismiss();
                  }),
            ),
          ),
        );
      }, duration: Duration(milliseconds: 4000));
      print("on message ${message['data']['url']}");
      setState(() => _message = message["notification"]["title"]);
    }, onResume: (Map<String, dynamic> message) async {
      print('on resume $message');
      setState(() => _message = message["notification"]["title"]);
    }, onLaunch: (Map<String, dynamic> message) async {
      print('on launch $message');
      setState(() => _message = message["notification"]["title"]);
    });
  }

  void initPref() async {
    SharedPreferences userPref = await SharedPreferences.getInstance();
    setState(() {
      loginId = userPref.getString('login_id');
      password = userPref.getString('password');
    });
  }

  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: kColorPrimary,
            fontFamily: 'Lato',
            scaffoldBackgroundColor: Colors.white,
          ),
          initialRoute: SplashScreen.id,
          //loginId != null || password != null ? Home.id : LoginView.id,//
          routes: {
            SplashScreen.id: (context) => SplashScreen(),
            Home.id: (context) => Home(),
            LoginView.id: (context) => LoginView(),
            DailyReportView.id: (context) => DailyReportView(),
            MonthlyReportView.id: (context) => MonthlyReportView(),
            ComparativeReportView.id: (context) => ComparativeReportView(),
            NotificationSettings.id: (context) => NotificationSettings(),
            PasswordInput.id: (context) => PasswordInput(),
            PasswordResetOtp.id: (context) => PasswordResetOtp(),
            ResetPassword.id: (context) => ResetPassword(),
            ChangePassword.id: (context) => ChangePassword(),
            CouponRechargeView.id: (context) => CouponRechargeView(),
          },
        ),
    );
  }
}
