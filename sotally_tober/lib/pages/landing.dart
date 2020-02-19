import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:sotally_tober/model/app_state.dart';
import 'package:sotally_tober/model/viewModel.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingWidgetState createState() => _LandingWidgetState();
}

class _LandingWidgetState extends State<LandingPage> {
  nextPage(model) {
    // Navigator.of(context).pushNamedAndRemoveUntil(
    //       '/dashboard', (Route<dynamic> route) => false);
    if (model.appState.isLogin != true) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          '/login', (Route<dynamic> route) => false);
    } else {
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/dashboard', (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: StoreConnector<AppState, ViewModel>(
      converter: (Store<AppState> store) => ViewModel.create(store),
      builder: (BuildContext context, ViewModel viewModel) => Stack(
        children: <Widget>[
          Center(
            child: new Image.asset(
              'assets/images/logo.jpg',
              width: size.width,
              height: size.height,
              fit: BoxFit.fill,
            ),
          ),
          Positioned.fill(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RaisedButton(
                    onPressed: () => nextPage(viewModel),
                    child: Padding(
                        padding: EdgeInsets.all(10.0), child: Text("Go")),
                    color: Colors.orange,
                    textColor: Colors.white,
                  )))
        ],
      ),
    ));
  }
}
