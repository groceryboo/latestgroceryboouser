import 'dart:io';

import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:groceryboouser/Screens/ProfileInfo/controller/UserProfileController.dart';
import 'package:groceryboouser/Utils/common_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'EditProfileView.dart';
import 'FollowerlistTabBarView.dart';
import '../../../Styles/my_icons.dart';
import '../../../Utils/SizeConfig.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  UserMyProfileController con = Get.put(UserMyProfileController());

  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // controller.profileModel.value.toString() == "Instance of 'SigninModel'" ? CircularProgressIndicator():
              Stack(
                children: [
                  Container(
                      padding: EdgeInsets.all(20),
                      width: SizeConfig.screenWidth,
                      height: SizeConfig.screenHeight * 0.25,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://www.tripsavvy.com/thmb/xa76ixNK6kS3ZmR3wXP-qeHGuYg=/7315x4879/filters:fill(auto,1)/GettyImages-713841743-58f7d69d5f9b581d5982ee97.jpg"),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                  Colors.black45, BlendMode.darken))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                              Text(
                                con.userNameText.value,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800),
                              ),
                              PopupMenuButton(
                                  padding: EdgeInsets.only(bottom: 20),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  icon: Icon(Icons.more_horiz,
                                      color: Colors.white),
                                  itemBuilder: (context) => [
                                        PopupMenuItem(
                                          child: Text(
                                            "My Collections",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          value: 1,
                                        ),
                                        PopupMenuItem(
                                          child: Text("Settings",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500)),
                                          value: 2,
                                        ),
                                        PopupMenuItem(
                                          child: Text("Boost",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500)),
                                          value: 2,
                                        ),
                                        PopupMenuItem(
                                          child: Text("Advertisement",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500)),
                                          value: 2,
                                        )
                                      ]),
                            ],
                          ),
                          Align(
                              alignment: Alignment.bottomRight,
                              child: InkWell(
                                onTap: () async {
                                  final XFile photo = await _picker.pickImage(
                                      source: ImageSource.camera);
                                },
                                child: CircleAvatar(
                                    backgroundColor: Colors.black,
                                    child: Icon(
                                      Icons.camera_enhance_rounded,
                                      color: Colors.white,
                                    )),
                              ))
                        ],
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: SizeConfig.screenHeight * 0.21,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: SizeConfig.blockSizeVertical * 12,
                                width: SizeConfig.blockSizeHorizontal * 42,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: SweepGradient(
                                    colors: [
                                      Color(0xff2ad0ca),
                                      Color(0xffe1f664),
                                      Color(0xfffeb0fe),
                                      Color(0xffabb3fc),
                                      Color(0xff5df7a4),
                                      Color(0xff58c4f6),
                                    ],
                                    tileMode: TileMode.mirror,
                                  )),
                              child: SizedBox(
                                height: 79,
                                width: 79,
                                child: con.strImage.value != null ?
                                CircularProfileAvatar(
                                  '',
                                  imageFit: BoxFit.fill,
                                  child:
                                  Image.network(con.strImage.value, fit: BoxFit.fill,
                                    alignment: Alignment.center,
                                    width: 75,
                                    height: 75,),
                                ) : Image.network(
                                    "https://www.tripsavvy.com/thmb/xa76ixNK6kS3ZmR3wXP-qeHGuYg=/7315x4879/filters:fill(auto,1)/GettyImages-713841743-58f7d69d5f9b581d5982ee97.jpg"),
                              ),
                            ),
                            // Container(
                            //   height: SizeConfig.blockSizeVertical * 12,
                            //   width: SizeConfig.blockSizeHorizontal * 42,
                            //   decoration: BoxDecoration(
                            //     shape: BoxShape.circle,
                            //     gradient: LinearGradient(
                            //       begin: Alignment.topLeft,
                            //       end: Alignment.bottomRight,
                            //       colors: [
                            //         Color(0xFF2AD0CA),
                            //         Color(0xFFE1F664),
                            //         Color(0xFFFEB0FE),
                            //         Color(0xFFABB3FC),
                            //         Color(0xFF5DF7A4),
                            //         Color(0xFF58C4F6),
                            //       ],
                            //       tileMode: TileMode.mirror,
                            //     ),
                            //   ),
                            //   child: con.strImage.value != null
                            //       ? SizedBox(
                            //           height: SizeConfig.blockSizeVertical * 8,
                            //           width:
                            //               SizeConfig.blockSizeHorizontal * 20,
                            //           child: CircleAvatar(
                            //               radius: 50,
                            //               backgroundColor: Colors.transparent,
                            //               child: ClipRRect(
                            //                   borderRadius:
                            //                       BorderRadius.circular(50.0),
                            //                   child: Image.network(
                            //                       con.strImage.value))))
                            //       : Image.network(
                            //           "https://www.tripsavvy.com/thmb/xa76ixNK6kS3ZmR3wXP-qeHGuYg=/7315x4879/filters:fill(auto,1)/GettyImages-713841743-58f7d69d5f9b581d5982ee97.jpg"),
                            // ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: SizeConfig.blockSizeVertical * 3),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              FollowTabBar()));
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      con.followersText.value,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 16),
                                    ),
                                    Text("Followers",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w800)),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: SizeConfig.blockSizeHorizontal * 12,
                            ),
                            InkWell(
                              onTap: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FollowTabBar()))
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: SizeConfig.blockSizeVertical * 3),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      con.followingText.value,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 16),
                                    ),
                                    Text(
                                      "Following",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w800),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: 20, left: SizeConfig.blockSizeVertical * 3),
                        child: Text(
                          con.fullNameText.value,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: 10, left: SizeConfig.blockSizeVertical * 3),
                        child: Text(
                          con.bioText.value,
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: 5, left: SizeConfig.blockSizeVertical * 3),
                        child: Text(
                          con.websiteText.value,
                          style: TextStyle(
                              fontSize: 14,
                              color: Color(0XFF24d39e),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: SizeConfig.blockSizeVertical * 2,
                            vertical: SizeConfig.blockSizeVertical * 1),
                        child: ElevatedButton(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: SizeConfig.blockSizeVertical * 1.5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.person_outline_rounded,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text("Edit Profile")
                                ],
                              ),
                            ),
                            style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color(0XFF24d39e)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        side: BorderSide(
                                            color: Color(0XFF24d39e))))),
                            onPressed: () {
                              imagePath = File("");

                              // Get.to(() => EditProfile());

                              Navigator.of(context)
                                  .push(
                                    new MaterialPageRoute(
                                        builder: (_) => new EditProfile()),
                                  )
                                  .then((val) => con.userInfoModel());
                            }),
                      ),
                    ],
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * 0.05,
                    vertical: SizeConfig.blockSizeVertical),
                child: StaggeredGrid.count(
                  crossAxisCount: 4,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  children: [
                    StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 2,
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.asset(
                              fruit,
                              fit: BoxFit.cover,
                            ),
                          )),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1,
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.asset(
                              watermelon,
                              fit: BoxFit.cover,
                            ),
                          )),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1,
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.asset(
                              orange_img,
                              fit: BoxFit.cover,
                            ),
                          )),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 1,
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.asset(
                              lemon,
                              fit: BoxFit.cover,
                            ),
                          )),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 4,
                      mainAxisCellCount: 2,
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.asset(
                              girl,
                              fit: BoxFit.cover,
                            ),
                          )),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
