import 'package:redux/redux.dart';
import 'package:sotally_tober/model/app_state.dart';





AppState appStateReducer(AppState state, action) {
  return sotallyTober(state, action);
}


Reducer<AppState> sotallyTober = combineReducers<AppState>([]);