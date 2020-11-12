import 'dart:isolate';

import 'dart:ui';
import 'dart:async';
import 'dart:io';

import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xeniusapp/business_logic/models/current_applicable_rates/current_applicable_resource.dart';
import 'package:xeniusapp/business_logic/models/login_resource.dart';
import 'package:xeniusapp/business_logic/models/resource.dart';
import 'package:xeniusapp/business_logic/viewmodels/current_tariff_viewmodel.dart';
import 'package:xeniusapp/business_logic/viewmodels/home_viewmodel.dart';
import 'package:xeniusapp/constants.dart';
import 'package:xeniusapp/locator.dart';

import 'Entity/monthly_bill_entity.dart';
import 'comparative_report_view.dart';
import 'daily_report_view.dart';
import 'monthly_report/monthly_report_view.dart';

import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';

const debug = true;

class ReportView extends StatefulWidget {
  static const String id = 'ReportView';

  @override
  _ReportViewState createState() => _ReportViewState();
}

class _ReportViewState extends State<ReportView> {
  bool _disposed = false;

  HomeViewModel model = locator<HomeViewModel>();
  CurrentTariffViewModel currentTariffViewModel =
      locator<CurrentTariffViewModel>();

  BuiltList<CurrentApplicableResource> currentApplicableResource;
  LoginResource resource;

  @override
  void initState() {
    model.getLoginResource().then((value) {
      if (!_disposed) {
        setState(() {
          resource = value.body;
        });
      }
    });

    currentTariffViewModel.getCurrentTariff().then((value) {
      if (!_disposed) {
        setState(() {
          currentApplicableResource = value.body.resource;
        });
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: ReportViewCard(
          currentApplicable: currentApplicableResource,
          resource: resource,
          platform: platform,
        ),
      ),
    );
  }
}

class ReportViewCard extends StatefulWidget {
  final BuiltList<CurrentApplicableResource> currentApplicable;
  final LoginResource resource;

  final TargetPlatform platform;

  const ReportViewCard(
      {Key key, this.currentApplicable, this.resource, this.platform})
      : super(key: key);

  @override
  _ReportViewCardState createState() => _ReportViewCardState();
}

class _ReportViewCardState extends State<ReportViewCard> {
  List<_TaskInfo> _tasks;
  List<String> _items;
  bool _isLoading;
  bool _permissionReady;
  String _localPath;
  ReceivePort _port = ReceivePort();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<EBillMonthlyEntity> calenderList = [];

  @override
  void initState() {
    super.initState();
    calenderList = [];

    _bindBackgroundIsolate();

    FlutterDownloader.registerCallback(downloadCallback);

    _isLoading = true;
    _permissionReady = false;

    // _prepare();
  }

  @override
  void dispose() {
    _unbindBackgroundIsolate();
    super.dispose();
  }

  void _bindBackgroundIsolate() {
    bool isSuccess = IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');
    if (!isSuccess) {
      _unbindBackgroundIsolate();
      _bindBackgroundIsolate();
      return;
    }
    _port.listen((dynamic data) {
      if (debug) {
        print('UI Isolate Callback: $data');
      }
      String id = data[0];
      DownloadTaskStatus status = data[1];
      int progress = data[2];

      if (_tasks != null && _tasks.isNotEmpty) {
        final task = _tasks.firstWhere((task) => task.taskId == id);
        if (task != null) {
          setState(() {
            task.status = status;
            task.progress = progress;
          });
        }
      }
    });
  }

  void _unbindBackgroundIsolate() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
  }

  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    if (debug) {
      print(
          'Background Isolate Callback: task ($id) is in status ($status) and process ($progress)');
    }
    final SendPort send =
        IsolateNameServer.lookupPortByName('downloader_send_port');
    send.send([id, status, progress]);
  }

  @override
  Widget build(BuildContext context){
    if(calenderList != null){
      calenderList.clear();
    }
    setState(()  {
      int month = DateTime.now().toLocal().month;
      int year = DateTime.now().toLocal().year;
      int noOfMonth = widget.resource != null
          ? int.parse(widget
          .resource.resource.monthly_bill_no_of_month)
          : 0;
      if (noOfMonth != 0) {
        for (int i = 1; i <= noOfMonth; i++) {
          calenderList.add(new EBillMonthlyEntity(
              (month - i).toString(), year.toString()));
        }
      }

    });
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.only(top: 16.0),
              height: 96.0,
              child: Card(
                elevation: 16.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                color: Colors.white,
                margin: EdgeInsets.only(
                    top: 0.0, bottom: 8.0, left: 16.0, right: 16.0),
                child: ListTile(
                  leading: Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 4.0),
                    child: Container(
                        height: 64.0,
                        width: 64.0,
                        child: Image.asset('assets/images/ic_line_chart.png')),
                  ),
                  title: Center(
                    child: Text(
                      'Daily',
                      style: kLabelTextStyle,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, DailyReportView.id);
                  },
                ),
              ),
            ),
            Container(
              height: 96.0,
              child: Card(
                  elevation: 16.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  color: Colors.white,
                  margin: EdgeInsets.only(
                      top: 4.0, bottom: 8.0, left: 16.0, right: 16.0),
                  child: ListTile(
                    leading: Image.asset('assets/images/ic_bar_chart.png'),
                    title: Center(
                      child: Text(
                        'Monthly',
                        style: kLabelTextStyle,
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, MonthlyReportView.id);
                    },
                  )),
            ),
            Container(
              height: 96.0,
              child: Card(
                elevation: 16.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                color: Colors.white,
                margin: EdgeInsets.only(
                    top: 4.0, bottom: 8.0, left: 16.0, right: 16.0),
                child: ListTile(
                  leading:
                      Image.asset('assets/images/ic_bar_comparative_chart.png'),
                  title: Center(
                    child: Text(
                      'Comparative',
                      style: kLabelTextStyle,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, ComparativeReportView.id);
                  },
                ),
              ),
            ),
            Container(
              height: 96.0,
              child: Card(
                elevation: 16.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                color: Colors.white,
                margin: EdgeInsets.only(
                    top: 4.0, bottom: 8.0, left: 16.0, right: 16.0),
                child: ListTile(
                    leading: Image.asset('assets/images/ic_tariff.png'),
                    title: Center(
                      child: Text(
                        'Current Tariff',
                        style: kLabelTextStyle,
                      ),
                    ),
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          elevation: 5.0,
                          backgroundColor: Colors.transparent,
                          builder: (builder) {
                            return Wrap(children: [
                              Container(
                                  margin: EdgeInsets.only(
                                      top: 2.0,
                                      left: 8.0,
                                      right: 8.0,
                                      bottom: 8.0),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        //background color of box
                                        BoxShadow(
                                          color: kColorPrimaryDark,
                                        ),
                                      ],
                                      borderRadius: BorderRadius.only(
                                          topLeft: const Radius.circular(12.0),
                                          topRight:
                                              const Radius.circular(12.0))),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 48, vertical: 24),
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                            horizontal: 8.0,
                                          ),
                                          width: 72.0,
                                          height: 2.0,
                                          color: Colors.blueGrey.shade100,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.3,
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            itemCount:
                                                widget.currentApplicable != null
                                                    ? widget.currentApplicable
                                                        .length
                                                    : 0,
                                            itemBuilder: (context, index) {
                                              return Card(
                                                elevation: 2.0,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              3,
                                                      child: Text(
                                                        '${widget.currentApplicable[index].heading}',
                                                        style: TextStyle(
                                                          color:
                                                              kColorAccentRed,
                                                          fontFamily: 'Lato',
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 24.0,
                                                              right: 24.0),
                                                      child: Container(
                                                        width: 1,
                                                        height: 24.0,
                                                        child: VerticalDivider(
                                                          color:
                                                              kColorAccentRed,
                                                          thickness: 1,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              3,
                                                      child: Text(
                                                          '${widget.currentApplicable[index].content}',
                                                          style:
                                                              kLabelTextStyle,
                                                          maxLines: 5,
                                                          textAlign:
                                                              TextAlign.center),
                                                    )
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                            ]);
                          });
                    }),
              ),
            ),
            widget.resource != null &&
                    widget.resource.resource.monthly_bill_enable == 'Y'
                ? Container(
                    height: 96.0,
                    child: Card(
                      elevation: 16.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      color: Colors.white,
                      margin: EdgeInsets.only(
                          top: 4.0, bottom: 8.0, left: 16.0, right: 16.0),
                      child: ListTile(
                        leading: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Image.asset('assets/images/ic_bill.png'),
                        ),
                        title: Center(
                          child: Text(
                            'Bill Download',
                            style: kLabelTextStyle,
                          ),
                        ),
                        onTap: () async{
                            await _prepare();

                          showModalBottomSheet(
                              context: context,
                              elevation: 5.0,
                              backgroundColor: Colors.transparent,
                              builder: (builder) {
                                return Wrap(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: 2.0,
                                          left: 8.0,
                                          right: 8.0,
                                          bottom: 8.0),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            //background color of box
                                            BoxShadow(
                                              color: kColorPrimaryDark,
                                            ),
                                          ],
                                          borderRadius: BorderRadius.only(
                                              topLeft:
                                                  const Radius.circular(12.0),
                                              topRight:
                                                  const Radius.circular(12.0))),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 48, vertical: 24),
                                            child: Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 8.0,
                                              ),
                                              width: 72.0,
                                              height: 2.0,
                                              color: Colors.blueGrey.shade100,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.3,
                                              child: Builder(
                                                  builder: (context) => _permissionReady
                                                          ? _buildDownloadList()
                                                          : _buildNoPermissionWarning()),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              });
                        },
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  Widget _buildDownloadList() => Container(
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(calenderList.length, (index) {
            return Container(
              margin: EdgeInsets.all(24.0),
              color: Colors.white70,
              child: GestureDetector(
                onTap: () async{
                  _items.length != 0 ? await FlutterDownloader.enqueue(
                      url: '${_items[index]}',
                      savedDir: _localPath,
                      fileName: 'Monthly Bill',
                      showNotification: true,
                      openFileFromNotification: true): print('Empty');
                },
                child: Container(
                    height: 64.0,
                    width: 48.0,
                    color: Colors.white,
                    child: Card(
                      color: Colors.grey,
                      elevation: 16.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 24.0,
                            width: 48.0,
                            color: Colors.blueAccent,
                            child: Center(
                                child: Text(
                              '${calenderList[index].month}',
                              style: TextStyle(color: Colors.white),
                            )),
                          ),
                          Container(
                            height: 24.0,
                            width: 48.0,
                            color: Colors.white,
                            child: Center(
                                child: Text(
                              '${calenderList[index].year}',
                              style: TextStyle(color: Colors.black),
                            )),
                          )
                        ],
                      ),
                    )),
              ),
            );
          }),
        ),
      );

  Widget _buildNoPermissionWarning() => Container(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'Please grant accessing storage permission to continue -_-',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blueGrey, fontSize: 18.0),
                ),
              ),
              SizedBox(
                height: 32.0,
              ),
              FlatButton(
                  onPressed: () {
                    _checkPermission().then((hasGranted) {
                      setState(() {
                        _permissionReady = hasGranted;
                      });
                    });
                  },
                  child: Text(
                    'Retry',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ))
            ],
          ),
        ),
      );

  Future<bool> _openDownloadedFile(_TaskInfo task) {
    return FlutterDownloader.open(taskId: task.taskId);
  }


  Future<bool> _checkPermission() async {
    if (widget.platform == TargetPlatform.android) {
      final status = await Permission.storage.status;
      if (status != PermissionStatus.granted) {
        final result = await Permission.storage.request();
        if (result == PermissionStatus.granted) {
          return true;
        }
      } else {
        return true;
      }
    } else {
      return true;
    }
    return false;
  }

  Future<Null> _prepare() async {
    final tasks = await FlutterDownloader.loadTasks();
    SharedPreferences userPref = await SharedPreferences.getInstance();
    String loginId = userPref.getString('login_id');
    String password = userPref.getString('password');
    int count = 0;

    _items = [];

    String baseUrl =
        'http://myxenius.com/thirdparty/api/report?login_id=$loginId&password=$password';
    setState(() {
      for (int i = 0; i < calenderList.length; i++) {
        _items.add(baseUrl + '&year=${calenderList[i].year}&month=${calenderList[i].month}');
      }

    });

    _permissionReady = await _checkPermission();

    _localPath = (await _findLocalPath()) + Platform.pathSeparator + 'Download';

    final savedDir = Directory(_localPath);
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create();
    }

    setState(() {
      _isLoading = false;
    });
  }

  Future<String> _findLocalPath() async {
    final directory = widget.platform == TargetPlatform.android
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();
    return directory.path;
  }
}

Widget totalBalance(Resource loginResource) {
  double total = loginResource.daily_grid_amount +
      loginResource.daily_dg_amount +
      loginResource.fix_charges;
  return Card(
    elevation: 0.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24.0),
    ),
    color: kTextBackgroundGrey,
    margin: EdgeInsets.only(top: 2.0, bottom: 8.0, left: 16.0, right: 16.0),
    child: ListTile(
      leading: Text(
        'Total',
        style: kSubLabelTextStyle,
      ),
      trailing: Text(
        '$total',
        style: kValueTextStyle,
      ),
    ),
  );
}


class _TaskInfo {
  final String url;

  String taskId;
  int progress = 0;
  DownloadTaskStatus status = DownloadTaskStatus.undefined;

  _TaskInfo({this.url});
}

