import 'package:redux/redux.dart';
import 'package:sotally_tober/model/app_state.dart';

class ViewModel {
  final AppState appState;

  ViewModel(
      {this.appState});

  factory ViewModel.create(Store<AppState> store) {
  

    return ViewModel(
        appState: store.state
        );
  }
}
