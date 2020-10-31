import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:xeniusapp/business_logic/enum/viewstate.dart';
import 'package:xeniusapp/business_logic/models/recharge_history/recharge_history_response.dart';
import 'package:xeniusapp/business_logic/viewmodels/recharge_history_viewmodel.dart';
import 'package:xeniusapp/constants.dart';
import 'package:xeniusapp/ui/view/base_view.dart';



class RechargeHistoryView extends StatefulWidget {
  @override
  _RechargeHistoryViewState createState() => _RechargeHistoryViewState();
}

class _RechargeHistoryViewState extends State<RechargeHistoryView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<RechargeHistoryViewModel>(
        onModelReady:(model) => model.getRechargeHistory(),
        builder: (context, value, child) => value.state == ViewState.Busy ?
        Center(child: SpinKitCircle(color: kColorPrimary,))
        :Container(
      margin: EdgeInsets.only(bottom: 24),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: value.rechargeHistoryResponse.resource.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(left: 8.0,right: 8.0),
              child: value.rechargeHistoryResponse ==null?Container(width:0.0, height: 0.0,): Card(
                  child: RechargeListItem(
                index: index,
                icon: Icon(Icons.account_balance_wallet,),
                rechargeHistoryResponse: value.rechargeHistoryResponse,
                amount: 'INR 34566',
                transactionId: 'RDS13456782',
                date: 'Dec 28',
              )),
            );
          }),
    ));
  }
}

class _RechargeDescription extends StatelessWidget {
  _RechargeDescription({
    Key key,
    this.amount,
    this.transactionId,
    this.date,
  }) : super(key: key);

  final String amount;

  final String transactionId;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '$amount',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                '$transactionId',
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black87,
                ),
              ),
              Text(
                '$date',
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class RechargeListItem extends StatelessWidget {
  RechargeListItem({
    Key key,
    this.index,
    this.icon,
    this.amount,
    this.transactionId,
    this.date, this.rechargeHistoryResponse,
  }) : super(key: key);

  final RechargeHistoryResponse rechargeHistoryResponse;
  final int index;
  final Icon icon;
  final String amount;

  final String transactionId;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: 60,

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: _rechargeImage(rechargeHistoryResponse, index),
              ),
            ),
            Expanded(
              child: rechargeHistoryResponse != null?Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
                child: _RechargeDescription(
                  amount: '${rechargeHistoryResponse.resource[index].amount}',
                  transactionId: '${rechargeHistoryResponse.resource[index].coupon_id}',
                  date: '${rechargeHistoryResponse.resource[index].recharge_time}',
                ),
              ):_RechargeDescription(
                amount: 'Amount',
                transactionId: 'Transaction Id',
                date: 'DD-MM-YYYY',
              ),
            )
          ],
        ),
      ),
    );
  }

  Image _rechargeImage(RechargeHistoryResponse rechargeHistoryResponse, int index){
    if(rechargeHistoryResponse != null){
      if(rechargeHistoryResponse.resource[index].mode == 'XE-MAIN'){
        return Image.asset('assets/images/ic_coupon_icon.png');
      }else if(rechargeHistoryResponse.resource[index].mode == 'HDFC'){
        return Image.asset('assets/images/ic_hdfc.png');
      }else if(rechargeHistoryResponse.resource[index].mode == 'PAYTM'){
        return Image.asset('assets/images/ic_paytm.png');
      }if(rechargeHistoryResponse.resource[index].mode == 'MOBIKWIK'){
        return Image.asset('assets/images/ic_mobikwik.png');
      }
    }
    return Image.asset('assets/images/ic_coupon_icon.png');

  }
}

