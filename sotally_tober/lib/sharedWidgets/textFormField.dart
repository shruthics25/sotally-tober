import 'package:flutter/material.dart';

class TextFormFieldWidget {

   Widget getTextWidget({Key key,Function validate,TextEditingController textcontroller,IconData icon,String hintText}){
      return TextFormField(
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter value';
          }
          return validate(value);
        },
        controller: textcontroller,
        decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Colors.white,
        ),
        hintStyle: TextStyle(color: Colors.white),
        filled: true,
        fillColor: Colors.black45,
        hintText: hintText)
    );
   }

}