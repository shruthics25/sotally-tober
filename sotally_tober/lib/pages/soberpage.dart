import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:sotally_tober/model/app_state.dart';
import 'package:sotally_tober/model/viewModel.dart';
import 'package:sotally_tober/styles/commonStyle.dart';

class SoberPagePage extends StatefulWidget {
  @override
  _SoberPageWidgetState createState() => _SoberPageWidgetState();
}

class _SoberPageWidgetState extends State<SoberPagePage> {
    final _commonStyle = CommonStyle();

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
                        SizedBox(height: 10),
                        Center(
                            child: Text(
                                "You're Sober !! Go enjoy .. ",
                                style: _commonStyle.headerstyle)),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(height: 5),
                        Center(
                            child: Image(
                          image: AssetImage('assets/images/sober.jpg'),
                          height: 300,
                        )),
                      ]))
                ])));
  }
}
