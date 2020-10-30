import 'package:flutter/material.dart';
import 'package:xeniusapp/business_logic/enum/viewstate.dart';
import 'package:xeniusapp/business_logic/viewmodels/notice_viewmodel.dart';
import 'package:xeniusapp/constants.dart';
import 'package:xeniusapp/ui/view/base_view.dart';

class NoticeDialog extends StatefulWidget {
  @override
  _NoticeDialogState createState() => _NoticeDialogState();
}

class _NoticeDialogState extends State<NoticeDialog> {
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
          "Notice",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: kColorPrimary,
        elevation: 2,
      ),
      body: Lists(),
    );
  }
}

class Lists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<NoticeViewModel>(
      onModelReady: (model) => model.getNotice(),
      builder: (context, value, child) => value.state == ViewState.Busy
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          itemCount: value.noticeResponse.count + 1,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 16,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 16.0,
                ),
                child: value.noticeResponse.count != 0 ?Text(
                  'Notice',
                  style: kLabelTextStyle,
                ):Center(child: Text('Empty')),
              ),
            );
          }),
    );
  }
}
