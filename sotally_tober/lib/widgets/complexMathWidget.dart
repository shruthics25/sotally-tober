import 'package:flutter/material.dart';
import 'package:sotally_tober/styles/commonStyle.dart';
import 'dart:math' show Random;

class ComplexMathWidget extends StatefulWidget {
  @override
  _ComplexMathWidgetState createState() => _ComplexMathWidgetState();
}

class _ComplexMathWidgetState extends State<ComplexMathWidget> {
  final _commonStyle = CommonStyle();
  final _formKey = GlobalKey<FormState>();
  static final Random _random = Random.secure();
  final _sumcontroller = new TextEditingController();
  final _mulcontroller = new TextEditingController();
  final _subcontroller = new TextEditingController();
  int _number1 = _random.nextInt(1000);
  int _number2 = _random.nextInt(1000);
  int _number3 = _random.nextInt(100);
  int _number4 = _random.nextInt(10);

  @override
  Widget build(BuildContext context) {
  
    return Column(
      children: <Widget>[
        SizedBox(height: 10),
        Center(child: Text("You're not bad At Math, But Still need to prove!!", style: _commonStyle.headerstyle)),
        SizedBox(
          height: 5,
        ),
        SizedBox(height: 5),
        Center(
            child: Image(
          image: AssetImage('assets/images/complex.jpg'),
          height: 300,
        )),
        SizedBox(height: 5),
        Center(
            child: Text("Sober enough? Answer these..",
                style: _commonStyle.cardText)),
        SizedBox(
          height: 5,
        ),
        Form(
            key: _formKey,
            child: Column(children: <Widget>[
              Center(
                  child: Text(
                "$_number1 + $_number2 ?? ",
                style: _commonStyle.number1Text,
              )),
              TextFormField(
                controller: _sumcontroller,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.note,
                      color: Colors.white,
                    ),
                    hintStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.black45,
                    hintText: "Answer"),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'oh oh!';
                  }
                  return null;
                },
              ),
              Center(
                  child: Text(
                "$_number4 * $_number3 ?? ",
                style: _commonStyle.number1Text,
              )),
              TextFormField(
                controller: _mulcontroller,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.note,
                      color: Colors.white,
                    ),
                    hintStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.black45,
                    hintText: "Answer"),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'oh shit!';
                  }
                  return null;
                },
              ),
              Center(
                  child: Text(
                "$_number3 - $_number2 ?? ",
                style: _commonStyle.number1Text,
              )),
              TextFormField(
                controller: _subcontroller,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.note,
                      color: Colors.white,
                    ),
                    hintStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.black45,
                    hintText: "Answer"),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'oh oh no!';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15,),
              ButtonTheme(
              minWidth: 500.0,
              height: 50.0,
              child: RaisedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, otherwise false.
                  if (_formKey.currentState.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.

                    if((_number1 + _number2) == int.parse(_sumcontroller.text) && (_number4 * _number3) == int.parse(_mulcontroller.text) && (_number3 - _number2) == int.parse(_subcontroller.text)){
                       print("in if");
                       Navigator.pushNamed(context, "/difficult");
                       
                    }else {
                      print("in else");
                      Navigator.pushNamed(context, "/alert");
                    }
                  }
                },
                child: Padding(padding: EdgeInsets.all(15.0), child: Text("DONE")),
                color: Colors.orange,
                textColor: Colors.white,
              ))
              
            ]))
      ],
    );
  }
}
