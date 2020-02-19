import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:sotally_tober/model/app_state.dart';
import 'package:sotally_tober/model/viewModel.dart';
import 'package:sotally_tober/sharedWidgets/pageContainer.dart';
import 'package:sotally_tober/sharedWidgets/logoContainer.dart';
import 'package:sotally_tober/widgets/registerForm.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterWidgetState createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterPage> {
  final _pageContainer = PageContainer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoreConnector<AppState, ViewModel>(
        converter: (Store<AppState> store) => ViewModel.create(store),
        builder: (BuildContext context, ViewModel viewModel) => Scaffold(
          body: Stack(
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
                      RegisterFormWidget(viewModel)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
