import 'package:redux/redux.dart';
import 'package:sotally_tober/model/app_state.dart';
import 'package:sotally_tober/redux/reducers/auth.dart';
import 'package:sotally_tober/redux/actions/auth.dart';





AppState appStateReducer(AppState state, action) {
  return sotallyTober(state, action);
}


Reducer<AppState> sotallyTober = combineReducers<AppState>([
  TypedReducer<AppState, SetApiUrl>(setApiUrlReducer),
  TypedReducer<AppState, RegisterFailed>(registerFailedReducer),
  TypedReducer<AppState, RegisterSuccess>(registerSuccessReducer),
  TypedReducer<AppState, LoginFailed>(loginFailedReducer),
  TypedReducer<AppState, LoginSuccess>(loginSuccessReducer)
]);