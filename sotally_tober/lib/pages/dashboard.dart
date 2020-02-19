import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:sotally_tober/model/app_state.dart';
import 'package:sotally_tober/model/viewModel.dart';
import 'package:sotally_tober/sharedWidgets/pageContainer.dart';
import 'package:sotally_tober/widgets/alertDontSendEmail.dart';
import 'package:sotally_tober/widgets/complexMathWidget.dart';
import 'package:sotally_tober/widgets/difficultMathWidget.dart';
import 'package:sotally_tober/widgets/readyToSendAnEmail.dart';
import 'package:sotally_tober/widgets/simpleMathWidget.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardWidgetState createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardPage> {
  final _pageContainer = PageContainer();

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
                        viewModel.appState.stage == 0
                            ? SimpleMathWidget(viewModel)
                            : Text(""),
                        viewModel.appState.stage == 1
                            ? ComplexMathWidget(viewModel)
                            : Text(""),
                        viewModel.appState.stage == 2
                            ? DifficultMathWidget(viewModel)
                            : Text(""),
                        viewModel.appState.stage == 3
                            ? ReadyToSendAnEmailWidget(viewModel)
                            : Text(""),
                        viewModel.appState.stage == 4
                            ? AlertDontSendAnEmailWidget(viewModel)
                            : Text("")
                      ]))
                ])));
  }
}
