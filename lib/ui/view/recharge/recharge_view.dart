import 'package:flutter/material.dart';
import 'package:xeniusapp/business_logic/models/login_resource.dart';
import 'package:xeniusapp/business_logic/viewmodels/login_viewmodel.dart';

import 'package:xeniusapp/components/rouded_button_recharge.dart';
import 'package:xeniusapp/constants.dart';
import 'package:xeniusapp/locator.dart';
import 'package:xeniusapp/ui/view/fortgot_password/screen_arguments.dart';
import 'package:xeniusapp/ui/view/recharge/coupon_recharge_view.dart';
import 'package:xeniusapp/ui/view/recharge/recharge_history/recharge_history_view.dart';
import 'package:xeniusapp/ui/view/recharge/recharge_status_dialog.dart';
import 'package:xeniusapp/ui/view/recharge/recharge_webview_dialog.dart';

import 'hdfc_recharge_view.dart';

enum SingingCharacter { grid, dg }

class RechargeView extends StatefulWidget {
  @override
  _RechargeViewState createState() => _RechargeViewState();
}

class _RechargeViewState extends State<RechargeView>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  SingingCharacter _character = SingingCharacter.grid;
  LoginResource loginResource;
  LoginViewModel loginModel = locator<LoginViewModel>();

  bool _disposed = false;

  @override
  void initState() {

      loginModel.login().then((value) {
        if(!_disposed) {
          setState(() {
            loginResource = value.body;
          });
        }
      });

    _controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
   _disposed=true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: [
        // Container(
        //   decoration: BoxDecoration(color: kColorPrimary),
        //   child: TabBar(
        //     controller: _controller,
        //     tabs: [
        //       Tab(
        //         text: 'Online',
        //       ),
        //       Tab(text: 'Coupon'),
        //     ],
        //     indicatorColor: kColorAccentRed,
        //   ),
        // ),
        // Container(
        //   height: 128.0,
        //   child: TabBarView(
        //     controller: _controller,
        //     children: <Widget>[
        //       Card(color: Colors.white, child: rechargeTab()),
        //       Card(
        //         child: rechargeTabCoupon(),
        //       ),
        //     ],
        //   ),
        // ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          margin:
              EdgeInsets.only(top: 16.0, bottom: 2.0, left: 8.0, right: 8.0),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Available balance',
                      style: kLabelTextStyle,
                    ),

                    loginResource != null ? Text(
                      'INR ${loginResource.resource.balance_amount}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: kColorAccentRed,
                      ),
                    ): Text(''),
                  ],
                ),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Updated on',
                      style: kSubLabelTextStyle,
                    ),
                    loginResource != null ?Text(
                      '${loginResource.resource.last_reading_updated}',
                      style: kSubValueTextStyle,
                    ): Text(''),
                  ],
                ),
                SizedBox(height: 4.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recent Recharge',
                      style: kSubLabelTextStyle,
                    ),
                    loginResource != null ? Text(
                      '${loginResource.resource.last_recharge_time}',
                      style: kSubValueTextStyle,
                    ): Text(''),
                  ],
                ),

              ],
            ),
          ),
        ),
        Card(
          margin:
          EdgeInsets.only(top: 0.0, bottom: 16.0, left: 8.0, right: 8.0),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8.0),
    ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(

              children: [
                Align(
                  alignment: Alignment.topLeft,

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Recharge',
                      style: TextStyle(
                          fontFamily: 'Lato',
                          color: kColorAccentRed,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Wrap(

                  children: [
                    if(loginResource != null )
                      RechargeWidget(
                      rechargeType: 'Coupon',
                      image: AssetImage('assets/images/ic_coupon_icon.png'),
                      loginId:'${loginResource.resource.location_id}',)
                    else Container(width: 0, height: 0),

                    if (loginResource != null && loginResource.resource.pg_enable_hdfc == 'Y') RechargeWidget(
                      rechargeType: 'HDFC',
                      image: AssetImage('assets/images/ic_hdfc.png',),
                      loginResource: loginResource,
                    ) else Container(width: 0, height: 0),
                    if (loginResource != null && loginResource.resource.pg_enable_paytm == 'Y') RechargeWidget(
                      rechargeType: 'Paytm',
                      image: AssetImage('assets/images/ic_paytm.png'),
                        url: loginResource.resource.paytmMobileUrl + loginResource.resource.location_id,
                    ) else Container(width: 0, height: 0,),
                    if (loginResource != null && loginResource.resource.pg_enable_mobikwik == 'Y') RechargeWidget(
                      rechargeType: 'Mobikwik',
                      image: AssetImage('assets/images/ic_mobikwik.png'),
                        url: loginResource.resource.mobikwik_mobile_url + loginResource.resource.location_id,
                    ) else Container(width: 0, height: 0),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          margin:
          EdgeInsets.only(top: 0.0, bottom: 16.0, left: 4.0, right: 4.0),
          height: 348,
          child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top:24.0),
                      child: Text(
                        'Recharge History',
                        style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        color: kColorPrimary),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      height: 320.0,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: RechargeHistoryView(),
                      ),
                    ),
                  ],
                ),
              )),
        )
      ],
    ));
  }

  Widget rechargeTab() {
    return ListTile(
      leading: Container(
        width: 90.0,
        child: TextField(
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
              hintText: 'Enter Amount...',
              hintStyle:
                  TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold)),
        ),
      ),
      title: Column(
        children: <Widget>[
          ListTile(
            title: const Text('Grid'),
            leading: Radio(
              value: SingingCharacter.grid,
              groupValue: _character,
              onChanged: (SingingCharacter value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('DG'),
            leading: Radio(
              value: SingingCharacter.dg,
              groupValue: _character,
              onChanged: (SingingCharacter value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
        ],
      ),
      trailing: RoundedButtonRecharge(
        text: 'Pay',
        press: () {
          showBottomSheet(
              context: context,
              elevation: 5.0,
              backgroundColor: Colors.transparent,
              builder: (builder) {
                return Container(
                    margin: EdgeInsets.only(top: 2.0, left: 8.0, right: 8.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          //background color of box
                          BoxShadow(
                            color: kColorPrimaryDark,
                          ),
                        ],
                        borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(12.0),
                            topRight: const Radius.circular(12.0))),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 48, vertical: 24),
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            width: 72.0,
                            height: 2.0,
                            color: Colors.blueGrey.shade100,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              var icon;
                              var title;
                              if (index == 0) {
                                icon = Image.asset(
                                  'assets/images/ic_hdfc.png',
                                  height: 24.0,
                                  width: 24.0,
                                );
                                title = Text(
                                  'HDFC',
                                  style: kLabelTextStyle,
                                );
                              } else if (index == 1) {
                                icon = Image.asset(
                                  'assets/images/ic_paytm.png',
                                  height: 24.0,
                                  width: 24.0,
                                );
                                title = Text(
                                  'PAYTM',
                                  style: kLabelTextStyle,
                                );
                              } else {
                                icon = Image.asset(
                                  'assets/images/ic_mobikwik.png',
                                  height: 24.0,
                                  width: 24.0,
                                );
                                title = Text(
                                  'MOBIKWIK',
                                  style: kLabelTextStyle,
                                );
                              }
                              return Card(
                                elevation: 2.0,
                                child: ListTile(
                                  leading: icon,
                                  title: Center(
                                    child: title,
                                  ),
                                  trailing: Icon(
                                    Icons.arrow_forward_ios,
                                    color: kColorAccentGreen,
                                  ),
                                  onTap: () {
                                    var url;
                                    if (index == 0) {
                                      url =
                                          'https://netbanking.hdfcbank.com/netbanking/';
                                    } else if (index == 1) {
                                      url = 'https://paytm.com/';
                                    } else {
                                      url = 'https://www.mobikwik.com/';
                                    }
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) {
                                            return RechargeProgressDialog(
                                                url: url);
                                          },
                                          fullscreenDialog: true),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ));
              });
        },
        color: kColorPrimary,
        textColor: Colors.white,
        width: 72.0,
        height: 72.0,
      ),
    );
  }

  Widget rechargeTabCoupon() {
    return ListTile(
      leading: Container(
        width: 150.0,
        child: TextField(
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            hintText: 'Enter Coupon...',
          ),
        ),
      ),
      title: Column(
        children: <Widget>[
          ListTile(
            title: const Text('Grid'),
            leading: Radio(
              value: SingingCharacter.grid,
              groupValue: _character,
              onChanged: (SingingCharacter value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('DG'),
            leading: Radio(
              value: SingingCharacter.dg,
              groupValue: _character,
              onChanged: (SingingCharacter value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
        ],
      ),
      trailing: RoundedButtonRecharge(
        text: 'Submit',
        press: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => RechargeDialog(
              title: "Success",
              description:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
              buttonText: "Okay",
            ),
          );
        },
        color: kColorPrimary,
        textColor: Colors.white,
        width: 72.0,
        height: 72.0,
      ),
    );
  }
}

class RechargeWidget extends StatelessWidget {
  const RechargeWidget({
    Key key,
    this.rechargeType,
    this.image, this.url, this.loginId, this.loginResource,
  }) : super(key: key);

  final String rechargeType;
  final AssetImage image;
  final String url;
  final String loginId;
  final LoginResource loginResource;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(rechargeType != 'Coupon' && rechargeType != 'HDFC') {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) {
                  return RechargeProgressDialog(
                      url: url);
                },
                fullscreenDialog: true),
          );
        }else if(rechargeType == 'Coupon'){
          Navigator.of(context).push(MaterialPageRoute<Null>(
              builder: (BuildContext context) {
                return CouponRechargeView(loginId: loginId);
              },
              fullscreenDialog: true));
          /*Navigator.of(context)
              .pushReplacementNamed(CouponRechargeView.id,
              arguments:ScreenArguments(loginId: loginId));*/
        }else{
          Navigator.of(context).push(MaterialPageRoute<Null>(
              builder: (BuildContext context) {
                return HDFCRechargeView(loginResource: loginResource);
              },
              fullscreenDialog: true));
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 48.0,
              width: 48.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: kColorPrimaryDark, width: 2.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 24,
                  backgroundImage: image,
                  backgroundColor: Colors.transparent,
                ),
              ),
            ),
            Text(
              rechargeType,
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }
}
