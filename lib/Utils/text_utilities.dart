import 'package:flutter/material.dart';
import 'package:groceryboouser/Utilities/Constant.dart';

// const String regularFont = 'CircularXXTTTrial Regular';
// const String boldFont = 'CircularXXTTTrial Bold';
// const String mediumFont = 'CircularXXTTTrial Medium';
// const String circularBlackFont = 'CircularXXTTTrial Black';
// const String circularBookFont = 'CircularXXTTTrial Book';

const String sfProRegularFont = 'SfproProDisplay Regular';
const String sfProfBoldFont = 'SfproProDisplay Bold';
const String sfProSemiBoldFont = 'SfproProDisplay SemiBold';
const String sfProMediumFont = 'SfproProDisplay Medium';

// const String regularPoppinsFont = 'Poppins Regular';
// const String mediumPoppinsFont = 'Poppins Medium';
// const String semiboldPoppinsFont = 'Poppins SemibBold';
// const String boldPoppinsFont = 'Poppins Bold';
// const String regularHindFont = 'Hind Regular';
// const String mediumHindFont = 'Hind Medium';
// const String semiboldHindFont = 'Hind Semibold';

// poppins font
const String semiBoldFont = 'PoppinsSemiBold Semibold';

// Roboto font
const String robotoMedium = 'Roboto Medium';
const String robotoBold = 'Roboto Bold';
const String robotoRegular = 'Roboto Regular';

Text setRegulerText(String text, double size, Color color, FontWeight weight,
    FontStyle fontStyle) {
  return Text(
    text,
    softWrap: true,
    style: TextStyle(
      fontSize: size,
      fontFamily: sf_pro_display_regular,
      fontWeight: weight,
      color: color,
      fontStyle: fontStyle,
      letterSpacing: 0.5,
    ),
  );
}

Text setSemiBoldText(String text, double size, Color color, FontWeight weight,
    FontStyle fontStyle) {
  return Text(
    text,
    softWrap: true,
    style: TextStyle(
        fontSize: size,
        fontFamily: sf_pro_display_semibold,
        fontWeight: weight,
        color: color,
        height: 1.2,
        fontStyle: fontStyle),
  );
}

Text setRegulerTextAlign(String text, double size, Color color,
    FontWeight weight, FontStyle fontStyle, TextAlign alignment) {
  return Text(
    text,
    softWrap: true,
    textAlign: alignment,
    style: TextStyle(
      fontSize: size,
      fontFamily: sf_pro_display_regular,
      fontWeight: weight,
      color: color,
      fontStyle: fontStyle,
      letterSpacing: 0.5,
    ),
  );
}

Text setBoldText(String text, double size, Color color, FontWeight weight,
    FontStyle fontStyle) {
  return Text(
    text,
    softWrap: true,
    style: TextStyle(
        fontSize: size,
        fontFamily: sf_pro_display_bold,
        fontWeight: weight,
        color: color,
        letterSpacing: 0.4,
        fontStyle: fontStyle),
  );
}

Text setBoldTextWithAlign(String text, double size, Color color,
    FontWeight weight, FontStyle fontStyle, TextAlign alignment) {
  return Text(
    text,
    softWrap: true,
    textAlign: alignment,
    style: TextStyle(
        fontSize: size,
        fontFamily: sf_pro_display_bold,
        fontWeight: weight,
        color: color,
        fontStyle: fontStyle),
  );
}

Text setMemdiumText(String text, double size, Color color, FontWeight weight,
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

Text setBoldTextUnderline(String text, double size, Color color,
    FontWeight weight, FontStyle fontStyle, TextDecoration underline) {
  return Text(
    text,
    softWrap: true,
    style: TextStyle(
        fontSize: size,
        fontFamily: sf_pro_display_bold,
        fontWeight: weight,
        color: color,
        fontStyle: fontStyle,
        decoration: underline),
  );
}

snackBar(BuildContext context, String message) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: Duration(seconds: 2),
    ),
  );
}

// showFlutterToast(msg) {
//   Fluttertoast.showToast(
//       msg: msg,
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.BOTTOM,
//       // timeInSecForIosWeb: 1,
//       // textColor: Colors.white,
//       fontSize: 16.0);
// }

snackBarRapid(BuildContext context, String message) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: Duration(seconds: 1),
    ),
  );
}

// TextStyle setFontStyle({
//   required fontFamily,
//   required double fontSize,
//   color,
//   fontStyle,
// }) {
//   return TextStyle(
//     color: color ?? Colors.white,
//     fontFamily: fontFamily,
//     fontStyle: fontStyle ?? FontStyle.normal,
//     fontSize: fontSize,
//   );
// }