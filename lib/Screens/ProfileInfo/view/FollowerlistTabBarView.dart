import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groceryboouser/Layouts/ToolbarWithHeader.dart';
import 'package:groceryboouser/Screens/ProfileInfo/controller/FollowerFollowingController.dart';
import 'package:groceryboouser/Widgets/SearchBar.dart';
import '../../../Styles/my_colors.dart';
import '../../../Styles/my_icons.dart';
import '../../../Utilities/Constant.dart';
import '../../../Utils/SizeConfig.dart';


class FollowTabBar extends StatefulWidget {
  @override
  _FollowTabBarState createState() => _FollowTabBarState();
}

class _FollowTabBarState extends State<FollowTabBar>
    with SingleTickerProviderStateMixin {

  TabController _tabController;
  FollowerFollowingController controller = Get.put(FollowerFollowingController());

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    // await controller.clearFollowingList();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            body: SingleChildScrollView(
              child: Obx(
                  ()=> Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * 0.05,
                      vertical: SizeConfig.screenHeight * 0.02),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ToolbarWithHeader('Marrianeros', false),
                      Divider(
                        color: grey_e9ecec,
                        thickness: 0.5,
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: gray_f3f6f6,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TabBar(
                          tabs: [
                            Tab(
                              child: Text(
                                controller.strFollowers.value + ' Followers',
                                style: TextStyle(
                                  fontFamily: sf_pro_display_bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Tab(
                              child: Text(
                                controller.strFollowing.value + ' Following',
                                style: TextStyle(
                                  fontFamily: sf_pro_display_bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                          indicator: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          unselectedLabelColor: grey_96a6a3,
                          labelColor: black_273433,
                        ),
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical * 2,),
                      SearchBar(),
                      SizedBox(
                        height: SizeConfig.screenHeight * 0.6,
                        child: TabBarView(children: [
                          ListView.builder(itemBuilder: (context,i){
                            return Container(
                              margin: EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 2),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey[200],
                                      blurRadius: 2,
                                      spreadRadius: 0.5,

                                    ),
                                  ]
                              ),
                              child: controller.followingList.value.length < 0 ?
                              ListTile(
                                dense: true,
                                onTap: (){},
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                tileColor: Colors.white,
                                contentPadding: EdgeInsets.all(5),
                                leading: Container(
                                  width: SizeConfig.screenWidth * 0.15,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(image: AssetImage(orange_img))),
                                ),
                                title: Row(
                                  children: [
                                    Text(
                                      controller.followersList[i].firstName,
                                      style: TextStyle(
                                          fontFamily: sf_pro_display_semibold,
                                          color: black_273433,
                                          fontSize: 14),
                                    ),
                                    SizedBox(
                                      width: SizeConfig.blockSizeHorizontal,
                                    ),

                                  ],
                                ),
                                trailing:  MaterialButton(onPressed: (){
                                  if(controller.followersList[i].isFollow == 0)
                                    setState(() {
                                      controller.followersList[i].isFollow = 1;
                                      controller.unfollowUserAPI(controller.followersList[i].id.toString(),context);
                                    });
                                  else
                                    setState(() {
                                      controller.followersList[i].isFollow = 0;
                                      controller.followUserAPI(controller.followersList[i].id.toString(),context);
                                    });
                                },
                                  elevation: 0,

                                  color: controller.followersList[i].isFollow==1 ? grey_e9ecec : skygreen_24d39e,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),),
                                  child: Text(controller.followersList[i].isFollow==1 ? 'Following' : 'Follow',
                                    style: TextStyle(
                                        color: controller.followersList[i].isFollow==1 ? skygreen_24d39e : Colors.white,
                                        fontSize: 12,
                                        fontFamily: sf_pro_display_bold
                                    ),),
                                  minWidth: SizeConfig.screenWidth * 0.15,
                                  height: SizeConfig.blockSizeVertical * 4,
                                ),
                                // trailing: MaterialButton(
                                //   onPressed: () {},
                                //   color: grey_e9ecec,
                                //   elevation: 0,
                                //   padding: EdgeInsets.zero,
                                //   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                //   shape: RoundedRectangleBorder(
                                //     borderRadius: BorderRadius.circular(30),),
                                //   child: Text(
                                //     'Following',
                                //     style: TextStyle(
                                //         color: skygreen_24d39e, fontSize: 12, fontFamily: sf_pro_display_bold),
                                //   ),
                                //   height: SizeConfig.blockSizeVertical * 4,
                                //   minWidth: SizeConfig.screenWidth * 0.2,
                                // ),
                                subtitle: Text(controller.followersList[i].firstName,
                                  style: TextStyle(
                                    fontFamily: sf_pro_display_regular,
                                    fontSize: 14,
                                    color: grey_96a6a3,
                                  ),),
                              ) : Center(child: Text("There is nothing to show")),
                            );
                          },
                            shrinkWrap: true,
                            itemCount: controller.followersList.length,
                            primary: false,
                          ),
                          ListView.builder(itemBuilder: (context,i){
                            return Container(
                              margin: EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 2),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey[200],
                                      blurRadius: 2,
                                      spreadRadius: 0.5,

                                    ),
                                  ]
                              ),
                              child: controller.followingList.value.length < 0 ?
                              ListTile(
                                dense: true,
                                onTap: (){},
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                tileColor: Colors.white,
                                contentPadding: EdgeInsets.all(5),
                                leading: Container(
                                  width: SizeConfig.screenWidth * 0.15,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(image: AssetImage(orange_img))),
                                ),
                                title: Row(
                                  children: [
                                    Text(
                                controller.followingList[i].firstName,
                                      style: TextStyle(
                                          fontFamily: sf_pro_display_semibold,
                                          color: black_273433,
                                          fontSize: 14),
                                    ),
                                    SizedBox(
                                      width: SizeConfig.blockSizeHorizontal,
                                    ),

                                  ],
                                ),
                                trailing:  MaterialButton(onPressed: (){
                                  if(controller.followingList[i].isFollow == 0)
                                    setState(() {
                                      controller.followingList[i].isFollow = 1;
                                      controller.unfollowUserAPI(controller.followingList[i].id.toString(),context);
                                    });
                                  else
                                    setState(() {
                                      controller.followingList[i].isFollow = 0;
                                      controller.followUserAPI(controller.followingList[i].id.toString(),context);
                                    });
                                },
                                  elevation: 0,

                                  color: controller.followingList[i].isFollow==1 ? grey_e9ecec : skygreen_24d39e,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),),
                                  child: Text(controller.followingList[i].isFollow==1 ? 'Following' : 'Follow',
                                    style: TextStyle(
                                        color: controller.followingList[i].isFollow==1 ? skygreen_24d39e : Colors.white,
                                        fontSize: 12,
                                        fontFamily: sf_pro_display_bold
                                    ),),
                                  minWidth: SizeConfig.screenWidth * 0.15,
                                  height: SizeConfig.blockSizeVertical * 4,
                                ),
                                // trailing: MaterialButton(
                                //   onPressed: () {},
                                //   color: grey_e9ecec,
                                //   elevation: 0,
                                //   padding: EdgeInsets.zero,
                                //   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                //   shape: RoundedRectangleBorder(
                                //     borderRadius: BorderRadius.circular(30),),
                                //   child: Text(
                                //     'Following',
                                //     style: TextStyle(
                                //         color: skygreen_24d39e, fontSize: 12, fontFamily: sf_pro_display_bold),
                                //   ),
                                //   height: SizeConfig.blockSizeVertical * 4,
                                //   minWidth: SizeConfig.screenWidth * 0.2,
                                // ),
                                subtitle: Text(controller.followingList[i].firstName,
                                  style: TextStyle(
                                    fontFamily: sf_pro_display_regular,
                                    fontSize: 14,
                                    color: grey_96a6a3,
                                  ),),
                              ) :
                              Center(child: Text("There is not data")),
                            );
                          },
                            shrinkWrap: true,
                            itemCount: controller.followingList.length,
                            primary: false,
                          ),

                        ],),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
