import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:sotally_tober/redux/actions/auth.dart';
import 'package:sotally_tober/model/app_state.dart';

class ViewModel {
  final AppState appState;
  final Function(Map, BuildContext) userlogin;
  final Function(Map, BuildContext) register;

  ViewModel(
      {this.appState,this.userlogin,this.register});

  factory ViewModel.create(Store<AppState> store) {

    _userlogin(Map payload, BuildContext context) {
      store.dispatch(login(payload, context));
    }

   

    _registering(Map payload, BuildContext context) {
      store.dispatch(registerUser(payload, context));
    }
  

    return ViewModel(
        appState: store.state,
        userlogin:_userlogin,
        register:_registering
        );
  }
}
