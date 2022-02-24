// import 'dart:math';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:groceryboouser/Screens/SocialMediaLogin/googlesignincon.dart';
//
// class GoogleSignIn extends StatefulWidget {
//   @override
//   _LogInState createState() => _LogInState();
// }
//
// class _LogInState extends State<GoogleSignIn> {
//   final GoogleSigninController googlesignInCon = Get.put(GoogleSigninController());
//
//   static const _kBasePadding = 17.0;
//   static const kExpandedHeight = 150.0;
//
//   final ValueNotifier<double> _titlePaddingNotifier =
//   ValueNotifier(_kBasePadding);
//
//   final _scrollController = ScrollController();
//
//   double get _horizontalTitlePadding {
//     const kCollapsedPadding = 80.0;
//
//     if (_scrollController.hasClients) {
//       return min(
//           _kBasePadding + kCollapsedPadding,
//           _kBasePadding +
//               (kCollapsedPadding * _scrollController.offset) /
//                   (kExpandedHeight - kToolbarHeight));
//     }
//
//     return _kBasePadding;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     // throw UnimplementedError();
//
//     _scrollController.addListener(() {
//       _titlePaddingNotifier.value = _horizontalTitlePadding;
//     });
//
//     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//       systemNavigationBarColor: Colors.white, // navigation bar color
//       statusBarColor: Colors.white, // status bar color
//       statusBarIconBrightness: Brightness.dark, // status bar icons' color
//       systemNavigationBarIconBrightness:
//       Brightness.light, //navigation bar icons' color
//     ));
//
//     return Scaffold(
//       appBar: AppBar(title: Text("Login Page")),
//       body: Center(
//         child: Obx(() {
//           if (googlesignInCon.googleAccount.value == null) {
//             return buildLoginButton();
//           } else {
//             return buildProfileView();
//           }
//         }),
//       ),
//     );
//   }
//
//   buildLoginButton() {
//     return FloatingActionButton.extended(
//         onPressed: () => googlesignInCon.login(), label: Text("Google signin"));
//   }
//
//   buildProfileView() {
//    return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         CircleAvatar(
//           backgroundImage: Image.network(googlesignInCon.googleAccount.value?.photoUrl ?? "").image,
//           radius: 100,
//         ),
//         Text(
//           googlesignInCon.googleAccount.value?.displayName ?? "",
//           style: Get.textTheme.headline3,
//         ),
//         Text(
//           googlesignInCon.googleAccount.value?.email ?? "",
//           style: Get.textTheme.bodyText1,
//         ),
//         ActionChip(avatar: Icon(Icons.logout), label: Text("Logout"), onPressed: (){googlesignInCon.logout();
//         }),
//
//       ],
//     );
//   }
//
// }
