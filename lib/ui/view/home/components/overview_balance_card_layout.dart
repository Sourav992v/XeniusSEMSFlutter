import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:xeniusapp/business_logic/models/resource.dart';
import 'package:xeniusapp/business_logic/viewmodels/home_viewmodel.dart';
import 'package:xeniusapp/constants.dart';
import 'package:xeniusapp/locator.dart';
import 'package:xeniusapp/ui/view/base_view.dart';

class OverviewBalance extends StatefulWidget {
  static const String id = 'OverviewBalance';

  @override
  _OverviewBalanceState createState() => _OverviewBalanceState();
}

class _OverviewBalanceState extends State<OverviewBalance> {
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
  void dispose() {
    model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      builder: (context, value, child) {
        return Container(
          child: resource == null
              ? Center(
                  child: SpinKitFadingCircle(
                    color: kColorPrimaryDark,
                    size: 24.0,
                  ),
                )
              : Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  margin: EdgeInsets.all(12.0),
                  color: Colors.white24,
                  elevation: 5.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      BalanceCard(resource),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GridBalanceCard(resource),
                            SizedBox(
                              height: 8.0,
                            ),
                            DGBalanceCard(resource),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}

class BalanceCard extends StatelessWidget {
  BalanceCard(this.resource);
  final Resource resource;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 96.0,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        margin: EdgeInsets.only(top: 0.0, bottom: 4.0),
        color: kColorAccentRed,
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
                  Text(
                    'Available Balance',
                    style: TextStyle(color: Colors.white, fontSize: 14.0,fontWeight: FontWeight.normal),
                  ),
                  SizedBox(height: 2.0,),
                  Text(
                    'INR ${resource.balance_amount}',
                    style: TextStyle(color: Colors.white, fontSize: 16.0,fontWeight: FontWeight.bold),
                  ),
              SizedBox(height: 4.0,),

              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Updated on:',
                      style: TextStyle(color: Colors.white, fontSize: 12.0,fontWeight: FontWeight.normal),
                    ),

                    Text(
                      '${resource.last_reading_updated}',
                      style: TextStyle(color: Colors.white, fontSize: 14.0,fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class GridBalanceCard extends StatelessWidget {
  GridBalanceCard(this.resource);
  final Resource resource;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        margin: EdgeInsets.only(top: 0.0, bottom: 4.0, left: 0.0, right: 4.0),
        color: Colors.white,
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Grid',
                    style: TextStyle(
                      color: kColorPrimary,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  resource.energy_source == 'GRID'
                      ? SpinKitDoubleBounce(
                          color: kColorPrimary,
                          size: 24.0,
                        )
                      : Container(),
                ],
              ),
              SizedBox(height: 12.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    resource.energy_source == 'GRID'
                        ? Text(
                            'Start Time',
                            style: kSubLabelTextStyle,
                          )
                        : Text(
                            'Off',
                            style: kSubLabelTextStyle,
                          ),
                    resource.energy_source == 'GRID'
                        ? Text(
                            '${resource.last_reading_updated}',
                            style: kSubValueTextStyle,
                          )
                        : Text(
                            ''
                          ),
                  ],
                ),
              ),
              SizedBox(height: 8.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Consumption',
                      style: kSubLabelTextStyle,
                    ),
                    Text(
                      '${resource.grid_reading} ${resource.reading_unit}',
                      style: kSubValueTextStyle,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sanctioned Load',
                      style: kSubLabelTextStyle,
                    ),
                    Text(
                      '${resource.grid_sanctioned_load} ${resource.load_unit}',
                      style: kSubValueTextStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DGBalanceCard extends StatelessWidget {
  const DGBalanceCard(this.resource);
  final Resource resource;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        margin: EdgeInsets.only(top: 0.0, bottom: 4.0, left: 0.0, right: 0.0),
        color: Colors.white,
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'DG',
                    style: TextStyle(
                      color: kColorAccentRed,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  resource.energy_source == 'DG'
                      ? SpinKitDoubleBounce(
                          color: kColorAccentRed,
                          size: 24.0,
                        )
                      : Text(''),
                ],
              ),
              SizedBox(height: 12.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    resource.energy_source == 'DG'
                        ? Text(
                            'Start Time',
                            style: kSubLabelTextStyle,
                          )
                        : Text('Off', style: kSubLabelTextStyle),
                    resource.energy_source == 'DG'
                        ? Text(
                            '${resource.dg_last_reading_updated}',
                            style: kSubValueTextStyle,
                          )
                        : Text(''),
                  ],
                ),
              ),
              SizedBox(height: 8.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Consumption',
                      style: kSubLabelTextStyle,
                    ),
                    Text(
                      '${resource.dg_reading} ${resource.reading_unit}',
                      style: kSubValueTextStyle,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sanctioned Load',
                      style: kSubLabelTextStyle,
                    ),
                    Text(
                      '${resource.dg_sanctioned_load} ${resource.load_unit}',
                      style: kSubValueTextStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
