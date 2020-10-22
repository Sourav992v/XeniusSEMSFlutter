import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:xeniusapp/business_logic/models/resource.dart';
import 'package:xeniusapp/business_logic/viewmodels/home_viewmodel.dart';
import 'package:xeniusapp/constants.dart';
import 'package:xeniusapp/locator.dart';
import 'package:xeniusapp/ui/view/base_view.dart';

class TodayConsumption extends StatefulWidget {
  static const String id = 'TodayConsumption';

  @override
  _TodayConsumptionState createState() => _TodayConsumptionState();
}

class _TodayConsumptionState extends State<TodayConsumption> {
  HomeViewModel model = locator<HomeViewModel>();
  Resource resource;

  @override
  void initState() {
    model.getLoginResource().then((value) {
      if (!model.disposed) {
        setState(() {
          resource = value.body.resource;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
        onModelReady: (model) => model.getLoginResource(),
        builder: (context, value, child) => resource != null
            ? Container(
                margin: EdgeInsets.all(4.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  color: Colors.white24,
                  elevation: 5.0,
                  child: Column(
                    children: [
                      TodayConsumptionCard(resource),
                    ],
                  ),
                ),
              )
            : SpinKitFadingCircle(
                color: kColorPrimary,
                size: 24.0,
              ));
  }
}

class TodayConsumptionCard extends StatelessWidget {
  TodayConsumptionCard(this.loginResource);
  final Resource loginResource;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Today Consumption',
                style: kLabelTextStyle,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24.0),
              height: 48.0,
              decoration: BoxDecoration(
                  color: kTextBackgroundGrey,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(32.0))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Grid',
                      style: kSubLabelTextStyle,
                    ),
                    Text(
                      '${loginResource.daily_grid_amount}',
                      style: kValueTextStyle,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24.0),
              height: 48.0,
              decoration: BoxDecoration(
                  color: kTextBackgroundGrey,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(32.0))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'DG',
                      style: kSubLabelTextStyle,
                    ),
                    Text(
                      '${loginResource.daily_dg_amount}',
                      style: kValueTextStyle,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24.0),
              height: 48.0,
              decoration: BoxDecoration(
                  color: kTextBackgroundGrey,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(32.0))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Fixed\nCharges',
                      style: kSubLabelTextStyle,
                    ),
                    Text(
                      '${loginResource.fix_charges}',
                      style: kValueTextStyle,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            totalBalance(loginResource),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                'Values in INR',
                style: kSubValueTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget totalBalance(Resource loginResource) {
  double total = loginResource.daily_grid_amount +
      loginResource.daily_dg_amount +
      loginResource.fix_charges;
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 24.0),
    height: 48.0,
    decoration: BoxDecoration(
        color: kTextBackgroundGrey,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(32.0))),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Total',
            style: kSubLabelTextStyle,
          ),
          Text(
            '$total',
            style: kValueTextStyle,
          ),
        ],
      ),
    ),
  );
}
