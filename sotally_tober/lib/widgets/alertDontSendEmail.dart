import 'package:flutter/material.dart';
import 'package:sotally_tober/model/viewModel.dart';

class AlertDontSendAnEmailWidget extends StatefulWidget {
  ViewModel _viewModel;
  AlertDontSendAnEmailWidget(this._viewModel);
  @override
  _AlertDontSendAnEmailWidgetState createState() => _AlertDontSendAnEmailWidgetState();
}

class _AlertDontSendAnEmailWidgetState extends State<AlertDontSendAnEmailWidget> {

  @override
  Widget build(BuildContext context) {
    return Text("Alert Dont Send An Email");
  }
}
