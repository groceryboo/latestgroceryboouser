// import 'dart:io';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// final Function onTap;
//
// setNativeButtonWithChild(Widget child, Color fontColor, FontWeight weight,
//     Function onTap, Color burttonColor, double buttonRadius) {
//   return Platform.isIOS
//       ? Container(
//           child: CupertinoButton(
//             child: child,
//             onPressed: onTap,
//             color: burttonColor,
//             borderRadius: new BorderRadius.circular(buttonRadius),
//           ),
//         )
//       : Container(
//           child: MaterialButton(
//             onPressed: onTap,
//             child: child,
//             color: burttonColor,
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(buttonRadius)),
//           ),
//         );
// }
//
// setbuttonWithChild(
//     Widget child, Function onTap, Color burttonColor, double buttonRadius) {
//   return Container(
//     child: FlatButton(
//       disabledColor: Colors.grey,
//       focusColor: Colors.transparent,
//       highlightColor: Colors.transparent,
//       hoverColor: Colors.transparent,
//       splashColor: Colors.transparent,
//       onPressed: onTap,
//       child: child,
//       color: burttonColor,
//       shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(buttonRadius)),
//     ),
//   );
// }
