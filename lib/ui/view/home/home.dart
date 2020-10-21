import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:xeniusapp/constants.dart';
import 'package:xeniusapp/ui/view/home/components/collapsing_toolbar.dart';
import 'package:xeniusapp/ui/view/home/components/overview.dart';
import 'package:xeniusapp/ui/view/recharge/recharge_view.dart';
import 'package:xeniusapp/ui/view/report/report_view.dart';

class Home extends StatefulWidget {
  static const String id = 'home';

  Home({Key key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  GlobalKey _bottomNavigationKey = GlobalKey();

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
      backgroundColor: Colors.white70,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool isScrolled) {
          return <Widget>[
            CollapsingToolBar(),
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
