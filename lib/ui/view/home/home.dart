import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xeniusapp/business_logic/enum/viewstate.dart';
import 'package:xeniusapp/business_logic/models/login_resource.dart';
import 'package:xeniusapp/business_logic/viewmodels/login_viewmodel.dart';
import 'package:xeniusapp/constants.dart';
import 'package:xeniusapp/locator.dart';
import 'package:xeniusapp/ui/view/home/components/collapsing_toolbar.dart';
import 'package:xeniusapp/ui/view/home/components/overview.dart';
import 'package:xeniusapp/ui/view/login/login_view.dart';
import 'package:xeniusapp/ui/view/profile/user_profile_dialog.dart';
import 'package:xeniusapp/ui/view/recharge/recharge_view.dart';
import 'package:xeniusapp/ui/view/report/report_view.dart';
import 'package:xeniusapp/ui/view/util/dg_event_logging.dart';
import 'package:xeniusapp/ui/view/util/marquee_widget.dart';
import 'package:xeniusapp/ui/view/util/notice.dart';
import 'package:xeniusapp/ui/view/util/notification_settings.dart';

import '../base_view.dart';

class Home extends StatefulWidget {
  static const String id = 'home';

  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  LoginResource loginResource;
  LoginViewModel loginViewModel = locator<LoginViewModel>();

  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  void initState() {
    loginViewModel.login().then((value) {
      setState(() {
        loginResource = value.body;
      });
    });

    super.initState();
  }

  final List<Widget> _widgetOption = [
    OverviewPage(),
    RechargeView(),
    ReportView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white70,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool isScrolled) {
          return [
            SliverAppBar(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) {
                            return NoticeDialog();
                          },
                          fullscreenDialog: true));
                    },
                    child: Container(
                      height: 24.0,
                      width: 24.0,
                      child: Icon(Icons.notifications),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(NotificationSettings.id);
                    },
                    child: Container(
                      height: 24.0,
                      width: 24.0,
                      child: Icon(Icons.settings),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) {
                            return DgEventLogging();
                          },
                          fullscreenDialog: true));
                    },
                    child: Container(
                      height: 24.0,
                      width: 24.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/ic_dg_event_logging.png')),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute<Null>(
                          builder: (BuildContext context) {
                            return UserProfileDialog();
                          },
                          fullscreenDialog: true));
                    },
                    child: Container(
                      height: 24.0,
                      width: 24.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/ic_person_menu.png')),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Container(
                    height: 16.0,
                    child: PopupMenuButton(
                      onSelected: (value) async {
                        if (value == 1) {
                          SharedPreferences preferences =
                              await SharedPreferences.getInstance();
                          await preferences.clear();
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              LoginView.id, (Route<dynamic> route) => false);
                        }
                      },
                      color: kColorAccentRed,
                      child: Icon(Icons.more_vert),
                      itemBuilder: (context) {
                        return [
                          PopupMenuItem(
                              value: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Text(
                                  'Sign out',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ))
                        ];
                      },
                    ),
                  ),
                ),
              ],
              expandedHeight: 128.0,
              floating: true,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                centerTitle: true,
                title: Container(
                  margin: EdgeInsets.only(left: 24.0, top: 48.0),
                  child: ListView(
                    children: [
                      Text('Unit No\n${loginResource.resource.flat_number}',
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 12.0,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 16.0, right: 24.0, bottom: 16.0),
                        child: MarqueeWidget(
                            direction: Axis.horizontal,
                            child: Text(
                              '${loginResource.resource.msg}',
                              style: TextStyle(
                                  backgroundColor: kColorAccentRed,
                                  fontSize: 12.0),
                            )),
                      )
                    ],
                  ),
                ),
                background: Container(
                  height: 96,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Image.asset(
                      'assets/images/ic_xenius_logo.png',
                      fit: BoxFit.contain,
                      color: Color.fromRGBO(
                        255,
                        255,
                        255,
                        0.5,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ];
        },
        body: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: Container(child: _widgetOption.elementAt(_selectedIndex)),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          items: [
            Icon(
              Icons.home,
              size: 30.0,
            ),
            Icon(Icons.mobile_screen_share),
            Icon(Icons.insert_chart),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.transparent,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          }),
    );
  }
}
