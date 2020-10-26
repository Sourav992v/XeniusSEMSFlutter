import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:intl/intl.dart';
import 'package:xeniusapp/business_logic/models/comparative/comparative_report.dart';
import 'package:xeniusapp/business_logic/viewmodels/comparative_report_viewmodel.dart';
import 'package:xeniusapp/constants.dart';
import 'package:xeniusapp/locator.dart';
import 'package:xeniusapp/ui/view/base_view.dart';

class ComparativeReportView extends StatefulWidget {
  static const String id = 'comparative_report_view';

  @override
  _ComparativeReportViewState createState() => _ComparativeReportViewState();
}

class _ComparativeReportViewState extends State<ComparativeReportView> {
  ComparativeReportViewModel comparativeReportViewModel =
      locator<ComparativeReportViewModel>();

  ComparativeReport comparativeReport;

  String dateString =
      DateFormat('yyyy-MMM-dd').format(DateTime.now().toLocal());
  int day = DateTime.now().toLocal().day;
  int month = DateTime.now().toLocal().month;
  int year = DateTime.now().toLocal().year;

  @override
  void initState() {
    initDailyChart(year, month);
    super.initState();
  }

  void initDailyChart(int year, int month) {
    comparativeReportViewModel
        .getComparativeReportResponse(year, month)
        .then((value) {
      setState(() {
        comparativeReport = value.body;
      });
    });
  }

  List<charts.Series<Comparative, String>> _createSampleData(int index) {
    final gridUnitColor = charts.ColorUtil.fromDartColor(kChartGridUnit);
    final gridAmountColor = charts.ColorUtil.fromDartColor(kChartGridAmount);
    final dgUnitColor = charts.ColorUtil.fromDartColor(kChartDGUnit);
    final dgAmountColor = charts.ColorUtil.fromDartColor(kChartDGAMount);

    List<Comparative> assessmentData = [];

    assessmentData.add(new Comparative(
        label: 'Grid kWh',
        value: double.parse(comparativeReport.resource.current_grid_unit)));
    assessmentData.add(new Comparative(
        label: 'Grid INR', value: comparativeReport.resource.current_grid_amt));
    assessmentData.add(new Comparative(
        label: 'DG kWh',
        value: double.parse(comparativeReport.resource.current_dg_unit)));
    assessmentData.add(new Comparative(
        label: 'DG INR', value: comparativeReport.resource.current_dg_amt));

    List<Comparative> assessmentDataPrev = [];

    assessmentDataPrev.add(new Comparative(
        label: 'Grid kWh',
        value: double.parse(comparativeReport.resource.previous_grid_unit)));
    assessmentDataPrev.add(new Comparative(
        label: 'Grid INR',
        value: comparativeReport.resource.previous_grid_amt));
    assessmentDataPrev.add(new Comparative(
        label: 'DG kWh',
        value: double.parse(comparativeReport.resource.previous_dg_unit)));
    assessmentDataPrev.add(new Comparative(
        label: 'DG INR', value: comparativeReport.resource.previous_dg_amt));

    if (index == 0) {
      return [
        charts.Series(
          id: 'Comparative Report',
          data: assessmentData,
          domainFn: (Comparative monthlyReport, _) => monthlyReport.label,
          measureFn: (Comparative monthlyReport, _) => monthlyReport.value,
          labelAccessorFn: (Comparative monthlyReport, _) =>
              '${monthlyReport.value}',
          colorFn: (Comparative assessment, _) {
            switch (assessment.label) {
              case 'Grid kWh':
                {
                  return gridUnitColor;
                }

              case 'Grid INR':
                {
                  return gridAmountColor;
                }

              case 'DG kWh':
                {
                  return dgUnitColor;
                }

              case 'DG INR':
                {
                  return dgAmountColor;
                }

              default:
                {
                  return dgUnitColor;
                }
            }
          },
        ),
      ];
    } else {
      return [
        charts.Series(
          id: 'Comparative Report',
          data: assessmentDataPrev,
          domainFn: (Comparative monthlyReport, _) => monthlyReport.label,
          measureFn: (Comparative monthlyReport, _) => monthlyReport.value,
          labelAccessorFn: (Comparative monthlyReport, _) =>
              '${monthlyReport.value}',
          colorFn: (Comparative assessment, _) {
            switch (assessment.label) {
              case 'Grid kWh':
                {
                  return gridUnitColor;
                }

              case 'Grid INR':
                {
                  return gridAmountColor;
                }

              case 'DG kWh':
                {
                  return dgUnitColor;
                }

              case 'DG INR':
                {
                  return dgAmountColor;
                }

              default:
                {
                  return dgUnitColor;
                }
            }
          },
        ),
      ];
    }
  }

  _selectedDate(BuildContext context) async {
    DateTime selectedDate = DateTime.now();
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2018),
        lastDate: DateTime(2025));
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        dateString = DateFormat('yyyy-MMM-dd').format(pickedDate);
      });
    }
  }

  _cupertinoDatePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          DateTime selectedDate = DateTime.now();
          return Container(
            height: MediaQuery.of(context).copyWith().size.height / 3,
            color: Colors.white,
            child: Container(
              decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(10.0),
                      topRight: const Radius.circular(10.0))),
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (pickedDate) {
                  if (pickedDate != null && pickedDate != selectedDate) {
                    setState(() {
                      dateString = DateFormat('yyyy-MMM-dd').format(pickedDate);
                      month = pickedDate.month;
                      year = pickedDate.year;
                    });
                    initDailyChart(year, month);
                  }
                },
                initialDateTime: selectedDate,
                minimumYear: 2020,
                maximumYear: 2025,
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          title: Text(
            'Comparative',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16.0),
          ),
          centerTitle: true,
        ),
        body: BaseView<ComparativeReportViewModel>(
            builder: (context, value, child) {
          if (comparativeReport != null) {
            return Stack(children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
                child: SizedBox(
                  height: double.infinity,
                  child: ListView.builder(
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        if (comparativeReport.resource != null) {
                          return Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                            margin: EdgeInsets.only(
                                top: 16.0, bottom: 16.0, left: 4.0, right: 4.0),
                            color: Colors.white,
                            shadowColor: Colors.white54,
                            elevation: 16.0,
                            child: ListTile(
                              title: Padding(
                                padding:
                                    const EdgeInsets.only(top: 16.0, bottom: 0),
                                child: index == 0
                                    ? Text(
                                        comparativeReport
                                            .resource.current_month,
                                        style: kLabelTextStyle,
                                        textAlign: TextAlign.center,
                                      )
                                    : Text(
                                        comparativeReport
                                            .resource.previous_month,
                                        style: kLabelTextStyle,
                                        textAlign: TextAlign.center,
                                      ),
                              ),
                              subtitle: Container(
                                height: 300,
                                child: charts.BarChart(
                                  _createSampleData(index),
                                  animate: true,
                                  vertical: true,
                                  barRendererDecorator:
                                      new charts.BarLabelDecorator<String>(),

                                  primaryMeasureAxis:
                                      new charts.NumericAxisSpec(
                                    showAxisLine: true,
                                    renderSpec: charts.GridlineRendererSpec(
                                      labelStyle: new charts.TextStyleSpec(
                                        fontSize: 12,
                                        color: charts.MaterialPalette.black,
                                      ),
                                    ),
                                  ),

                                  /// This is an OrdinalAxisSpec to match up with BarChart's default
                                  /// ordinal domain axis (use NumericAxisSpec or DateTimeAxisSpec for
                                  /// other charts).
                                  domainAxis: new charts.OrdinalAxisSpec(
                                    renderSpec: charts.GridlineRendererSpec(
                                      labelStyle: new charts.TextStyleSpec(
                                        fontSize: 12,
                                        color: charts.MaterialPalette.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        } else
                          return Container(
                            child: Center(child: Text('Loading..')),
                          );
                      }),
                ),
              ),
              Positioned(
                  top: 25.0, right: 25.0, child: datePickerDaily(context)),
            ]);
          } else
            return Container(
              child: Center(child: Text('Loading..')),
            );
        }));
  }

  Container datePickerDaily(BuildContext context) {
    return Container(
      color: Colors.white70,
      child: GestureDetector(
        onTap: () {
          _cupertinoDatePicker(context);
        },
        child: Container(
            height: 72.0,
            width: 48.0,
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  height: 24.0,
                  width: 32.0,
                  color: Colors.white,
                  child: Center(child: Text('$dateString'.split('-')[2])),
                ),
                Container(
                  height: 24.0,
                  width: 48.0,
                  color: Colors.blueAccent,
                  child: Center(
                      child: Text(
                    '$dateString'.split('-')[1],
                    style: TextStyle(color: Colors.white),
                  )),
                ),
                Container(
                  height: 24.0,
                  width: 48.0,
                  color: Colors.white,
                  child: Center(
                      child: Text(
                    '$dateString'.split('-')[0],
                    style: TextStyle(color: Colors.black),
                  )),
                )
              ],
            )),
      ),
    );
  }
}

/// Sample linear data type.
class Comparative {
  final String label;
  final double value;

  Comparative({this.label, this.value});
}
