import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:sotally_tober/model/app_state.dart';
import 'package:sotally_tober/model/viewModel.dart';
import 'package:sotally_tober/styles/commonStyle.dart';

class AlertPagePage extends StatefulWidget {
  @override
  _AlertPageWidgetState createState() => _AlertPageWidgetState();
}

class _AlertPageWidgetState extends State<AlertPagePage> {
  final _commonStyle = CommonStyle();
  onpressed() {
    Navigator.of(context).pushNamedAndRemoveUntil(
          '/login', (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StoreConnector<AppState, ViewModel>(
            converter: (Store<AppState> store) => ViewModel.create(store),
            builder: (BuildContext context, ViewModel viewModel) =>
                Stack(children: <Widget>[
                  Container(
                      decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/container.png"),
                      fit: BoxFit.cover,
                    ),
                  )),
                  SingleChildScrollView(
                      padding: EdgeInsets.all(25.0),
                      child: Column(children: <Widget>[
                        SizedBox(height: 20),
                        Center(
                            child: Text("You're not Sober!!!",
                                style: _commonStyle.headerstyle)),
                        SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: Text("DO NOT TEXT,EMAIL OR DRIVE!!!",
                              style: _commonStyle.headerstyle),
                        ),
                        SizedBox(height: 55),
                        Center(
                            child: Image(
                          image: AssetImage('assets/images/alert.jpg'),
                          height: 300,
                        )),
                        SizedBox(
                          height: 15,
                        ),
                        viewModel.appState.isLogin != true ?  ButtonTheme(
                            minWidth: 500.0,
                            height: 50.0,
                            child: RaisedButton(
                              onPressed: () => onpressed(),
                              child: Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: Text("Login/register")),
                              color: Colors.orange,
                              textColor: Colors.white,
                            )) : Text("Thank YOU!!",style: _commonStyle.headerstyle,)
                      ]))
                ])));
  }
}
