import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groceryboouser/Styles/my_colors.dart';


setFormTextField(
    TextEditingController controller,
    String hintText,
    bool secureEntry,
    TextInputType inputType,
    TextInputAction textInputAction,
    Function onchange,
    {Function validator}) {
  return Theme(
      data: new ThemeData(
        primaryColor: Colors.green,
        primaryColorDark: Colors.red,
      ),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) => validator(value),
        onChanged: (value) => {
          onchange(value),
        },
        style: TextStyle(
          color: Colors.white,
          fontStyle: FontStyle.normal,
          fontSize: 17.28,
        ),
        decoration: new InputDecoration(
          filled: true,
          fillColor: skygreen_24d39e,
          isDense: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.7),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: skygreen_24d39e),
            borderRadius: BorderRadius.circular(5.7),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.7),
          ),

          contentPadding:
          const EdgeInsets.only(left: 14.0, bottom: 15.0, top: 15.0),

          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.white,
            fontStyle: FontStyle.normal,
            fontSize: 17.28,
          ),

          labelStyle: new TextStyle(
              color: Colors.green,
              fontStyle: FontStyle.normal,
              fontSize: 17.28),
          // hintStyle: TextStyle(
          //     fontSize: 18.0, color: Colors.black87,fontFamily: 'Poppins',fontWeight: FontWeight.w600
          // ),
        ),
        keyboardType: inputType,
        textInputAction: textInputAction,
      ));
}