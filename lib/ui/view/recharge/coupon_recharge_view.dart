

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:xeniusapp/business_logic/enum/viewstate.dart';
import 'package:xeniusapp/business_logic/viewmodels/coupon_recaharge_viewmodel.dart';
import 'package:xeniusapp/constants.dart';
import 'package:xeniusapp/ui/view/base_view.dart';
import 'package:xeniusapp/ui/view/fortgot_password/screen_arguments.dart';
import 'package:xeniusapp/ui/view/recharge/recharge_status_dialog.dart';

class CouponRechargeView extends StatefulWidget {
  static const String id = 'coupon_recharge_view';

  CouponRechargeView({this.loginId});

  final String loginId;
  @override
  _CouponRechargeViewState createState() => _CouponRechargeViewState(loginId);
}

class _CouponRechargeViewState extends State<CouponRechargeView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();



  final TextEditingController couponNumber = TextEditingController();


  bool _progressIndicator = false;
  bool _errorText = false;

  String buttonText = 'Proceed';

  _CouponRechargeViewState(this.loginId);

  final String loginId;
  @override
  Widget build(BuildContext context) {

    return BaseView<CouponRechargeViewModel>(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Coupon Recharge',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: ListView(
            children: [
              Text('Customer ID', style: kLabelTextStyle,),
              SizedBox(height: 4.0,),
              Text('$loginId', style: kValueTextStyle,),
              SizedBox(height: 16.0,),
              Align(
                alignment: Alignment.center,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: couponNumber,
                  decoration: InputDecoration(
                    hintText: 'Enter Coupon',
                    suffixIcon: _errorText ? Icon(Icons.error, color: Colors.redAccent,): null,
                    hintStyle: TextStyle(color: Colors.blueGrey),

                    ),
                  ),
                ),


              SizedBox(height: 24.0,),

              Stack(
                alignment: Alignment.center,
                children: [

                  ButtonTheme(
                    minWidth: MediaQuery.of(context).size.width,
                    child: RaisedButton.icon(
                        padding: EdgeInsets.all(16.0),
                        elevation: 5.0,

                        textColor: Colors.white,
                        color: kColorPrimary,
                        highlightElevation: 16.0,
                        icon: _progressIndicator?Icon(null):Icon(Icons.navigate_next),
                        label: _progressIndicator?Text(''):Text(
                          buttonText,
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () async {
                          FocusScope.of(context).unfocus();
                          if(couponNumber.text.isNotEmpty){
                            setState(() {
                              _progressIndicator = true;
                              _errorText = false;
                            });
                            var response = await model.rechargeCoupon(couponNumber.text.trim());
                            if(model.state == ViewState.Idle){
                              setState(() {
                                _progressIndicator = false;
                                buttonText = 'Please wait ...';
                              });

                              if(response.body.rc == 0){
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) => RechargeDialog(
                                    title: 'Success',
                                    description:
                                    '${response.body.message}',
                                    buttonText: "Okay",
                                  ),
                                );
                              }else{
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) => RechargeDialog(
                                    title: 'Error',
                                    description:
                                    '${response.body.message}',
                                    buttonText: 'Close',
                                  ),
                                );
                                setState(() {
                                  _errorText = true;
                                  _progressIndicator= false;
                                  buttonText = 'Proceed';
                                });

                              }

                            }
                          }else{
                            setState(() {
                              _progressIndicator = false;
                              _errorText = true;
                              snackBar('Invalid Input!');
                            });
                          }

                        }),
                  ),
                  Positioned(child: _progressIndicator?
                  SpinKitFadingCircle(size: 48, color: Colors.white,)
                      :Container()),
                ],
              ),


            ],

          ),
        ),

    ),);
  }

  void snackBar(String text) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(
        text,
        style: TextStyle(
          fontFamily: 'Lato',
          fontWeight: FontWeight.bold,
          fontSize: 14.0,
        ),
      ),
      backgroundColor: kColorPrimaryDark,
    ));
  }
}
