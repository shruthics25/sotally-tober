import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:sotally_tober/model/app_state.dart';
import 'package:sotally_tober/model/viewModel.dart';
import 'package:sotally_tober/sharedWidgets/pageContainer.dart';
import 'package:sotally_tober/sharedWidgets/logoContainer.dart';
import 'package:sotally_tober/widgets/loginForm.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginPage> {
  final _pageContainer = PageContainer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoreConnector<AppState, ViewModel>(
        converter: (Store<AppState> store) => ViewModel.create(store),
        builder: (BuildContext context, ViewModel viewModel) => Stack(
            children: <Widget>[
              _pageContainer,
              Center(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      LogoContainer(),
                      SizedBox(
                        height: 20,
                      ),
                      LoginFormWidget()
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
