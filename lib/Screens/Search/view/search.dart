import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:groceryboouser/Utils/SizeConfig.dart';
import 'package:groceryboouser/Widgets/FollowPeopleTile.dart';
import 'package:groceryboouser/Widgets/PopularBasketGridTile.dart';
import 'package:groceryboouser/Widgets/SearchBar.dart';
import '../../../Layouts/ToolbarBackOnly.dart';
import '../../../Styles/my_colors.dart';
import '../../../Styles/my_icons.dart';
import '../../../Utilities/Constant.dart';


class Search extends StatefulWidget {
  const Search({Key key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  bool checkFillColor = true;
  bool active = false;
  TextEditingController searchC = TextEditingController();
  List<String> recentSearches = ['Water','Strawberry','Honey','Fruits','Soda','Chocolate','Riena','Ronald Fagundez'];
  List<String> productItems = ['Water','Strawberry','Honey','Fruits'];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
        child: DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: SizeConfig.screenWidth * 0.05,
                vertical: SizeConfig.screenHeight * 0.02),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BackLayout(),
                    SizedBox(child: SearchBar(),
                    width: SizeConfig.screenWidth * 0.75,),
                  ],
                ),
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(products),
                            SizedBox(
                              width: SizeConfig.blockSizeHorizontal,
                            ),
                            Text(
                              'Products',
                              style: TextStyle(
                                fontFamily: sf_pro_display_bold,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Tab(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(bag_black),
                            SizedBox(
                              width: SizeConfig.blockSizeHorizontal,
                            ),
                            Text(
                              'Baskets',
                              style: TextStyle(
                                fontFamily: sf_pro_display_bold,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Tab(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(person),
                            SizedBox(
                              width: SizeConfig.blockSizeHorizontal,
                            ),
                            Text(
                              'Users',
                              style: TextStyle(
                                fontFamily: sf_pro_display_bold,
                                fontSize: 12,
                              ),
                            ),
                          ],
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recent search',
                      style: TextStyle(
                          fontFamily: sf_pro_display_bold,
                          fontSize: 18,
                          color: black_273433),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'Clear all',
                        style: TextStyle(
                            fontFamily: sf_pro_display_medium,
                            fontSize: 14,
                            color: skygreen_24d39e),
                      ),
                    )
                  ],
                ),
                SizedBox(height: SizeConfig.blockSizeVertical * 2,),
                Wrap(
                  runSpacing: SizeConfig.blockSizeVertical,
                  spacing: SizeConfig.blockSizeHorizontal,
                  children: [
                    for(var i=0; i<recentSearches.length;i++)
                      Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(
                            color: grey_e9ecec,
                            width: 1,
                          )),
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            recentSearches[i],
                            style: TextStyle(
                                fontFamily: sf_pro_display_regular,
                                color: black_273433,
                                fontSize: 12),
                          ),
                          Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: grey_e9ecec,
                              shape: BoxShape.circle,
                            ),
                            child: SvgPicture.asset(x, color: grey_96a6a3),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  margin:EdgeInsets.symmetric(
                      vertical: SizeConfig.blockSizeVertical *2
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Result for water',
                        style: TextStyle(
                            fontFamily: sf_pro_display_bold,
                            fontSize: 18,
                            color: black_273433),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(36, 211, 158, 0.1),
                              borderRadius: BorderRadius.circular(40)
                          ),
                          padding: EdgeInsets.all(8),
                          child: Text(
                            '126 found',
                            style: TextStyle(
                                fontFamily: sf_pro_display_medium,
                                fontSize: 11,
                                color: skygreen_24d39e),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.6,
                  child: TabBarView(children: [
                    GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    mainAxisSpacing: SizeConfig.blockSizeVertical *2,
                    crossAxisSpacing: SizeConfig.blockSizeHorizontal * 3), itemBuilder: (context,i){
                      return Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),),
                        elevation: 5,
                        shadowColor: Color.fromRGBO(67, 67, 178, 0.08),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: SizeConfig.screenWidth,
                              height: SizeConfig.screenHeight * 0.15,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(image: AssetImage('assets/images/bottle.png'),
                                      fit: BoxFit.cover)
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: SizeConfig.blockSizeVertical,
                                  horizontal: SizeConfig.blockSizeHorizontal * 2
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(productItems[i],
                                    style: TextStyle(
                                        fontFamily: sf_pro_display_medium,
                                        fontSize: 14,
                                        color: black_273433
                                    ),),
                                  SizedBox(height: SizeConfig.blockSizeVertical,),
                                  Text('By weight , \$1.5/can',
                                    style: TextStyle(
                                        fontFamily: sf_pro_display_regular,
                                        fontSize: 11,
                                        color: grey_96a6a3
                                    ),),
                                  SizedBox(height: SizeConfig.blockSizeVertical,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('\$1.5',
                                        style: TextStyle(
                                            fontFamily: sf_pro_display_bold,
                                            fontSize: 14,
                                            color: black_273433
                                        ),),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: skygreen_24d39e,
                                          borderRadius: BorderRadius.circular(6)
                                        ),
                                        child: Icon(Icons.add,
                                          color: Colors.white,
                                        size: SizeConfig.blockSizeVertical * 2.5 ,),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      );
                    },
                    itemCount: productItems.length,
                    shrinkWrap: true,
                      primary: false,
                      physics: NeverScrollableScrollPhysics(),
                    ),
                    GridView.builder(gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                        childAspectRatio: 0.6,
                        crossAxisSpacing: SizeConfig.blockSizeHorizontal*2,
                      mainAxisSpacing: SizeConfig.blockSizeVertical
                    ), itemBuilder: (context,i){
                      return popularBasketGridTile(context);
                    },
                    shrinkWrap: true,
                    itemCount: 2,
                    primary: false,),
                    ListView.builder(itemBuilder: (context,i){
                      return followOtherPeopleTile(context);
                    },
                      shrinkWrap: true,
                      itemCount: 5,
                      physics: NeverScrollableScrollPhysics(),
                      primary: false,
                    ),

                  ],),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
