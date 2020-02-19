import 'package:sotally_tober/model/app_state.dart';
import 'package:sotally_tober/redux/actions/auth.dart';


AppState setApiUrlReducer(AppState state, SetApiUrl action){
  return state.copyWith(apiUrl: action.apiUrl);
}

AppState registerSuccessReducer(AppState state, RegisterSuccess action){
  return state.copyWith();
}

AppState registerFailedReducer(AppState state, RegisterFailed action){
  return state.copyWith(error:action.error);
}



AppState loginSuccessReducer(AppState state, LoginSuccess action){
  return state.copyWith(userDetails: action.userData,isLogin:true);
}

AppState loginFailedReducer(AppState state, LoginFailed action){
  return state.copyWith(error:action.error,isLogin:false);
}