import 'package:flutter/material.dart';

class ButtonWidget {
  Widget getButtonWidget({Function onpressed, String hintText}) {
    return ButtonTheme(
        minWidth: 500.0,
        height: 50.0,
        child: RaisedButton(
          onPressed: () => onpressed,
          child: Padding(padding: EdgeInsets.all(15.0), child: Text(hintText)),
          color: Colors.orange,
          textColor: Colors.white,
        ));
  }
}
