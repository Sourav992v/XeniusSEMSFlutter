import 'package:flutter/material.dart';
import 'package:xeniusapp/business_logic/enum/viewstate.dart';

class BaseViewModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;
  bool disposed = false;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    if (disposed) return;
    _state = viewState;
    notifyListeners();
  }

  @override
  void dispose() {
    disposed = true;
    super.dispose();
  }
}
