import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'Constant.dart';

Text setRegularPoppinsText(String text, double size, Color color, FontWeight weight,
    FontStyle fontStyle) {
  return Text(
    text,
    softWrap: true,
    style: TextStyle(
        fontSize: size,
        fontFamily: sf_pro_display_regular,
        fontWeight: weight,
        color: color,
        fontStyle: fontStyle),
  );
}

Text setMediumSFProText(String text, double size, Color color, FontWeight weight,
    FontStyle fontStyle) {
  return Text(
    text,
    softWrap: true,
    style: TextStyle(
        fontSize: size,
        fontFamily: sf_pro_display_medium,
        fontWeight: weight,
        color: color,
        fontStyle: fontStyle),
  );
}

Text setSemiBoldSFProText(String text, double size, Color color, FontWeight weight,
    FontStyle fontStyle) {
  return Text(
    text,
    softWrap: true,
    style: TextStyle(
        fontSize: size,
        fontFamily: sf_pro_display_semibold,
        fontWeight: weight,
        color: color,
        fontStyle: fontStyle),
  );
}

Text setBoldSFProText(String text, double size, Color color, FontWeight weight,
    FontStyle fontStyle) {
  return Text(
    text,
    softWrap: true,
    style: TextStyle(
        fontSize: size,
        fontFamily: sf_pro_display_bold,
        fontWeight: weight,
        color: color,
        height: 1,
        fontStyle: fontStyle),
  );
}




Text setRegularPoppinsTextAlign(String text, double size, Color color, FontWeight weight,
    FontStyle fontStyle,TextAlign alignment) {
  return Text(
    text,
    softWrap: true,
    textAlign: alignment,
    style: TextStyle(
        fontSize: size,
        fontFamily: sf_pro_display_regular,
        fontWeight: weight,
        color: color,
        fontStyle: fontStyle),
  );
}

Text setBoldPoppinsTextAlign(String text, double size, Color color, FontWeight weight,
    FontStyle fontStyle,TextAlign textAlign) {
  return Text(
    text,
    softWrap: true,
    style: TextStyle(
        fontSize: size,
        fontFamily: sf_pro_display_bold,
        fontWeight: weight,
        color: color,
        height: 1,
        fontStyle: fontStyle),
  );
}

Text setBoldSfProDisplayTextAlign(String text, double size, Color color, FontWeight weight,
    FontStyle fontStyle,TextAlign textAlign) {
  return Text(
    text,
    softWrap: true,
    style: TextStyle(
        fontSize: size,
        fontFamily: sf_pro_display_bold,
        fontWeight: weight,
        color: color,
        height: 1,
        fontStyle: fontStyle),
  );
}


Text setSemiBoldPoppinsText(String text, double size, Color color, FontWeight weight,
    FontStyle fontStyle) {
  return Text(
    text,
    softWrap: true,
    style: TextStyle(
        fontSize: size,
        fontFamily: sf_pro_display_semibold,
        fontWeight: weight,
        color: color,
        fontStyle: fontStyle),
  );
}

Text setMemdiumPoppinsText(String text, double size, Color color, FontWeight weight,
    FontStyle fontStyle) {
  return Text(
    text,
    softWrap: true,
    style: TextStyle(
        fontSize: size,
        fontFamily: sf_pro_display_medium,
        fontWeight: weight,
        color: color,
        fontStyle: fontStyle),
  );
}

Text setMemdiumHindText(String text, double size, Color color, FontWeight weight,
    FontStyle fontStyle) {
  return Text(
    text,
    softWrap: true,
    style: TextStyle(
        fontSize: size,
        fontFamily: sf_pro_display_medium,
        fontWeight: weight,
        color: color,
        fontStyle: fontStyle),
  );
}


Text setRegularHindText(String text, double size, Color color, FontWeight weight,
    FontStyle fontStyle) {
  return Text(
    text,
    softWrap: true,
    style: TextStyle(
        fontSize: size,
        fontFamily: sf_pro_display_regular,
        fontWeight: weight,
        color: color,
        fontStyle: fontStyle),
  );
}

Text setRegularHindTextAlign(String text, double size, Color color, FontWeight weight,
    FontStyle fontStyle,TextAlign alignment) {
  return Text(
    text,
    softWrap: true,
    style: TextStyle(
        fontSize: size,
        fontFamily: sf_pro_display_regular,
        fontWeight: weight,
        color: color,
        fontStyle: fontStyle),
  );
}