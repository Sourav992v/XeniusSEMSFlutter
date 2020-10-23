import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'package:xeniusapp/business_logic/models/monthly_report.dart/monthly_report.dart';
import 'package:xeniusapp/business_logic/viewmodels/monthly_report_viewmodel.dart';
import 'package:xeniusapp/locator.dart';
import 'package:xeniusapp/ui/view/base_view.dart';
import 'package:xeniusapp/ui/view/report/monthly_report/bar_chart_list_view.dart';
import 'package:xeniusapp/ui/view/report/monthly_report/list_item.dart';

class MonthlyReportView extends StatefulWidget {
  static const String id = 'monthly_report_view';
  @override
  _MonthlyReportViewState createState() => _MonthlyReportViewState();
}

class _MonthlyReportViewState extends State<MonthlyReportView> {
  String dateString = DateFormat('yyyy-MMM').format(DateTime.now().toLocal());
  int year = DateTime.now().toLocal().year;
  int month = DateTime.now().toLocal().month;

  MonthlyReportViewModel _viewModel = locator<MonthlyReportViewModel>();

  List<String> dateStringValue = [];
  MonthlyReport monthlyReport;

  @override
  void initState() {
    initMonthlyChart(year);
    super.initState();
  }

  void initMonthlyChart(int year) {
    _viewModel.getMonthlyReportResponse(year).then((value) {
      setState(() {
        monthlyReport = value.body;
      });
    });
  }

  void _date(int month, int year) {
    for (int i = month; i > 0; i--) {
      dateStringValue.add('$i $year');
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
        dateString = DateFormat('yyyy-MMM').format(pickedDate);
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
                      dateString = DateFormat('yyyy-MMM').format(pickedDate);
                      month = pickedDate.toLocal().month;
                      year = pickedDate.toLocal().year;
                      _date(month, year);
                    });
                    initMonthlyChart(year);
                  }
                },
                initialDateTime: selectedDate,
                minimumYear: 2018,
                maximumYear: 2025,
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white70,
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
            'Monthly Report',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16.0),
          ),
          centerTitle: true,
        ),
        body:
            BaseView<MonthlyReportViewModel>(builder: (context, value, child) {
          if (monthlyReport != null) {
            return Stack(children: [
              BarChartListView(
                  items: List<ListItem>.generate(
                      monthlyReport.resource.length,
                      (i) =>
                          HeadingItem(monthlyReport: monthlyReport, index: i))),
              Positioned(
                  top: 25.0, right: 25.0, child: datePickerDaily(context)),
            ]);
          } else {
            return Container(
              child: Center(child: Text('Loading..')),
            );
          }
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
            height: 48.0,
            width: 48.0,
            color: Colors.white,
            child: Column(
              children: [
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

class MonthlyResponse {}
