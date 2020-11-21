import 'dart:math';

import 'package:charts_flutter/flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:xeniusapp/business_logic/models/daily_report.dart';
import 'package:xeniusapp/business_logic/viewmodels/daily_report_viewmodel.dart';
import 'package:xeniusapp/constants.dart';
import 'package:xeniusapp/locator.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/src/painting/text_style.dart' as textStyle;
import 'package:flutter/src/painting/basic_types.dart' as axis;


// ignore: implementation_imports
import 'package:charts_flutter/src/text_style.dart' as style;
import 'package:charts_flutter/src/text_element.dart' as textElement;
import 'package:xeniusapp/ui/view/base_view.dart';

class DailyReportView extends StatefulWidget {
  static const String id = 'daily_report_view';

  @override
  _DailyReportViewState createState() => _DailyReportViewState();
}

class _DailyReportViewState extends State<DailyReportView> {
  DailyReportViewModel dailyReportViewModel = locator<DailyReportViewModel>();

  DailyReport dailyReportResponse;

  String dateString =
      DateFormat('yyyy-MMM-dd').format(DateTime.now().toLocal());
  int day = DateTime.now().toLocal().day;
  int month = DateTime.now().toLocal().month;
  int year = DateTime.now().toLocal().year;
  bool _disposed = false;

  static String pointerValueG;
  static String pointerValueD;

  @override
  void initState() {
    initDailyChart(year, month);
    super.initState();
  }
  @override
  void dispose() {
    _disposed= true;
    super.dispose();
  }

  void initDailyChart(int year, int month) {
    dailyReportViewModel.getDailyReportResource(year, month).then((value) {
      setState(() {
        if(!_disposed) {
          dailyReportResponse = value.body;
        }
      });
    });
  }

  List<charts.Series<ChartData, DateTime>> _createSampleData(int index) {
    final gridUnitColor = charts.ColorUtil.fromDartColor(kChartGridUnit);
    final gridAmountColor = charts.ColorUtil.fromDartColor(kChartGridAmount);
    final dgUnitColor = charts.ColorUtil.fromDartColor(kChartDGUnit);
    final dgAmountColor = charts.ColorUtil.fromDartColor(kChartDGAMount);

    List<ChartData> chartDataGridUnit = List();
    List<ChartData> chartDataDgUnit = List();
    List<ChartData> chartDataGridAmt = List();
    List<ChartData> chartDataDgAmt = List();

    for (int i = dailyReportResponse.resource.length - 1; i >= 0; i--) {
      chartDataGridUnit.add(ChartData(
          DateTime(year, month,
              int.parse(dailyReportResponse.resource[i].date.split('-')[2])),
          double.parse(dailyReportResponse.resource[i].grid_unit)));
      chartDataDgUnit.add(ChartData(
          DateTime(year, month,
              int.parse(dailyReportResponse.resource[i].date.split('-')[2])),
          double.parse(dailyReportResponse.resource[i].dg_unit)));

      chartDataGridAmt.add(ChartData(
          DateTime(year, month,
              int.parse(dailyReportResponse.resource[i].date.split('-')[2])),
          dailyReportResponse.resource[i].grid_amt));
      chartDataDgAmt.add(ChartData(
          DateTime(year, month,
              int.parse(dailyReportResponse.resource[i].date.split('-')[2])),
          dailyReportResponse.resource[i].dg_amt));
    }

    if (index == 0) {
      return [
        charts.Series<ChartData, DateTime>(
          id: 'Grid kWh',
          colorFn: (_, __) => gridUnitColor,
          domainFn: (ChartData date, _) => date.date,
          measureFn: (ChartData value, _) => value.value,
          data: chartDataGridUnit,
          labelAccessorFn: (ChartData value, _) => '${value.value.toString()}',
        ),
        charts.Series<ChartData, DateTime>(
            id: 'DG kWh',
            colorFn: (_, __) => dgUnitColor,
            domainFn: (ChartData date, _) => date.date,
            measureFn: (ChartData value, _) => value.value,
            data: chartDataDgUnit,
            labelAccessorFn: (ChartData value, _) =>
                '${value.value.toString()}'),
      ];
    } else {
      return [
        charts.Series<ChartData, DateTime>(
            id: 'Grid INR',
            colorFn: (_, __) => gridAmountColor,
            domainFn: (ChartData date, _) => date.date,
            measureFn: (ChartData value, _) => value.value,
            data: chartDataGridAmt,
            labelAccessorFn: (ChartData value, _) =>
                '${value.value.toString()}'),
        charts.Series<ChartData, DateTime>(
            id: 'DG INR',
            colorFn: (_, __) => dgAmountColor,
            domainFn: (ChartData date, _) => date.date,
            measureFn: (ChartData value, _) => value.value,
            data: chartDataDgAmt,
            labelAccessorFn: (ChartData value, _) =>
                '${value.value.toString()}'),
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
                      day = pickedDate.day;
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
            'Daily Report',
            style: textStyle.TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: BaseView<DailyReportViewModel>(builder: (context, value, child) {
          return Stack(children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
              child: SizedBox(
                height: double.infinity,
                child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      if (dailyReportResponse != null &&
                          dailyReportResponse.resource != null) {
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
                              child: Center(
                                  child: Text(
                                '$dateString'.split('-')[1],
                                style: kLabelTextStyle,
                              )),
                            ),
                            subtitle: SingleChildScrollView(
                              scrollDirection: axis.Axis.horizontal,
                              child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 300,
                                  child: charts.TimeSeriesChart(
                                    _createSampleData(index),
                                    animate: true,
                                    defaultRenderer: charts.LineRendererConfig(
                                      includePoints: true,
                                      includeArea: true,
                                      stacked: false,
                                      includeLine: true,

                                    ),
                                    behaviors: [
                                      charts.SlidingViewport(),
                                      charts.PanAndZoomBehavior(),
                                      charts.LinePointHighlighter(
                                        symbolRenderer: CustomCircleSymbolRenderer(),
                                          showHorizontalFollowLine: charts
                                              .LinePointHighlighterFollowLineType
                                              .all,
                                          showVerticalFollowLine: charts
                                              .LinePointHighlighterFollowLineType
                                              .nearest),

                                      charts.SelectNearest(
                                          eventTrigger: charts
                                              .SelectionTrigger.tapAndDrag),
                                      charts.SeriesLegend(
                                        position:
                                            charts.BehaviorPosition.bottom,
                                        desiredMaxRows: 2,
                                        horizontalFirst: false,
                                        insideJustification: InsideJustification.topStart ,
                                        cellPadding: new EdgeInsets.only(
                                            right: 4.0,
                                            bottom: 4.0,
                                            left: 164.0,
                                            top: 4.0),
                                        showMeasures: true,
                                        outsideJustification: charts
                                            .OutsideJustification
                                            .middleDrawArea,
                                        measureFormatter: (num value) {
                                          return value == null ? '-' : '$value';
                                        },
                                      ),
                                    ],
                                    selectionModels: [

                                      SelectionModelConfig(
                                          changedListener: (SelectionModel model) {
                                            if (model.hasDatumSelection) {


                                              pointerValueG =
                                                  "${model.selectedSeries[0].displayName}:\n" + model.selectedSeries[0]
                                                      .measureFn(
                                                      model.selectedDatum[0]
                                                          .index).toString();

                                            }
                                          }
                                      ),

                                    ],
                                    domainAxis: new charts.DateTimeAxisSpec(
                                        showAxisLine: true,
                                        tickFormatterSpec: new charts
                                                .AutoDateTimeTickFormatterSpec(
                                            day: new charts.TimeFormatterSpec(
                                          format: 'dd MMM',
                                          transitionFormat: 'dd MMM',
                                        ))),
                                  )),
                            ),
                          ),
                        );
                      } else
                        return Container(
                            child: Center(child: Text('Loading..')));
                    }),
              ),
            ),
            Positioned(top: 25.0, right: 25.0, child: datePickerDaily(context)),
          ]);
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
                    style: textStyle.TextStyle(color: Colors.white),
                  )),
                ),
                Container(
                  height: 24.0,
                  width: 48.0,
                  color: Colors.white,
                  child: Center(
                      child: Text(
                    '$dateString'.split('-')[0],
                    style: textStyle.TextStyle(color: Colors.black),
                  )),
                )
              ],
            )),
      ),
    );
  }
}

/// Sample linear data type.
class ChartData {
  final DateTime date;
  final double value;

  ChartData(this.date, this.value);
}

class CustomCircleSymbolRenderer extends charts.CircleSymbolRenderer{


  @override
  void paint(ChartCanvas canvas, Rectangle<num> bounds,
      {List<int> dashPattern,
      Color fillColor,
      FillPatternType fillPattern,
      Color strokeColor,
      double strokeWidthPx}) {

    super.paint(canvas, bounds, dashPattern: dashPattern, fillColor: fillColor,
        strokeColor: strokeColor, strokeWidthPx: strokeWidthPx);

    var textStyle = style.TextStyle();
    textStyle.color = Color.black;
    textStyle.fontSize = 16;
    canvas.drawText(textElement.TextElement('${_DailyReportViewState.pointerValueG}',style: textStyle),
        (bounds.left).round(), 90);
  }


}



String _title;

String _subTitle;

class ToolTipMgr {

  static String get title => _title;

  static String get subTitle => _subTitle;

  static setTitle(Map<String, dynamic> data) {
    if (data['title'] != null && data['title'].length > 0) {
      _title = data['title'];
    }

    if (data['subTitle'] != null && data['subTitle'].length > 0) {
      _subTitle = data['subTitle'];
    }
  }

}
