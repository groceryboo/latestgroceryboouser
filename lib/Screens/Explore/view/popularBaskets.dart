import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:groceryboouser/Layouts/ToolbarWithHeader.dart';
import 'package:groceryboouser/Utils/SizeConfig.dart';
import 'package:groceryboouser/Widgets/PopularBasketGridTile.dart';
import 'package:groceryboouser/Widgets/SearchBar.dart';

import '../../../Styles/my_colors.dart';
import '../../../Styles/my_icons.dart';
import '../../../Utilities/Constant.dart';

class PopularBaskets extends StatefulWidget {
  const PopularBaskets({Key key}) : super(key: key);

  @override
  _PopularBasketsState createState() => _PopularBasketsState();
}

class _PopularBasketsState extends State<PopularBaskets> {


  bool checkFillColor = true;
  bool active = false;
  TextEditingController searchC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(child: Scaffold(
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
              ToolbarWithHeader('Popular Basket', false),
              SearchBar(),
              Divider(color: grey_e9ecec,),
              GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                  childAspectRatio: 0.6,
                  crossAxisSpacing: SizeConfig.blockSizeHorizontal*2,
                mainAxisSpacing: SizeConfig.blockSizeVertical * 2
              ), itemBuilder: (context,i){
                return popularBasketGridTile(context);
              },
              itemCount: 6,
              shrinkWrap: true,
              primary: false,)

            ],
          ),
        ),
      ),
    ));
  }
}
