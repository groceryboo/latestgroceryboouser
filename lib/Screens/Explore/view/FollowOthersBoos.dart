import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:groceryboouser/Utils/SizeConfig.dart';
import 'package:groceryboouser/Widgets/FollowPeopleTile.dart';
import 'package:groceryboouser/Widgets/SearchBar.dart';

import '../../../Layouts/ToolbarWithHeader.dart';
import '../../../Styles/my_colors.dart';
import '../../../Styles/my_icons.dart';
import '../../../Utilities/Constant.dart';
import '../../../Widgets/RecentOrderListTile.dart';

class FollowOtherBoos extends StatefulWidget {
  const FollowOtherBoos({Key key}) : super(key: key);

  @override
  _FollowOtherBoosState createState() => _FollowOtherBoosState();
}

class _FollowOtherBoosState extends State<FollowOtherBoos> {

  bool checkFillColor = true;
  bool active = false;
  TextEditingController searchC = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return  SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: SizeConfig.screenWidth * 0.05,
              vertical: SizeConfig.screenHeight  * 0.02
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ToolbarWithHeader('Recent orders', false),
              SearchBar(),
              Divider(
                color: grey_e9ecec,
                thickness: 0.5,
              ),
              SizedBox(height: SizeConfig.blockSizeVertical * 2,),
              ListView.builder(itemBuilder: (context,i){
                return followOtherPeopleTile(context);
              },
                primary: false,
                shrinkWrap: true,
                itemCount: 8,
              )
            ],
          ),
        ),
      ),
    ));
  }
}
