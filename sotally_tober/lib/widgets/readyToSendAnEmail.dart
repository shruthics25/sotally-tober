import 'package:flutter/material.dart';
import 'package:sotally_tober/model/viewModel.dart';

class ReadyToSendAnEmailWidget extends StatefulWidget {
  ViewModel _viewModel;
  ReadyToSendAnEmailWidget(this._viewModel);
  @override
  _ReadyToSendAnEmailWidgetState createState() => _ReadyToSendAnEmailWidgetState();
}

class _ReadyToSendAnEmailWidgetState extends State<ReadyToSendAnEmailWidget> {

  @override
  Widget build(BuildContext context) {
    return Text("Ready to send");
  }
}
