// import 'package:flutter/material.dart';
// import 'package:groceryboouser/Screens/AllSet.dart';
// import 'package:groceryboouser/Screens/UsernamePswdProfile/view/FollowFriendsView.dart';
// import 'package:groceryboouser/Screens/UsernamePswdProfile/view/SyncContactsView.dart';
// import 'package:groceryboouser/Screens/UsernamePswdProfile/view/AddProfilePhotoView.dart';
// import 'package:groceryboouser/Styles/my_colors.dart';
//
// class FoureStep extends StatefulWidget {
//   @override
//   _FoureStepState createState() => _FoureStepState();
// }
//
// class _FoureStepState extends State<FoureStep> with SingleTickerProviderStateMixin {
//   late Animation<double> _progressAnimation;
//   late AnimationController _progressAnimcontroller;
//   double beginWidth=0;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _progressAnimcontroller = AnimationController(
//       duration: Duration(milliseconds: 200),
//       vsync: this,
//     );
//
//     _progressAnimation = Tween<double>(begin: beginWidth, end: endWidth)
//         .animate(_progressAnimcontroller);
//
//     _setProgressAnim(0, 1);
//   }
//
//   late double growStepWidth, endWidth = 1;
//   int totalPages = 4;
//
//   _setProgressAnim(double maxWidth, int curPageIndex) {
//     setState(() {
//       growStepWidth = maxWidth / totalPages;
//       beginWidth = growStepWidth * (curPageIndex - 1);
//       endWidth = growStepWidth * curPageIndex;
//
//       _progressAnimation = Tween<double>(begin: beginWidth, end: endWidth)
//           .animate(_progressAnimcontroller);
//     });
//
//     _progressAnimcontroller.reset();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var mediaQD = MediaQuery.of(context);
//     var maxWidth = mediaQD.size.width;
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         children: [
//           Padding(
//             padding:  EdgeInsets.only(top: 25,left: 24,right: 24),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(height: 25,),
//                 BackLayout(),
//                 SizedBox(height: 20,),
//                 Row(
//                   children: <Widget>[
//                     AnimatedProgressBar(
//                       animation: _progressAnimation,
//                     ),
//                     Expanded(
//                       child: Container(
//                         height: 7.0,
//                         width: double.infinity,
//                         decoration: BoxDecoration(color: grey_e9ecec,
//                             borderRadius: BorderRadius.only(topRight:  Radius.circular(6),bottomRight: Radius.circular(6))),
//                       ),
//                     )
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             flex: 1,
//             child: PageView(
//               onPageChanged: (i) {
//                 //index i starts from 0!
//                 _progressAnimcontroller.forward(); //reset the animation first
//                 _setProgressAnim(maxWidth, i + 1);
//               },
//               children: <Widget>[
//                AddProfilePhoto(),
//                 SyncContacts(),
//                 FollowFriends(),
//                 AllSet()
//
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class AnimatedProgressBar extends AnimatedWidget {
//   // AnimatedProgressBar({Key? key, required Animation<double> animation})
//   //     : super(key: key, listenable: animation);
//   //
//   // Widget build(BuildContext context) {
//   //   Animation<double> animation = listenable;
//   //
//   //   return Container(
//   //     height: 7.0,
//   //     width: animation.value,
//   //     decoration: BoxDecoration(color: green_24d39e,
//   //         borderRadius: BorderRadius.circular(6)),
//   //   );
//   // }
//
//   const AnimatedProgressBar({
//     Key? key,
//     required Animation<double> animation, // Now required and cannot be null
//   }) : super(
//     key: key,
//     listenable: animation, // No need to cast anymore
//   );
//
//   @override
//   Widget build(BuildContext context) {
//     final animation = listenable as Animation<double>; // Still need to cast here
//     return Container(
//       height: 6.0,
//       width: animation.value,
//       decoration: const BoxDecoration(color: Colors.white),
//     );
//   }
//
// }