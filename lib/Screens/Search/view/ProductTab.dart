import 'package:flutter/material.dart';

import '../../../Model/FollowFriendModel.dart';
import '../../../Styles/my_colors.dart';
import '../../../Utilities/Constant.dart';
import '../../../Utils/SizeConfig.dart';


class ProductTab extends StatefulWidget {
  //const ProductTab({Key? key}) : super(key: key);

  @override
  _ProductTabState createState() => _ProductTabState();
}

class _ProductTabState extends State<ProductTab> {

  List<FollowFriendModel> onPopularBasketModel = [
    FollowFriendModel('assets/images/fruit.png', 'Boo Energy Drink'),
    FollowFriendModel('assets/images/fruit.png', 'Boo Energy Drink'),
    FollowFriendModel('assets/images/fruit.png', 'Boo Energy Drink'),
    FollowFriendModel('assets/images/fruit.png', 'Boo Energy Drink'),
    FollowFriendModel('assets/images/fruit.png', 'Boo Energy Drink'),
    FollowFriendModel('assets/images/fruit.png', 'Boo Energy Drink'),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GridView.builder(
              primary: false,
              shrinkWrap: true,
              padding: EdgeInsets.all(0),
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 15.0),
              itemCount: onPopularBasketModel.length,
              itemBuilder: (context, i) => Card(
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
                          Text("Bunny",
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
              )
          )
        ],
      ),
    );
  }
}
