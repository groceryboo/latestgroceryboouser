// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:groceryboouser/Layouts/ToolbarWithHeader.dart';
// import 'package:groceryboouser/Styles/my_colors.dart';
// import 'package:groceryboouser/Styles/my_icons.dart';
// import 'package:groceryboouser/Utilities/Constant.dart';
// import 'package:groceryboouser/Utils/SizeConfig.dart';
//
// class Settings extends StatefulWidget {
//   const Settings({Key key}) : super(key: key);
//
//   @override
//   _SettingsState createState() => _SettingsState();
// }
//
// class _SettingsState extends State<Settings> {
//
//   bool pushNotifications = false;
//   bool location = false;
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return SafeArea(
//         child: Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Container(
//           margin: EdgeInsets.symmetric(
//               horizontal: SizeConfig.screenWidth! * 0.05,
//               vertical: SizeConfig.screenHeight! * 0.05),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               ToolbarWithHeader('Settings', false),
//               Container(
//                 width: SizeConfig.screenWidth!,
//                 margin: EdgeInsets.only(
//                   top: SizeConfig.screenHeight! * 0.02,
//                   bottom: SizeConfig.screenHeight! * 0.02
//                 ),
//                 padding: EdgeInsets.all(8),
//                 alignment: Alignment.center,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12),
//                   color: Color.fromRGBO(52, 167, 254, 0.05),
//                 ),
//                 child: Row(
//                   children: [
//                     Container(
//                       width: SizeConfig.screenWidth! * 0.15,
//                       height: SizeConfig.screenHeight! * 0.08,
//                       padding: EdgeInsets.all(16),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: Image.network(
//                           'https://cdn.shopify.com/s/files/1/1061/1924/products/Handshake_Emoji_Icon_ios10_grande.png?v=1571606090',
//                           width: 10),
//                     ),
//                     SizedBox(
//                       width: SizeConfig.blockSizeHorizontal! * 5,
//                     ),
//                     Text(
//                       'Invite some friend to join with you!',
//                       style: TextStyle(
//                         fontFamily: sf_pro_display_regular,
//                         fontWeight: FontWeight.w500,
//                         fontSize: 14,
//                         color: blue_34A7FE,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               ListTile(
//                 contentPadding: EdgeInsets.zero,
//                 leading: Container(
//                   padding: EdgeInsets.all(8),
//                   width: SizeConfig.screenWidth! * 0.135,
//                   height: SizeConfig.screenHeight! * 0.065,
//                   decoration: BoxDecoration(
//                     color: skygreen_24d39e,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: SvgPicture.asset(
//                     filter_icon,
//                     color: Colors.white,
//                   ),
//                 ),
//                 title: Text(
//                   'Account',
//                   style: TextStyle(
//                       fontFamily: sf_pro_display_bold,
//                       fontSize: 14,
//                       color: black_273433),
//                 ),
//                 subtitle: Text(
//                   'Edit and manage your account details',
//                   style: TextStyle(
//                       fontFamily: sf_pro_display_medium,
//                       fontSize: 12,
//                       color: grey_96a6a3),
//                 ),
//               ),
//               Container(
//                 width: SizeConfig.screenWidth!,
//                 margin: EdgeInsets.only(
//                   bottom: SizeConfig.screenHeight! * 0.02
//                 ),
//                 padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal! * 4),
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12),
//                     color: Colors.white,
//                     boxShadow: [
//                       BoxShadow(
//                           color: Color.fromRGBO(67, 67, 178, 0.08),
//                           offset: Offset(1, 1),
//                           blurRadius: 50,
//                           spreadRadius: 20),
//                     ]),
//                 child: ListView(
//                   shrinkWrap: true,
//                   primary: false,
//                   children: ListTile.divideTiles( //          <-- ListTile.divideTiles
//                       context: context,
//                       tiles: [
//                         ListTile(
//                           contentPadding: EdgeInsets.zero,
//                           title:  Text('Phone',
//                             style: TextStyle(
//                                 color: grey_96a6a3,
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w500
//                             ),),
//                           subtitle:  Text('+1 876-543-21',
//                             style: TextStyle(
//                                 color: black_273433,
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w600
//                             ),),
//                         ),
//                         ListTile(
//                           contentPadding: EdgeInsets.zero,
//                           title:  Text('Email',
//                             style: TextStyle(
//                                 color: grey_96a6a3,
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w500
//                             ),),
//                           subtitle:   Text('marrianeros@gmail.com',
//                             style: TextStyle(
//                                 color: black_273433,
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w600
//                             ),),
//                         ),
//                       ]
//                   ).toList(),
//                 ),
//               ),
//               ListTile(
//                 contentPadding: EdgeInsets.zero,
//                 leading: Container(
//                   padding: EdgeInsets.all(8),
//                   width: SizeConfig.screenWidth! * 0.135,
//                   height: SizeConfig.screenHeight! * 0.065,
//                   decoration: BoxDecoration(
//                     color: skygreen_24d39e,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: SvgPicture.asset(
//                     icon_lock,
//                     color: Colors.white,
//                   ),
//                 ),
//                 title: Text(
//                   'Preferences',
//                   style: TextStyle(
//                       fontFamily: sf_pro_display_bold,
//                       fontSize: 14,
//                       color: black_273433),
//                 ),
//                 subtitle: Text(
//                   'Set your privacy like password, etc.',
//                   style: TextStyle(
//                       fontFamily: sf_pro_display_medium,
//                       fontSize: 12,
//                       color: grey_96a6a3),
//                 ),
//               ),
//               Container(
//                 width: SizeConfig.screenWidth!,
//                 margin: EdgeInsets.only(
//                     bottom: SizeConfig.screenHeight! * 0.02
//                 ),
//                 padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal! * 4),
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12),
//                     color: Colors.white,
//                     boxShadow: [
//                       BoxShadow(
//                           color: Color.fromRGBO(67, 67, 178, 0.08),
//                           offset: Offset(1, 1),
//                           blurRadius: 50,
//                           spreadRadius: 20),
//                     ]),
//                 child: ListView(
//                   shrinkWrap: true,
//                   primary: false,
//                   children: ListTile.divideTiles( //          <-- ListTile.divideTiles
//                       context: context,
//                       tiles: [
//                         ListTile(
//                           contentPadding: EdgeInsets.zero,
//                           title:  Text('Change Password',
//                           style: TextStyle(
//                               fontFamily: sf_pro_display_medium,
//                               color: black_273433,
//                               fontSize: 14,
//                               fontWeight: FontWeight.w500
//                           ),),
//                           trailing:  Icon(Icons.arrow_forward_ios_rounded,color: skygreen_24d39e,
//                                  size: SizeConfig.blockSizeVertical! * 2.5 ,),
//                         ),
//                         SwitchListTile(value: pushNotifications, onChanged: (value){
//                           setState(() {
//                             pushNotifications = value;
//                           });
//                         },
//                           title: Text('Push Notifications',
//                             style: TextStyle(
//                                 fontFamily: sf_pro_display_medium,
//                                 color: black_273433,
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w500
//                             ),),
//                           contentPadding: EdgeInsets.zero,
//                           activeColor: green_15CF7D,),
//                         SwitchListTile(value: location, onChanged: (value){
//                           setState(() {
//                             location = value;
//                           });
//                         },
//                           title: Text('Location Services',
//                             style: TextStyle(
//                                 fontFamily: sf_pro_display_medium,
//                                 color: black_273433,
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w500
//                             ),),
//                           contentPadding: EdgeInsets.zero,
//                           activeColor: green_15CF7D,)
//                       ]
//                   ).toList(),
//                 )
//               ),
//               ListTile(
//                 contentPadding: EdgeInsets.zero,
//                 leading: Container(
//                   padding: EdgeInsets.all(8),
//                   width: SizeConfig.screenWidth! * 0.135,
//                   height: SizeConfig.screenHeight! * 0.065,
//                   decoration: BoxDecoration(
//                     color: skygreen_24d39e,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: SvgPicture.asset(
//                     icon_support,
//                     color: Colors.white,
//                   ),
//                 ),
//                 title: Text(
//                   'Support',
//                   style: TextStyle(
//                       fontFamily: sf_pro_display_bold,
//                       fontSize: 14,
//                       color: black_273433),
//                 ),
//                 subtitle: Text(
//                   '24/7 call center support',
//                   style: TextStyle(
//                       fontFamily: sf_pro_display_medium,
//                       fontSize: 12,
//                       color: grey_96a6a3),
//                 ),
//               ),
//               Container(
//                   width: SizeConfig.screenWidth!,
//                   margin: EdgeInsets.only(
//                       bottom: SizeConfig.screenHeight! * 0.02
//                   ),
//                   padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal! * 4),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12),
//                       color: Colors.white,
//                       boxShadow: [
//                         BoxShadow(
//                             color: Color.fromRGBO(67, 67, 178, 0.08),
//                             offset: Offset(1, 1),
//                             blurRadius: 50,
//                             spreadRadius: 20),
//                       ]),
//                   child: ListView(
//                     shrinkWrap: true,
//                     primary: false,
//                     children: ListTile.divideTiles( //          <-- ListTile.divideTiles
//                         context: context,
//                         tiles: [
//                           ListTile(
//                             contentPadding: EdgeInsets.zero,
//                             title:  Text('Help Center',
//                               style: TextStyle(
//                                   fontFamily: sf_pro_display_medium,
//                                   color: black_273433,
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w500
//                               ),),
//                             trailing:  Icon(Icons.arrow_forward_ios_rounded,color: skygreen_24d39e,
//                               size: SizeConfig.blockSizeVertical! * 2.5 ,),
//                           ),
//                           ListTile(
//                             contentPadding: EdgeInsets.zero,
//                             title:  Text('Suggest improvements',
//                               style: TextStyle(
//                                   fontFamily: sf_pro_display_medium,
//                                   color: black_273433,
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w500
//                               ),),
//                             trailing:  Icon(Icons.arrow_forward_ios_rounded,color: skygreen_24d39e,
//                               size: SizeConfig.blockSizeVertical! * 2.5 ,),
//                           ),
//                         ]
//                     ).toList(),
//                   )
//               ),
//               ListTile(
//                 contentPadding: EdgeInsets.zero,
//                 leading: Container(
//                   padding: EdgeInsets.all(8),
//                   width: SizeConfig.screenWidth! * 0.135,
//                   height: SizeConfig.screenHeight! * 0.065,
//                   decoration: BoxDecoration(
//                     color: skygreen_24d39e,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: SvgPicture.asset(
//                     info_square,
//                     color: Colors.white,
//                   ),
//                 ),
//                 title: Text(
//                   'About',
//                   style: TextStyle(
//                       fontFamily: sf_pro_display_bold,
//                       fontSize: 14,
//                       color: black_273433),
//                 ),
//                 subtitle: Text(
//                   '',
//                   style: TextStyle(
//                       fontFamily: sf_pro_display_medium,
//                       fontSize: 12,
//                       color: grey_96a6a3),
//                 ),
//               ),
//               Container(
//                   width: SizeConfig.screenWidth!,
//                   margin: EdgeInsets.only(
//                       bottom: SizeConfig.screenHeight! * 0.02
//                   ),
//                   padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal! * 4),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12),
//                       color: Colors.white,
//                       boxShadow: [
//                         BoxShadow(
//                             color: Color.fromRGBO(67, 67, 178, 0.08),
//                             offset: Offset(1, 1),
//                             blurRadius: 50,
//                             spreadRadius: 20),
//                       ]),
//                   child: ListView(
//                     shrinkWrap: true,
//                     primary: false,
//                     children: ListTile.divideTiles( //          <-- ListTile.divideTiles
//                         context: context,
//                         tiles: [
//                           ListTile(
//                             contentPadding: EdgeInsets.zero,
//                             title:  Text('Version',
//                               style: TextStyle(
//                                   fontFamily: sf_pro_display_medium,
//                                   color: black_273433,
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w500
//                               ),),
//                             trailing:  Icon(Icons.arrow_forward_ios_rounded,color: skygreen_24d39e,
//                               size: SizeConfig.blockSizeVertical! * 2.5 ,),
//                           ),
//                           ListTile(
//                             contentPadding: EdgeInsets.zero,
//                             title:  Text('Privacy & Terms Service',
//                               style: TextStyle(
//                                   fontFamily: sf_pro_display_medium,
//                                   color: black_273433,
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w500
//                               ),),
//                             trailing:  Icon(Icons.arrow_forward_ios_rounded,color: skygreen_24d39e,
//                               size: SizeConfig.blockSizeVertical! * 2.5 ,),
//                           ),
//                           ListTile(
//                             contentPadding: EdgeInsets.zero,
//                             title:  Text('Cookie Policy & Location Data',
//                               style: TextStyle(
//                                   fontFamily: sf_pro_display_medium,
//                                   color: black_273433,
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w500
//                               ),),
//                             trailing:  Icon(Icons.arrow_forward_ios_rounded,color: skygreen_24d39e,
//                               size: SizeConfig.blockSizeVertical! * 2.5 ,),
//                           ),
//                         ]
//                     ).toList(),
//                   )
//               ),
//             ],
//           ),
//         ),
//       ),
//     ));
//   }
// }
