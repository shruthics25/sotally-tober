import 'package:flutter/material.dart';

import 'package:sotally_tober/model/viewModel.dart';
import 'package:sotally_tober/styles/commonStyle.dart';
import 'package:sotally_tober/sharedFunctions/validators.dart';
import 'package:sotally_tober/sharedWidgets/textFormField.dart';
import 'package:sotally_tober/sharedWidgets/buttonContainer.dart';

class LoginFormWidget extends StatefulWidget {
  @override
  _LoginFormWidgetState createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final _commonStyle = CommonStyle();
  final _validators = Validators();
  final _formKey = GlobalKey<FormState>();
  final _emailcontroller = new TextEditingController();
  final _passwordcontroller = new TextEditingController();
  final _textWidget = new TextFormFieldWidget();
  final _buttonWidget = new ButtonWidget();
  final _viewModel = ViewModel();

  login() {
    if (_formKey.currentState.validate()) {
      print(_viewModel);
    }
  }

  register(context) {
    Navigator.pushNamed(context, "/register");
  }

  dashboard(context){
     Navigator.of(context)
            .pushNamedAndRemoveUntil('/dashboard', (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    final _emailField = _textWidget.getTextWidget(
        validate: _validators.emailValidation,
        textcontroller: _emailcontroller,
        icon: Icons.email,
        hintText: "Email");

    final _passwordField = _textWidget.getTextWidget(
        validate: _validators.alphaNumericValidator,
        textcontroller: _passwordcontroller,
        icon: Icons.lock,
        hintText: "Password");

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(height: 60),
          _emailField,
          SizedBox(height: 20),
          _passwordField,
          SizedBox(height: 20),
          _buttonWidget.getButtonWidget(onpressed: login, hintText: "LOGIN"),
          SizedBox(height: 40),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Text(
              "New User? ",
              style: _commonStyle.headerstyle,
            ),
            GestureDetector(
                child: Text("Register", style: _commonStyle.headerstyle),
                onTap: () => register(context))
          ])
        ],
      ),
    );
  }
}
