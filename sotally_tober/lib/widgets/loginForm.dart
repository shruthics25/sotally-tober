import 'package:flutter/material.dart';

import 'package:sotally_tober/model/viewModel.dart';
import 'package:sotally_tober/styles/commonStyle.dart';
import 'package:sotally_tober/sharedFunctions/validators.dart';
import 'package:sotally_tober/sharedWidgets/textFormField.dart';

class LoginFormWidget extends StatefulWidget {
  final ViewModel _viewModel;
  LoginFormWidget(this._viewModel);
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

  login() {
    if (_formKey.currentState.validate()) {
      Map loginPayload = {
        "email": _emailcontroller.text,
        "password": _passwordcontroller.text
      };
      widget._viewModel.userlogin(loginPayload,context);
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
        obscureText:true,
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
          ButtonTheme(
            minWidth: 500.0,
            height: 50.0,
            child: RaisedButton(
              onPressed: () => login(),
              child: Padding(padding: EdgeInsets.all(15.0), child: Text("LOGIN")),
              color: Colors.orange,
              textColor: Colors.white,
            )),
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
