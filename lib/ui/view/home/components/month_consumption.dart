import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:xeniusapp/business_logic/models/resource.dart';
import 'package:xeniusapp/business_logic/viewmodels/home_viewmodel.dart';
import 'package:xeniusapp/constants.dart';
import 'package:xeniusapp/locator.dart';
import 'package:xeniusapp/ui/view/base_view.dart';

class MonthConsumtion extends StatefulWidget {
  static const String id = 'MonthConsumtion';

  @override
  _MonthConsumtionState createState() => _MonthConsumtionState();
}

class _MonthConsumtionState extends State<MonthConsumtion> {
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
                      MonthConsumptionCard(resource),
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

class MonthConsumptionCard extends StatelessWidget {
  const MonthConsumptionCard(this.monthlyResource);
  final Resource monthlyResource;

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
                'Month Consumption',
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
                      '${monthlyResource.monthly_grid_amount}',
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
                      '${monthlyResource.monthly_dg_amount}',
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
                      'Fixed\nCharges',
                      style: kSubLabelTextStyle,
                    ),
                    Text(
                      '${monthlyResource.fix_charges_monthly}',
                      style: kValueTextStyle,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            monthlyTotalCharges(monthlyResource),
            SizedBox(
              height: 16.0,
            ),
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

  Widget monthlyTotalCharges(Resource monthlyResource) {
    double total = monthlyResource.monthly_grid_amount +
        monthlyResource.monthly_dg_amount +
        monthlyResource.fix_charges_monthly;
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
}
