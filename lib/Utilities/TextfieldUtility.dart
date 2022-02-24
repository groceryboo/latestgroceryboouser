import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:groceryboouser/Styles/my_colors.dart';
import 'package:groceryboouser/Styles/my_icons.dart';
import 'package:groceryboouser/Utilities/Constant.dart';

setTextFieldWithBorder(
    TextEditingController controller,
    String hintText,
    bool secureEntry,
    TextInputType inputType,
    bool validtion,
    String errorMSg,
    TextInputAction textInputAction,
    Function onchange) {
  return Theme(
      data: new ThemeData(
        primaryColor: Colors.green,
        primaryColorDark: Colors.red,
      ),
      child: TextField(
        style: const TextStyle(
            color:  black,
            fontWeight: FontWeight.w500,
            fontFamily: sf_pro_display_medium,
            fontStyle:  FontStyle.normal,
            fontSize: 15.0
        ),
        decoration: new InputDecoration(
          isDense: true,
          // contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
          border: InputBorder.none,

          labelStyle: new TextStyle(
              fontSize: 15.0,  color: Colors.grey,fontFamily: 'Poppins',fontWeight: FontWeight.w600),

          filled: true,
          fillColor: Colors.white70,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.7)),
            borderSide: BorderSide(color:grey_96a6a3, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.7)),
            borderSide: BorderSide(color: black),
          ),
        ),
        keyboardType: inputType,
        cursorColor: black,
        textInputAction: textInputAction,


      )
  );
}


var _controller = TextEditingController();


setTextFieldIcon(
    TextEditingController controller,
    String hintText,
    bool secureEntry,
    TextInputType inputType,
    bool validtion,
    String errorMSg,
    Function onchange) {
  return Theme(
      data: new ThemeData(
        primaryColor: Colors.green,
        primaryColorDark: Colors.red,
      ),
      child: TextField(

        style:  TextStyle(
            color: black,
            fontWeight: FontWeight.w500,
            fontFamily: sf_pro_display_medium,
            fontStyle:  FontStyle.normal,
            fontSize: 14.0
        ),
        decoration: new InputDecoration(
          isDense: true,

           contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
          hintText: hintText,
          suffixIcon: Visibility(
            visible: false,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(cross,width: 5,height: 5,),
            ),
          ),
          hintStyle: TextStyle(
              color:  grey_96a6a3,
              fontWeight: FontWeight.w500,
              fontFamily: sf_pro_display_medium,
              fontStyle:  FontStyle.normal,
              fontSize: 14.0
          ),
          border: InputBorder.none,

        ),
      )
  );
}

setTextField(
    TextEditingController controller,
    String hintText,
    bool secureEntry,
    TextInputType inputType,
    bool validtion,
    String errorMSg,
    TextInputAction textInputAction,
    Function onchange) {
  return Theme(
      data: new ThemeData(
        primaryColor: Colors.green,
        primaryColorDark: Colors.red,
      ),
      child: TextField(
        style:  TextStyle(
            color: black,
            fontWeight: FontWeight.w500,
            fontFamily: sf_pro_display_medium,
            fontStyle:  FontStyle.normal,
            fontSize: 14.0
        ),
        decoration: new InputDecoration(
          isDense: true,
          // contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
          hintText: hintText,
          hintStyle: TextStyle(
              color:  grey_96a6a3,
              fontWeight: FontWeight.w500,
              fontFamily: sf_pro_display_medium,
              fontStyle:  FontStyle.normal,
              fontSize: 14.0
          ),
          border: InputBorder.none,
        ),
        textInputAction: textInputAction,
        keyboardType: inputType,
        cursorColor: black,
      )
  );
}

setTextSemiboldField(
    TextEditingController controller,
    String hintText,
    bool secureEntry,
    TextInputType inputType,
    bool validtion,
    String errorMSg,
    TextInputAction textInputAction,
    Function onchange) {
  return Theme(
      data: new ThemeData(
        primaryColor: Colors.green,
        primaryColorDark: Colors.red,
      ),
      child: TextField(
        style:  TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontFamily: sf_pro_display_semibold,
            fontStyle:  FontStyle.normal,
            fontSize: 16.0
        ),
        decoration: new InputDecoration(
          isDense: true,
          // contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
          hintText: hintText,
          hintStyle: TextStyle(
              color:  Colors.white.withOpacity(0.7),
              fontWeight: FontWeight.w500,
              fontFamily: sf_pro_display_semibold,
              fontStyle:  FontStyle.normal,
              fontSize: 16.0
          ),
          border: InputBorder.none,
        ),
        textInputAction: textInputAction,
        keyboardType: inputType,
        cursorColor: black,
      )
  );
}

setTextFieldNext(
    TextEditingController controller,
    String hintText,
    bool secureEntry,
    TextInputType inputType,
    bool validtion,
    String errorMSg,
    TextInputAction textInputAction,
    Function onchange) {
  return Theme(
      data: new ThemeData(
        primaryColor: Colors.green,
        primaryColorDark: Colors.red,
      ),
      child: TextFormField(
        autovalidateMode:
        AutovalidateMode.onUserInteraction,
        style:  TextStyle(
            color: black,
            fontWeight: FontWeight.w500,
            fontFamily: sf_pro_display_medium,
            fontStyle:  FontStyle.normal,
            fontSize: 14.0
        ),
        decoration: new InputDecoration(
          isDense: true,
          // contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
          hintText: hintText,
          hintStyle: TextStyle(
              color:  grey_96a6a3,
              fontWeight: FontWeight.w500,
              fontFamily: sf_pro_display_medium,
              fontStyle:  FontStyle.normal,
              fontSize: 14.0
          ),
          border: InputBorder.none,
        ),
        textInputAction: textInputAction,
        keyboardType: inputType,
        cursorColor: black,
        validator: (value) {
          if (GetUtils.isEmail(
              value)) {
            return null;
          } else {
            return 'Email is not valid';
          }
        },
      )
  );
}

setTextFieldPassword(
    TextEditingController controller,
    String hintText,
    bool secureEntry,
    TextInputType inputType,
    bool validtion,
    String errorMSg,
    Function onchange) {
  return Theme(
      data: new ThemeData(
        primaryColor: Colors.green,
        primaryColorDark: Colors.red,
      ),
      child: TextField(
        style:  TextStyle(
            color: black,
            fontWeight: FontWeight.w500,
            fontFamily: sf_pro_display_medium,
            fontStyle:  FontStyle.normal,
            fontSize: 16.0
        ),
        decoration: new InputDecoration(
          isDense: true,
          // contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
          hintText: hintText,
          hintStyle: TextStyle(
              color:  black,
              fontWeight: FontWeight.w500,
              fontFamily: sf_pro_display_medium,
              fontStyle:  FontStyle.normal,
              fontSize: 16.0
          ),
          border: InputBorder.none,

          labelStyle: new TextStyle(
              color:  black,
              fontWeight: FontWeight.w500,
              fontFamily:sf_pro_display_medium,
              fontStyle:  FontStyle.normal,
              fontSize: 16.0),
        ),
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
      )
  );
}


setTextFieldOTP(
    TextEditingController controller,
    String hintText,
    bool secureEntry,
    TextInputType inputType,
    bool validtion,
    String errorMSg,
    Function onchange) {
  return Theme(
      data: new ThemeData(
        primaryColor: Colors.green,
        primaryColorDark: Colors.red,
      ),
      child: TextField(
        style:  TextStyle(
            color:  black,
            fontWeight: FontWeight.w500,
            fontFamily: sf_pro_display_medium,
            fontStyle:  FontStyle.normal,
            fontSize: 16.0
        ),
        decoration: new InputDecoration(
          isDense: true,
          counter: Offstage(),
          // contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
          hintText: "X X X X",
          hintStyle: TextStyle(
              color:  black,
              fontWeight: FontWeight.w500,
              fontFamily: sf_pro_display_medium,
              fontStyle:  FontStyle.normal,
              fontSize: 16.0
          ),
          border: InputBorder.none,
          labelStyle: new TextStyle(
              color:  black,
              fontWeight: FontWeight.w500,
              fontFamily: sf_pro_display_medium,
              fontStyle:  FontStyle.normal,
              fontSize: 16.0),
        ),
        keyboardType: TextInputType.number,
        maxLength: 4,
      )
  );
}