import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShadowedContainerVertical extends StatelessWidget {
  //String to be displayed
  String inputText;
  var backgroundColor;
  //text color
  var textColor;
  var iconValue;
  var iconColor;
  var iconSize;

  var horizontalPadding;
  var verticalPadding;

  VoidCallback onCustomButtonPressed;

  ShadowedContainerVertical(
      this.inputText,
      this.backgroundColor,
      this.textColor,
      this.iconValue,
      this.iconColor,
      this.iconSize,
      this.horizontalPadding,
      this.verticalPadding,
      this.onCustomButtonPressed);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onCustomButtonPressed,
        child: Container(
          padding: EdgeInsets.fromLTRB(horizontalPadding, verticalPadding,
              horizontalPadding, verticalPadding),
          decoration: BoxDecoration(
            color: backgroundColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 10,
                offset: Offset(0, 5), // changes position of shadow
              ),
            ],
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              width: 10,
            ),
            Text(inputText)
          ]),
        ));
  }
}
