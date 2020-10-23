import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mp_chart/mp/chart/pie_chart.dart';
import 'package:mp_chart/mp/controller/pie_chart_controller.dart';

import 'package:mp_chart/mp/core/animator.dart';

import 'package:mp_chart/mp/core/data/pie_data.dart';
import 'package:mp_chart/mp/core/data_set/pie_data_set.dart';
import 'package:mp_chart/mp/core/description.dart';
import 'package:mp_chart/mp/core/entry/pie_entry.dart';

import 'package:mp_chart/mp/core/enums/legend_horizontal_alignment.dart';
import 'package:mp_chart/mp/core/enums/legend_orientation.dart';
import 'package:mp_chart/mp/core/enums/legend_vertical_alignment.dart';
import 'package:mp_chart/mp/core/enums/value_position.dart';

import 'package:mp_chart/mp/core/render/pie_chart_renderer.dart';
import 'package:mp_chart/mp/core/utils/color_utils.dart';
import 'package:mp_chart/mp/core/value_formatter/percent_formatter.dart';
import 'package:xeniusapp/business_logic/models/resource.dart';
import 'package:xeniusapp/business_logic/viewmodels/home_viewmodel.dart';
import 'package:xeniusapp/constants.dart';
import 'package:xeniusapp/locator.dart';
import 'package:xeniusapp/ui/view/base_view.dart';

List<String> pieChartListText = ['Today', 'Month'];

class PiechartRecyclerView extends StatefulWidget {
  @override
  _PiechartRecyclerViewState createState() => _PiechartRecyclerViewState();
}

class _PiechartRecyclerViewState extends State<PiechartRecyclerView> {
  List<PieChartController> _pieChartController = List();

  HomeViewModel model = locator<HomeViewModel>();

  Resource resourceEntity;

  @override
  void initState() {
    model.getLoginResource().then((value) {
      if (!model.disposed) {
        setState(() {
          resourceEntity = value.body.resource;
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
    return BaseView<HomeViewModel>(builder: (context, value, child) {
      if (resourceEntity == null) {
        return Center(
          child: SpinKitFadingCircle(
            color: kColorPrimaryDark,
            size: 24.0,
          ),
        );
      } else {
        return SizedBox(
          height: 480,
          width: 1000,
          child: ListView.builder(
            controller: ScrollController(),
            physics: NeverScrollableScrollPhysics(),
            itemCount: 2,
            itemBuilder: (context, index) {
              return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                margin: EdgeInsets.only(
                    top: 4.0, bottom: 4.0, left: 16.0, right: 16.0),
                color: Colors.white,
                shadowColor: Colors.white70,
                elevation: 16.0,
                child: ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 0),
                    child: Center(
                        child: Text(
                      '${pieChartListText[index]}',
                      style: kLabelTextStyle,
                    )),
                  ),
                  subtitle: _initPieChart(index, pieChartListText.length),
                ),
              );
            },
          ),
        );
      }
    });
  }

  void _initController(int size) async {
    _pieChartController.clear();
    var desc = Description()..enabled = false;
    for (int i = 0; i <= size; i++) {
      _pieChartController.add(PieChartController(
          legendSettingFunction: (legend, controller) {
            _formatter.setPieChartPainter(controller);
            legend
              ..verticalAlignment = (LegendVerticalAlignment.BOTTOM)
              ..horizontalAlignment = (LegendHorizontalAlignment.LEFT)
              ..orientation = (LegendOrientation.VERTICAL)
              ..drawInside = (true)
              ..enabled = (true);
          },
          rendererSettingFunction: (renderer) {
            (renderer as PieChartRenderer)
              ..setHoleColor(ColorUtils.WHITE)
              ..setHoleColor(ColorUtils.WHITE)
              ..setTransparentCircleColor(ColorUtils.WHITE)
              ..setTransparentCircleAlpha(110);
          },
          rotateEnabled: true,
          rotationAngle: 90,
          drawHole: false,
          drawCenterText: false,
          extraLeftOffset: 90,
          extraTopOffset: 0,
          extraRightOffset: 10,
          extraBottomOffset: 0,
          drawEntryLabels: false,
          usePercentValues: false,
          centerText: "value lines",
          highLightPerTapEnabled: true,
          description: desc));
    }
  }

  PercentFormatter _formatter = PercentFormatter();

  void _initPieData(int index) {
    var type = index == 0 ? 'Today' : 'Month';

    _pieChartController[index].data = generatePieData(type);
  }

  PieData generatePieData(var type) {
    var gridUnit = "Grid " + resourceEntity.reading_unit;
    var dgUnit = "DG " + resourceEntity.reading_unit;
    var gridValue = resourceEntity.daily_grid_unit;
    var dgValue = resourceEntity.daily_dg_unit;

    var gridValueMonth = resourceEntity.monthly_grid_unit;
    var dgValueMonth = resourceEntity.monthly_dg_unit;

    List<PieEntry> entries = List();
    List<PieEntry> pieEntriesMonth = List();

    entries.add(PieEntry(
      value: double.parse(gridValue),
      label: '$gridUnit',
    ));
    entries.add(PieEntry(
      value: dgValue,
      label: '$dgUnit',
    ));

    pieEntriesMonth.add(PieEntry(
      value: double.parse(gridValueMonth),
      label: '$gridUnit',
    ));
    pieEntriesMonth.add(PieEntry(
      value: dgValueMonth,
      label: '$dgUnit',
    ));

    Map<String, List<PieEntry>> pieEntries = HashMap();
    pieEntries.putIfAbsent('Today', () => entries);
    pieEntries.putIfAbsent('Month', () => pieEntriesMonth);

    PieDataSet dataSet = PieDataSet(pieEntries[type], "");
    dataSet.setSliceSpace(3);
    dataSet.setSelectionShift(5);

    // add a lot of colors
    List<Color> colors = List();
    colors.add(kColorPrimary);
    colors.add(kColorAccentRed);

    dataSet.setColors1(colors);
    dataSet.setSelectionShift(0);

    dataSet.setValueLinePart1OffsetPercentage(80.0);
    dataSet.setValueLinePart1Length(0.8);
    dataSet.setValueLinePart2Length(0.8);
    dataSet.setUsingSliceColorAsValueLineColor(true);

    dataSet.setYValuePosition(ValuePosition.OUTSIDE_SLICE);

    PieData pieData = PieData(dataSet);
    return pieData;
  }

  Widget _initPieChart(int index, int size) {
    _initController(size);
    _initPieData(index);

    var pieChart = PieChart(_pieChartController[index]);
    _pieChartController[index].animator
      ..reset()
      ..animateY2(1400, Easing.EaseInOutQuad);
    return Container(height: 190, child: pieChart);
  }
}
