import 'package:flutter/material.dart';

import '../../../Model/FollowFriendModel.dart';
import '../../../Styles/my_colors.dart';
import '../../../Utilities/Constant.dart';
import '../../../Utils/SizeConfig.dart';



class UserTab extends StatefulWidget {
  //const UserTab({Key? key}) : super(key: key);

  @override
  _UserTabState createState() => _UserTabState();
}

class _UserTabState extends State<UserTab> {

  List<FollowFriendModel> onFollowFriendModel = [
    FollowFriendModel('assets/images/fruit.png', 'Fruit'),
    FollowFriendModel('assets/images/cold_drink.png', 'Cold Drink'),
    FollowFriendModel('assets/images/fruit.png', 'Fruit'),
    FollowFriendModel('assets/images/cold_drink.png', 'Cold Drink'),
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListView.builder(
              scrollDirection: Axis.vertical,
              physics: ClampingScrollPhysics(),
              primary: false,
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 0,right: 0),
              itemCount: onFollowFriendModel.length,
              itemBuilder: (context, i) => Container(
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
                child:Padding(
                  padding: const EdgeInsets.only(left: 16,right: 16,top: 21,bottom: 21),
                  child: Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(image: AssetImage(onFollowFriendModel[i].title))),
                      ),

                      SizedBox(width: 10,),
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  onFollowFriendModel[i].subtitle,
                                  style: TextStyle(
                                      fontFamily: sf_pro_display_semibold,
                                      color: black_273433,
                                      fontSize: 14),
                                ),

                                SizedBox(width: 4,),

                                Container(
                                  decoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
                                  padding: EdgeInsets.all(2),
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: SizeConfig.blockSizeVertical,
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 4,),

                            Text('Ariana Venti',
                              style: TextStyle(
                                fontFamily: sf_pro_display_regular,
                                fontSize: 14,
                                color: grey_96a6a3,
                              ),),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.blockSizeHorizontal,
                      ),

                      MaterialButton(
                        onPressed: () {},
                        color: skygreen_24d39e,
                        padding: EdgeInsets.zero,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: BorderSide(color: skygreen_24d39e)),
                        child: Text(
                          'Follow',
                          style: TextStyle(
                              color: Colors.white, fontSize: 12, fontFamily: sf_pro_display_bold),
                        ),
                        height: SizeConfig.blockSizeVertical * 4,
                        minWidth: SizeConfig.screenWidth * 0.2,
                      ),

                    ],
                  ),
                ),
              )
          )
        ],
      ),
    );
  }
}
