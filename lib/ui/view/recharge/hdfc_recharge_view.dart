

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:xeniusapp/business_logic/enum/viewstate.dart';
import 'package:xeniusapp/business_logic/models/login_resource.dart';
import 'package:xeniusapp/business_logic/viewmodels/coupon_recaharge_viewmodel.dart';
import 'package:xeniusapp/business_logic/viewmodels/login_viewmodel.dart';
import 'package:xeniusapp/constants.dart';
import 'package:xeniusapp/ui/view/base_view.dart';
import 'package:xeniusapp/ui/view/fortgot_password/screen_arguments.dart';
import 'package:xeniusapp/ui/view/recharge/recharge_status_dialog.dart';

class HDFCRechargeView extends StatefulWidget {
  static const String id = 'coupon_recharge_view';

  HDFCRechargeView({this.loginResource});

  final LoginResource loginResource;
  @override
  _HDFCRechargeViewState createState() => _HDFCRechargeViewState();
}

class _HDFCRechargeViewState extends State<HDFCRechargeView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();



  final TextEditingController rechargeAmount = TextEditingController();


  bool _progressIndicator = false;
  bool _errorText = false;

  String buttonText = 'Proceed';

  double totalAmount = 0.00 ;
  
  @override
  void initState() {
    rechargeAmount.addListener(changesOnField);
    super.initState();
  }

  changesOnField(){
    setState(() {
      totalAmount = double.parse(rechargeAmount.text) +
          double.parse(widget.loginResource.resource.recharge_transitional_charge) +
          double.parse(widget.loginResource.resource.recharge_tax);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Online Recharge',
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
              Text('${widget.loginResource.resource.location_id}', style: kValueTextStyle,),
              SizedBox(height: 16.0,),
              Align(
                alignment: Alignment.center,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: rechargeAmount,
                  decoration: InputDecoration(
                    hintText: 'Enter Amount',
                    suffixIcon: _errorText ? Icon(Icons.error, color: Colors.redAccent,): null,
                    hintStyle: TextStyle(color: Colors.blueGrey),

                    ),
                  ),
                ),
              SizedBox(height: 12.0,),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                margin: EdgeInsets.only(top: 0.0, bottom: 4.0, left: 0.0, right: 4.0),
                color: Colors.white,
                clipBehavior: Clip.antiAlias,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Transaction Charges',
                            style: kLabelTextStyle,
                          ),

                          Text(
                            '${widget.loginResource.resource.recharge_transitional_charge}',
                            style: kValueTextStyle
                          ),
                        ],
                      ),
                      SizedBox(height: 12.0),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${widget.loginResource.resource.recharge_transitional_name}',
                              style: kLabelTextStyle,
                            )
                            ,
                            Text(
                              '${widget.loginResource.resource.recharge_tax}',
                              style: kValueTextStyle,),

                          ],
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Grand Total',
                              style: TextStyle(color: kColorSecondary, fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                            totalAmount != null?Container(
                              width: 128,
                              margin: EdgeInsets.only(left:12.0),
                              child: Text(
                                '$totalAmount',
                                maxLines:3,
                                textAlign: TextAlign.end,

                                style: TextStyle(color: kColorSecondary, fontSize: 20.0, fontWeight: FontWeight.bold),
                              ),
                            ):Text('$totalAmount'),
                          ],
                        ),
                      ),
                    ],
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
                          if(rechargeAmount.text.isNotEmpty) {
                            setState(() {
                              _progressIndicator = true;
                              _errorText = false;
                            });
                          }}),
                  ),
                  Positioned(child: _progressIndicator?
                  SpinKitFadingCircle(size: 48, color: Colors.white,)
                      :Container()),
                ],
              ),


            ],

          ),
        ),

    );
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
