import 'package:flutter/material.dart';

class TextFormFieldWidget {

   Widget getTextWidget({Key key,Function validate,TextEditingController textcontroller,IconData icon,String hintText,bool obscureText = false}){
      return TextFormField(
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter value';
          }
          return validate(value);
        },
        controller: textcontroller,
        obscureText: obscureText ? obscureText : false,
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