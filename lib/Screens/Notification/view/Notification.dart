// import 'package:flutter/material.dart';
// import 'package:groceryboouser/Styles/my_colors.dart';
// import 'package:groceryboouser/Utilities/Constant.dart';
// import '../../../Model/ItemModel.dart';
//
// class NotificationList extends StatefulWidget {
//   const NotificationList({Key key}) : super(key: key);
//
//   @override
//   _NotificationState createState() => _NotificationState();
//
// }
//
// class _NotificationState extends State<NotificationList> {
//
//   List _dummydata=[
//     {
//       "albumId": 1,
//       "id": 1,
//       "title": "Esito brown pinned",
//       "url": "https://via.placeholder.com/600/92c952",
//       "thumbnailUrl": "https://via.placeholder.com/150/92c952",
//       "author": "Haanth",
//       "date": "18/02/2022",
//       "group": "New Activity"
//     },
//     {
//       "albumId": 1,
//       "id": 2,
//       "title": "Esito brown pinned",
//       "url": "https://via.placeholder.com/600/771796",
//       "thumbnailUrl": "https://via.placeholder.com/150/771796",
//       "author": "Paach",
//       "date": "22/02/2022",
//       "group": "Today"
//     },
//
//   ];
//
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//           backgroundColor: Colors.white,
//           body: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//
//               Expanded(
//                 flex: 1,
//                 child: Container(
//
//                   color: grey_e9ecec,
//                   child: GroupedListView<dynamic, String>(
//                     elements: _dummydata,
//                     groupBy: (element) => element['group'],
//                     groupSeparatorBuilder: (String groupByValue) => Padding(
//                       padding: EdgeInsets.all(10),
//                       child: Row(
//                         children: [
//                           Flexible(
//                               child: Row(
//                                 children: [
//                                   Container(
//                                     margin:EdgeInsets.only(left: 10,right: 10),
//                                     child: Text(
//                                       groupByValue,
//                                       textAlign: TextAlign.start,
//                                       style: TextStyle(
//                                         fontFamily: sf_pro_display_bold,
//                                         fontSize: 18,
//                                         color: black_273433
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                           )
//                           )
//                         ],
//                       ) ,
//                     ),
//                     itemBuilder: (context, dynamic element) {
//                       return Padding(
//                         padding: const EdgeInsets.only(left: 18,right: 18,top: 15,bottom: 8),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(5),
//                             color: Colors.white
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 SizedBox(
//                                   height:50,
//                                     width: 50,
//                                     child: Image.network( element["thumbnailUrl"],)),
//                                 Column(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(element["title"],style: TextStyle(
//                                       fontSize: 15,fontFamily: sf_pro_display_medium,
//                                       color: black_273433
//                                     ),),
//
//                                     Row(
//                                       mainAxisAlignment: MainAxisAlignment.start,
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         Text(element["author"],style: TextStyle(
//                                             fontSize: 12.5,fontFamily: sf_pro_display_regular,
//                                             color: black_273433
//                                         ),),
//                                         Text(element["date"],style: TextStyle(
//                                             fontSize: 12.5,fontFamily: sf_pro_display_regular,
//                                             color: grey_e9ecec
//                                         ),),
//                                       ],
//                                     )
//
//                                   ],
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                     itemComparator: (item1, item2) => item1['title'].compareTo(item2['title']), // optional
//                     useStickyGroupSeparators: true, // optional
//                     floatingHeader: true, // optional
//                     order: GroupedListOrder.ASC, // optional
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ));
//   }
// }
//
// class GroupListViewPage extends StatefulWidget {
//   const GroupListViewPage({Key key}) : super(key: key);
//
//   @override
//   _GroupListViewPageState createState() => _GroupListViewPageState();
// }
//
// class _GroupListViewPageState extends State<GroupListViewPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//
//         ],
//       ),
//     );
//   }
// }
//
