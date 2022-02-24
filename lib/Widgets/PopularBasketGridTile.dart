import 'package:flutter/material.dart';
import 'package:groceryboouser/Styles/my_colors.dart';
import 'package:groceryboouser/Styles/my_icons.dart';
import 'package:groceryboouser/Utilities/Constant.dart';
import 'package:groceryboouser/Utils/SizeConfig.dart';


Widget popularBasketGridTile(BuildContext context){
  SizeConfig().init(context);
  return Card(
    color: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight * 0.22,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(image: AssetImage('assets/images/bottle.png'),
                      fit: BoxFit.cover)
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 2.5,
              top: SizeConfig.screenHeight * 0.18),
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text('Purchase now',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontFamily: sf_pro_display_semibold

                ),),
            ),
          ],
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
              Text('Anne Baker Birthday',
              style: TextStyle(
                fontFamily: sf_pro_display_medium,
                fontSize: 14,
                color: black_273433
              ),),
              SizedBox(height: SizeConfig.blockSizeVertical,),
              Text('\$150',
                style: TextStyle(
                    fontFamily: sf_pro_display_bold,
                    fontSize: 14,
                    color: black_273433
                ),),
              SizedBox(height: SizeConfig.blockSizeVertical,),
              Stack(
                children: [
                  Container(
                    height:SizeConfig.blockSizeVertical * 3,
                    width: SizeConfig.blockSizeHorizontal * 7,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white),
                        image: DecorationImage(image: AssetImage(watermelon))
                    ),
                  ),
                  Container(
                    height:SizeConfig.blockSizeVertical * 3,
                    width: SizeConfig.blockSizeHorizontal * 7,
                    margin: EdgeInsets.only(
                      left: SizeConfig.blockSizeHorizontal * 3.5
                    ),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white),
                        image: DecorationImage(image: AssetImage(watermelon))
                    ),
                  ),
                  Container(
                    height:SizeConfig.blockSizeVertical * 3,
                    width: SizeConfig.blockSizeHorizontal * 7,
                    margin: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal * 7
                    ),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white),
                        color: Colors.black,
                    ),
                    child: Icon(Icons.more_horiz,color: Colors.white,size: SizeConfig.blockSizeVertical * 2),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: SizeConfig.screenWidth * 0.15,
                      top: SizeConfig.blockSizeVertical * 0.5
                    ),
                    child: Text('3K pinned this',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: sf_pro_display_regular,
                      color: grey_96a6a3
                    ),),
                  ),

                ],
              ),
            ],
          ),
        ),

      ],
    ),
  );
}
