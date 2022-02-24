import 'package:flutter/material.dart';
import 'package:groceryboouser/Layouts/ToolbarWithHeader.dart';
import 'package:groceryboouser/Styles/my_colors.dart';
import 'package:groceryboouser/Utils/SizeConfig.dart';
import 'package:groceryboouser/Widgets/SearchBar.dart';
import 'package:groceryboouser/Widgets/pin_purchased.dart';

class TotalPinPurchased extends StatefulWidget {
  const TotalPinPurchased({Key key}) : super(key: key);

  @override
  _TotalPinPurchasedState createState() => _TotalPinPurchasedState();
}

class _TotalPinPurchasedState extends State<TotalPinPurchased> {

  bool checkFillColor = true;
  bool active = false;
  TextEditingController searchC = TextEditingController();
  List<bool> follow = [false,true,false];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: SizeConfig.screenWidth * 0.05,
              vertical: SizeConfig.screenHeight * 0.05
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ToolbarWithHeader('Total Pin Purchased', false),
              Divider(color: grey_e9ecec,),
              SearchBar(),
              SizedBox(height: SizeConfig.blockSizeVertical,),
              ListView.builder(itemBuilder: (context,i){
                return Container(
                  margin: EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 2),
                  child: PinPurchasedCard(follow: follow[i],),
                );
              },
              shrinkWrap: true,
              itemCount: follow.length,
              primary: false,
              )

            ],
          ),
        ),
      ),
    ));
  }
}
