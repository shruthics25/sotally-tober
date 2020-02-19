import 'package:flutter/material.dart';
import 'package:sotally_tober/model/viewModel.dart';
import 'package:sotally_tober/sharedFunctions/validators.dart';
import 'package:sotally_tober/sharedWidgets/textFormField.dart';

class RegisterFormWidget extends StatefulWidget {
  final ViewModel _viewModel;
  RegisterFormWidget(this._viewModel);
  @override
  _RegisterFormWidgetState createState() => _RegisterFormWidgetState();
}

class _RegisterFormWidgetState extends State<RegisterFormWidget> {
  final _validators = Validators();
  final _formKey = GlobalKey<FormState>();
  final _emailcontroller = new TextEditingController();
  final _passwordcontroller = new TextEditingController();
  final _confirmpasswordcontroller = new TextEditingController();
  final _namecontroller = new TextEditingController();
  final _addresscontroller = new TextEditingController();
  final _phonenumbercontroller = new TextEditingController();
  final _textWidget = new TextFormFieldWidget();

  register() {
    if (_formKey.currentState.validate()) {
      Map registerPayload = {
        "name": _namecontroller.text,
        "email": _emailcontroller.text,
        "password": _passwordcontroller.text,
        "address": _addresscontroller.text,
        "phoneNumber": _phonenumbercontroller.text
      };
      widget._viewModel.register(registerPayload,context);
    }
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

    final _confrimpasswordField = _textWidget.getTextWidget(
        validate: _validators.alphaNumericValidator,
        textcontroller: _confirmpasswordcontroller,
        icon: Icons.lock,
        obscureText:true,
        hintText: "Confirm Password");

    final _nameField = _textWidget.getTextWidget(
        validate: _validators.alphaNumericValidator,
        textcontroller: _namecontroller,
        icon: Icons.person,
        hintText: "Name");

    final _addressField = _textWidget.getTextWidget(
        validate: _validators.alphaNumericValidator,
        textcontroller: _addresscontroller,
        icon: Icons.location_on,
        hintText: "Address");

    final _phoneNumberField = _textWidget.getTextWidget(
        validate: _validators.alphaNumericValidator,
        textcontroller: _phonenumbercontroller,
        icon: Icons.phone,
        hintText: "Phone Number");

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(height: 60),
          _nameField,
          SizedBox(height: 20),
          _phoneNumberField,
          SizedBox(height: 20),
          _emailField,
          SizedBox(height: 20),
          _passwordField,
          SizedBox(height: 20),
          _confrimpasswordField,
          SizedBox(height: 20),
          _addressField,
          SizedBox(height: 20),
           ButtonTheme(
            minWidth: 500.0,
            height: 50.0,
            child: RaisedButton(
              onPressed: () => register(),
              child: Padding(padding: EdgeInsets.all(15.0), child: Text("REGISTER")),
              color: Colors.orange,
              textColor: Colors.white,
            )),
        ],
      ),
    );
  }
}
