import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:xeniusapp/business_logic/models/login_resource.dart';
import 'package:xeniusapp/business_logic/services/authentication_service.dart';
import 'package:xeniusapp/business_logic/viewmodels/login_viewmodel.dart';
import 'package:xeniusapp/business_logic/viewmodels/power_control_viewmodel.dart';


import 'package:xeniusapp/constants.dart';
import 'package:xeniusapp/locator.dart';
import 'package:xeniusapp/ui/view/profile/status_dialog.dart';

import 'package:xeniusapp/ui/view/util/change_password_view.dart';

class UserProfileDialog extends StatefulWidget {
  @override
  _UserProfileDialogState createState() => _UserProfileDialogState();
}

class _UserProfileDialogState extends State<UserProfileDialog> {
  bool isExpanded = false;
  LoginResource loginResource;
  LoginViewModel model = locator<LoginViewModel>();
  PowerViewModel powerViewModel = locator<PowerViewModel>();

  bool _disposed = false;
  @override
  void initState() {
    model.login().then((value) {
      setState(() {
        if(!_disposed) {
          loginResource = value.body;
        }
      });
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
    return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: kColorPrimary,
              elevation: 0,
              leading: GestureDetector(
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  }),
              title: Text(
                'User Profile',
                style: TextStyle(color: Colors.white),
              ),
            ),
            body: loginResource == null ? SpinKitFadingCircle(size: 24, color: kColorPrimary,) :CustomScrollView(
              slivers: [
                SliverPersistentHeader(
                  delegate: ProfileSliverAppBar(expandedHeight: 96.0),
                  pinned: true,
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                     Container(
                      margin: EdgeInsets.symmetric(horizontal: 24.0,),
                      child: Card(
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Padding(
                          padding: const EdgeInsets.only(top:8.0, bottom: 8.0, left: 48, right: 48),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 72.0, bottom: 8.0),
                                child: Text(
                                  '${loginResource.resource.consumer_name}',
                                  maxLines: 2,
                                  style: kLabelTextStyle,
                                ),
                              ),
                              ListTile(
                                leading: Image.asset(
                                  'assets/images/identification.png',
                                  height: 24.0,
                                  width: 24.0,
                                ),
                                title: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    '${loginResource.resource.location_id}',
                                    maxLines: 2,
                                  ),
                                ),
                              ),
                              ListTile(
                                leading: Icon(
                                  Icons.home,
                                  color: kColorPrimary,
                                ),
                                title: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    '${loginResource.resource.site_address}',
                                    maxLines: 2,
                                  ),
                                ),
                              ),
                              ListTile(
                                leading: Icon(
                                  Icons.call,
                                  color: kColorPrimary,
                                ),
                                title: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text('${loginResource.resource.consumer_mobile_no}'),
                                ),
                              ),
                              ListTile(
                                leading: Icon(
                                  Icons.email,
                                  color: kColorPrimary,
                                ),
                                title: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    '${loginResource.resource.consumer_email_id}',
                                    maxLines: 3,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin:
                      EdgeInsets.only(left: 24.0, right: 24.0, bottom: 16.0),
                      child: Card(
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 48.0),
                              child: ExpansionTile(
                                onExpansionChanged: (value) {
                                  setState(() {
                                    isExpanded = value;
                                  });
                                },
                                leading: Icon(
                                  Icons.settings_remote,
                                  color: Colors.greenAccent[400],
                                ),
                                title: Text(
                                  'Power Control',
                                  style: kLabelTextStyle,
                                  textAlign: TextAlign.center,
                                ),
                                trailing: isExpanded
                                    ? Image.asset(
                                  'assets/images/ic_arrow_up.png',
                                  height: 24.0,
                                  width: 24.0,
                                )
                                    : Image.asset(
                                  'assets/images/ic_arrow_down.png',
                                  height: 24.0,
                                  width: 24.0,
                                ),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 64),
                                    child: ListTile(
                                      title: Text('Meter Restore'),
                                      trailing: Icon(
                                        Icons.restore,
                                        color: Colors.greenAccent[400],
                                      ),
                                      onTap: () async{
                                        var response = await powerViewModel.getPowerControl('restore');
                                        if(response.body.rc == 0){
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) => StatusDialog(
                                              title: 'Success',
                                              description:
                                              '${response.body.message}',
                                              buttonText: "Okay",
                                            ),
                                          );
                                        }else{
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) => StatusDialog(
                                              title: 'Error',
                                              description:
                                              '${response.body.message}',
                                              buttonText: "Okay",
                                            ),
                                          );
                                        }
                                        
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 64.0),
                                    child: ListTile(
                                      title: Text('Verify Balance'),
                                      trailing: Icon(
                                        Icons.check_box,
                                        color: Colors.greenAccent[400],
                                      ),
                                      onTap: () async {
                                        var response = await powerViewModel
                                            .getPowerControl('validate_balance');
                                        if (response.body.rc == 0) {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                StatusDialog(
                                                  title: 'Success',
                                                  description:
                                                  '${response.body.message}',
                                                  buttonText: "Okay",
                                                ),
                                          );
                                        } else {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                StatusDialog(
                                                  title: 'Error',
                                                  description:
                                                  '${response.body.message}',
                                                  buttonText: "Okay",
                                                ),
                                          );
                                        }
                                      } ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin:
                      EdgeInsets.only(left: 24.0, right: 24.0, bottom: 16.0),
                      child: Card(
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 48.0),
                              child: ExpansionTile(
                                onExpansionChanged: (value) {
                                  setState(() {
                                    isExpanded = value;
                                  });
                                },
                                leading: Image.asset(
                                  'assets/images/ic_support.png',
                                  height: 24.0,
                                  width: 24.0,
                                ),
                                title: Text(
                                  'Help & Support',
                                  style: kLabelTextStyle,
                                  textAlign: TextAlign.center,
                                ),
                                trailing: isExpanded
                                    ? Image.asset(
                                  'assets/images/ic_up_arrow.png',
                                  height: 24.0,
                                  width: 24.0,
                                )
                                    : Image.asset(
                                  'assets/images/ic_down_arrow.png',
                                  height: 24.0,
                                  width: 24.0,
                                ),
                                children: [
                                  ListTile(
                                    title: Text(
                                      'Facility Support Team',
                                      style: kLabelTextStyle,
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Text(
                                      '${loginResource.resource.site_support_concern_name}',
                                      style: kSubLabelTextStyle,
                                    ),
                                  ),
                                  ListTile(
                                    leading: Icon(
                                      Icons.call,
                                      color: kColorPrimaryDark,
                                    ),
                                    title: Text('${loginResource.resource.site_support_contact_no}'),
                                  ),
                                  ListTile(
                                    leading: Icon(
                                      Icons.email,
                                      color: kColorPrimaryDark,
                                    ),
                                    title: Text('${loginResource.resource.site_support_email_id}'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4.0),
                                    child: ListTile(
                                      title: Text(
                                        'Radius Support Team',
                                        style: kLabelTextStyle,
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Text(
                                      '${loginResource.resource.site_supervisor_name}',
                                      style: kSubLabelTextStyle,
                                    ),
                                  ),
                                  ListTile(
                                    leading: Icon(
                                      Icons.call,
                                      color: kColorPrimaryDark,
                                    ),
                                    title: Text('${loginResource.resource.site_supervisor_contact_no}'),
                                  ),
                                  ListTile(
                                    leading: Icon(
                                      Icons.email,
                                      color: kColorPrimaryDark,
                                    ),
                                    title: Text('${loginResource.resource.site_supervisor_email_id}'),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin:
                      EdgeInsets.only(left: 24.0, right: 24.0, bottom: 16.0),
                      child: Card(
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Container(
                          margin: EdgeInsets.only(left: 48.0, right: 48),
                          child: ListTile(
                            leading: Image.asset(
                              'assets/images/ic_change_password.png',
                              height: 24.0,
                              width: 24.0,
                            ),
                            title: Text(
                              'Change Password',
                              style: kLabelTextStyle,
                              textAlign: TextAlign.center,
                            ),
                            trailing: Icon(
                              Icons.arrow_right,
                              color: Colors.greenAccent,
                            ),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) {
                                      return ChangePassword();
                                    },
                                    fullscreenDialog: true),
                              );
                            },
                          ),
                        ),
                      ),
                    )
                  ]),
                )
              ],
            ),

    );
  }
}

class ProfileSliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  ProfileSliverAppBar({@required this.expandedHeight});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        AppBar(
          backgroundColor: kColorPrimary,
          elevation: 0,
          leading: Container(),
        ),
        Positioned(
            top: expandedHeight * 0.05 - shrinkOffset,

            left: MediaQuery.of(context).size.width / 4,
            child: Opacity(
              opacity: (1 - shrinkOffset / expandedHeight),
              child: Container(
                height: expandedHeight * 2,
                width: MediaQuery.of(context).size.width / 2,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Container(
                    margin: EdgeInsets.all(16),
                    height: 48.0,
                    width: 48.0,
                    decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: kColorPrimaryDark, width: 2.0),
                  ),
                  child: CircleAvatar(
                    radius: 16,
                    backgroundImage: AssetImage('assets/images/ic_person_menu.png'),
                    backgroundColor: Colors.transparent,
                  ),
                  ),
                ),
              ),
            )),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 0.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}

