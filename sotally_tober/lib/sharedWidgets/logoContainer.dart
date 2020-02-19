import 'package:flutter/material.dart';
import 'package:sotally_tober/styles/commonStyle.dart';

class LogoContainer extends StatelessWidget {
  final _commonStyle = CommonStyle();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 100.0,
            child: Image.asset(
              "assets/images/logo.jpg",
              fit: BoxFit.contain,
            ),
          ),
          Center(child: Text("Sotally Tober", style: _commonStyle.headerstyle))
        ],
      ),
    );
  }
}
