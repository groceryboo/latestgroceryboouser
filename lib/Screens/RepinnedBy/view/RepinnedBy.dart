import 'package:flutter/material.dart';
import 'package:groceryboouser/Layouts/ToolbarWithHeader.dart';
import 'package:groceryboouser/Styles/my_colors.dart';
import 'package:groceryboouser/Utils/SizeConfig.dart';
import 'package:groceryboouser/Widgets/SearchBar.dart';
import 'package:groceryboouser/Widgets/repinned_tile.dart';

class RePinnedBy extends StatefulWidget {
  const RePinnedBy({Key key}) : super(key: key);

  @override
  _RePinnedByState createState() => _RePinnedByState();
}

class _RePinnedByState extends State<RePinnedBy> {

  bool checkFillColor = true;
  bool active = false;
  TextEditingController searchC = TextEditingController();
  List<bool> follow = [false,true,false];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(child: Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: SizeConfig.screenWidth * 0.05,
          vertical: SizeConfig.screenHeight * 0.05
      ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ToolbarWithHeader('Repinned By', false),
            Divider(color: grey_e9ecec,),
            SearchBar(),
            ListView.builder(itemBuilder: (context,i){
              return Container(
                margin: EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 2),
                child: RePinnedTile(follow: follow[i],),
              );
            },
            shrinkWrap: true,
              primary: false,
              itemCount: follow.length,
            )

          ],
        ),
    )));
  }
}
