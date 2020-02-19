import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux_persist/redux_persist.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:sotally_tober/model/app_state.dart';
import 'package:sotally_tober/redux/reducers/combineReducer.dart';
import 'package:sotally_tober/app.dart';

void main() async {
 WidgetsFlutterBinding.ensureInitialized();
  
  final persistor = Persistor<AppState>(
    storage: FlutterStorage(),
    serializer: JsonSerializer<AppState>(AppState.fromJSON)
  );

  final initialState = await persistor.load();

  final store = Store<AppState>(
    appStateReducer,
    initialState: initialState,
    middleware: [persistor.createMiddleware(), thunkMiddleware, new LoggingMiddleware.printer()]
  );

  return runApp(App(
    store: store
  ));


}
