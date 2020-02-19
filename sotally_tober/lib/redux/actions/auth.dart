import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import "../../model/app_state.dart";
import 'package:sotally_tober/redux/actions/loadConfig.dart';
import 'package:fluttertoast/fluttertoast.dart';


class SetApiUrl {
  final String apiUrl;
  SetApiUrl(this.apiUrl);
}

class RegisterSuccess {
  final Map userData;
  RegisterSuccess(this.userData);
}

class RegisterFailed {
  final String error;
  RegisterFailed(this.error);
}

class CheckUserSuccess {
  final Map userData;
  CheckUserSuccess(this.userData);
}

class CheckUserFailed {
  final String error;
  CheckUserFailed(this.error);
}

class LoginSuccess {
  final Map userData;
  LoginSuccess(this.userData);
}

class LoginFailed {
  final String error;
  LoginFailed(this.error);
}

ThunkAction<AppState> registerUser(payload, context) {
  return (Store<AppState> store) async {
    String uri = await loadBaseURL();
    Dio dio = Dio();
    await dio.post('$uri/register', data: payload).then((res) {
      //------- Handling All request ---------- //
      if (res.data['statusCode'] == 200) {
        store.dispatch(RegisterSuccess(res.data['reult']));
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
      } else {
        Fluttertoast.showToast(
            msg: res.data['message'],
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 2,
            fontSize: 16.0);
        store.dispatch(RegisterFailed(res.data['message']));
      }
    }).catchError((onError) {
      store.dispatch(RegisterFailed("Error While registering"));
    });
  };
}



ThunkAction<AppState> login(payload, context) {
  return (Store<AppState> store) async {
    String uri = await loadBaseURL();
    Dio dio = Dio();
    await dio.post('$uri/login', data: payload).then((res) {
      //------- Handling All request ---------- //
       print(res);
      if (res.data['statusCode'] == 200) {
        store.dispatch(LoginSuccess(res.data['result']));
        Navigator.of(context).pushNamedAndRemoveUntil(
            '/dashboard', (Route<dynamic> route) => false);
      } else {
        Fluttertoast.showToast(
            msg: res.data['message'],
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 2,
            fontSize: 16.0);
        store.dispatch(LoginFailed(res.data['message']));
      }
    }).catchError((onError) {
      store.dispatch(LoginFailed("Error While registering"));
    });
  };
}