import 'package:flutter/material.dart';
import 'package:groceryboouser/Styles/my_colors.dart';
import 'package:groceryboouser/Styles/my_height.dart';
import 'package:groceryboouser/Styles/my_strings.dart';
import 'package:groceryboouser/Utilities/TextUtilities.dart';

class CommonElevatedRoundedButton extends StatelessWidget {
  //String to be displayed
  String inputText;
  //button background color
  var buttonColor;
  //text color
  var textColor;
  var radius;
  VoidCallback onCustomButtonPressed;

  CommonElevatedRoundedButton(
    this.inputText,
    this.textColor,
    this.buttonColor,
    this.radius,
    this.onCustomButtonPressed,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Color(0x17747796).withOpacity(0.07),
          spreadRadius: 10,
          blurRadius: 10,
          offset: Offset(0, 20), // changes position of shadow
        ),
      ]),
      child: SizedBox(
        // width: double.infinity,
        // height: HeightData.sixty,
        child: ElevatedButton(
            child: //
                setBoldSfProDisplayTextAlign(
                    inputText,
                    14,
                    textColor,
                    FontWeight.w500,
                    FontStyle.normal,
                    TextAlign.center), // Button
            onPressed: onCustomButtonPressed,
            style: ElevatedButton.styleFrom(
              primary: buttonColor,
              onPrimary: Colors.white,
              elevation: 0,
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 13, bottom: 13),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
                side: BorderSide(color: skygreen_24d39e, width: 0),
              ),
            )),
      ),
    );
  }
}
