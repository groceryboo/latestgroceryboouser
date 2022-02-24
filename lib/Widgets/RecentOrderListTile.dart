import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:groceryboouser/Styles/my_icons.dart';
import 'package:groceryboouser/Utilities/Constant.dart';
import 'package:groceryboouser/Utils/SizeConfig.dart';
import '../Styles/my_colors.dart';


class RecentOrderListTile extends StatefulWidget {
  const RecentOrderListTile({Key key}) : super(key: key);

  @override
  _RecentOrderListTileState createState() => _RecentOrderListTileState();
}

class _RecentOrderListTileState extends State<RecentOrderListTile> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Color.fromRGBO(67, 67, 178, 0.08), blurRadius: 2, spreadRadius: 1)
        ],
      ),
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 2),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                width: SizeConfig.screenWidth * 0.2,
                height: SizeConfig.blockSizeVertical * 9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image:
                  DecorationImage(image: AssetImage(fruit), fit: BoxFit.cover),
                ),
              ),
              Container(
                height: SizeConfig.blockSizeVertical * 2,
                width: SizeConfig.blockSizeHorizontal * 5,
                margin: EdgeInsets.only(
                  left: SizeConfig.blockSizeHorizontal * 14,
                  top: SizeConfig.blockSizeVertical
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromRGBO(18, 18, 18, 0.1),
                ),
                child: SvgPicture.asset(
                  bookmark,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(
            width: SizeConfig.blockSizeHorizontal * 5,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Boo Energy Drink',
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: sf_pro_display_medium,
                    color: black_273433),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: SizeConfig.blockSizeVertical * 0.8),
                child: Row(
                  children: [
                    Text(
                      '4 items',
                      style: TextStyle(
                          fontFamily: sf_pro_display_regular,
                          fontSize: 12,
                          color: grey_96a6a3),
                    ),
                    SizedBox(
                      width: SizeConfig.blockSizeHorizontal * 2,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(0, 183, 97, 0.1),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      padding: EdgeInsets.all(5),
                      child: Text(
                        '+2 others product',
                        style: TextStyle(
                            fontSize: 11,
                            fontFamily: sf_pro_display_medium,
                            color: skygreen_24d39e),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: SizeConfig.screenWidth * 0.6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$400',
                      style: TextStyle(
                          fontFamily: sf_pro_display_bold,
                          fontSize: 14,
                          color: black_273433),
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
                        'Order again',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: sf_pro_display_bold),
                      ),
                      height: SizeConfig.blockSizeVertical * 3.5,
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
