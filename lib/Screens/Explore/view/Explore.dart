import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:groceryboouser/Screens/Explore/view/FollowOthersBoos.dart';
import 'package:groceryboouser/Screens/Explore/view/popularBaskets.dart';
import 'package:groceryboouser/Screens/Explore/view/RecentOrders.dart';
import 'package:groceryboouser/Styles/my_colors.dart';
import 'package:groceryboouser/Styles/my_icons.dart';
import 'package:groceryboouser/Utilities/Constant.dart';
import 'package:groceryboouser/Utils/SizeConfig.dart';
import 'package:groceryboouser/Widgets/RecentOrderListTile.dart';
import '../../../Widgets/FollowPeopleTile.dart';
import '../../../Widgets/PopularBasketGridTile.dart';


class Explore extends StatefulWidget {
  const Explore({Key key}) : super(key: key);

  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {

  bool checkFillColor = true;
  bool active = false;
  TextEditingController searchC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Explore',
            style: TextStyle(
              color: black_273433,
              fontFamily: sf_pro_display_bold,
              fontSize: 26
            ),),
            Row(
              children: [
                Stack(children: [
                  SvgPicture.asset(message_icon),
                  Container(
                    margin: EdgeInsets.only(
                      left: SizeConfig.blockSizeHorizontal * 4,),
                    decoration: BoxDecoration(
                      color: red_FA586A,
                      shape: BoxShape.circle,
                    ),
                    padding: EdgeInsets.all(5),
                    child: Text('4',
                    style: TextStyle(
                      fontSize: 8
                    ),),
                  ),
                ],),
                SizedBox(width: SizeConfig.blockSizeHorizontal * 4,),
                SvgPicture.asset(notification_icon),
                SizedBox(width: SizeConfig.blockSizeHorizontal * 4,),
                SvgPicture.asset(wallet_icon),
              ],
            ),
          ],
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,

      ),
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
              Container(
                margin: EdgeInsets.only(bottom: SizeConfig.blockSizeVertical),
                decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.all(Radius.circular(6.7)),
                    color: grey_e9ecec),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset(
                      search,
                      color: grey_96a6a3,
                      width: 15,
                      height: 15,
                    ),
                    SizedBox(
                      width: 7.7,
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: new TextField(
                          style: const TextStyle(
                              color: black,
                              fontFamily: sf_pro_display_medium,
                              fontStyle: FontStyle.normal,
                              fontSize: 12),
                          decoration: new InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 0, vertical: 10),
                            hintText:
                            "Search for a product, brand...",
                            hintStyle: TextStyle(
                                color: grey_96a6a3,
                                // fontWeight: FontWeight.w500,
                                fontFamily: sf_pro_display_medium,
                                /*akib changes*/
                                fontStyle: FontStyle.normal,
                                fontSize: 12),
                            /*akib changes*/
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.text,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Recent orders',
                  style: TextStyle(
                    fontFamily: sf_pro_display_bold,
                    fontSize: 18,
                    color: black_273433
                  ),),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return RecentOrders();
                      }));
                    },
                    child: Text('See all',
                      style: TextStyle(
                          fontFamily: sf_pro_display_medium,
                          fontSize: 14,
                          color: grey_96a6a3
                      ),),
                  )
                ],
              ),
              SizedBox(height: SizeConfig.blockSizeVertical * 2,),
              RecentOrderListTile(),
              SizedBox(height: SizeConfig.blockSizeVertical * 2,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Popular baskets',
                    style: TextStyle(
                        fontFamily: sf_pro_display_bold,
                        fontSize: 18,
                        color: black_273433
                    ),),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return PopularBaskets();
                      }));
                    },
                    child: Text('See all',
                      style: TextStyle(
                          fontFamily: sf_pro_display_medium,
                          fontSize: 14,
                          color: grey_96a6a3
                      ),),
                  )
                ],
              ),
              SizedBox(height: SizeConfig.blockSizeVertical * 2,),
              GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
                crossAxisSpacing: SizeConfig.blockSizeHorizontal*2
              ),
                shrinkWrap: true,
                primary: false,
                children: [
                 popularBasketGridTile(context),
                 popularBasketGridTile(context),
                ],
              ),
              SizedBox(height: SizeConfig.blockSizeVertical * 2,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Follow other boos',
                    style: TextStyle(
                        fontFamily: sf_pro_display_bold,
                        fontSize: 18,
                        color: black_273433
                    ),),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return FollowOtherBoos();
                      }));
                    },
                    child: Text('See all',
                      style: TextStyle(
                          fontFamily: sf_pro_display_medium,
                          fontSize: 14,
                          color: grey_96a6a3
                      ),),
                  )
                ],
              ),
              SizedBox(height: SizeConfig.blockSizeVertical * 2,),
              ListView.builder(itemBuilder: (context,i){
                return Container(
                  margin: EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 2),
                  child: followOtherPeopleTile(context),
                );
              },
              shrinkWrap: true,
              primary: false,
              itemCount: 3,)
            ],
          ),
        ),
      ),
    ));
  }
}
