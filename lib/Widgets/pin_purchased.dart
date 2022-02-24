import 'package:flutter/material.dart';
import 'package:groceryboouser/Styles/my_colors.dart';
import 'package:groceryboouser/Utilities/Constant.dart';
import 'package:groceryboouser/Utils/SizeConfig.dart';


class PinPurchasedCard extends StatefulWidget {
  PinPurchasedCard({Key key, this.follow}) : super(key: key);

  bool follow = false;

  @override
  _PinPurchasedCardState createState() => _PinPurchasedCardState();
}

class _PinPurchasedCardState extends State<PinPurchasedCard> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(67, 67, 178, 0.08),
          ),
        ],
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
              padding: EdgeInsets.all(5),
            ),
            contentPadding: EdgeInsets.zero,
            title: Text(
              'Elstonbrown',
              style: TextStyle(
                fontFamily: sf_pro_display_medium,
                color: black_273433,
                fontSize: 12,
              ),
            ),
            subtitle: Text(
              'elston_25',
              style: TextStyle(
                fontFamily: sf_pro_display_medium,
                color: grey_96a6a3,
                fontSize: 11,
              ),
            ),
            trailing: MaterialButton(onPressed: (){
             if(widget.follow == true)
               setState(() {
                 widget.follow = false;
               });
             else
               setState(() {
                 widget.follow = true;
               });
            },
            color: widget.follow ? grey_e9ecec : skygreen_24d39e,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),),
            child: Text(widget.follow ? 'Following' : 'Follow',
            style: TextStyle(
              color: widget.follow ? skygreen_24d39e : Colors.white,
              fontSize: 12,
              fontFamily: sf_pro_display_bold
            ),),
            minWidth: SizeConfig.screenWidth * 0.15,
            height: SizeConfig.blockSizeVertical * 4,
              elevation: 0,
            ),
          ),
          SizedBox(height: SizeConfig.blockSizeVertical,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Ordered on',
                  style: TextStyle(
                    fontFamily: sf_pro_display_medium,
                    fontSize: 12,
                    color: grey_96a6a3
                  ),),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical,
                  ),
                  Text('Dec 16 2021 - 11:00 pm',
                    style: TextStyle(
                        fontFamily: sf_pro_display_semibold,
                        fontSize: 14,
                        color: black_273433
                    ),),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Pin Value',
                    style: TextStyle(
                        fontFamily: sf_pro_display_medium,
                        fontSize: 12,
                        color: grey_96a6a3
                    ),),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical,
                  ),
                  Text('\$55',
                    style: TextStyle(
                        fontFamily: sf_pro_display_semibold,
                        fontSize: 14,
                        color: black_273433
                    ),),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Comission',
                    style: TextStyle(
                        fontFamily: sf_pro_display_medium,
                        fontSize: 12,
                        color: grey_96a6a3
                    ),),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical,
                  ),
                  Text('\$3',
                    style: TextStyle(
                        fontFamily: sf_pro_display_semibold,
                        fontSize: 14,
                        color: skygreen_24d39e
                    ),),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
