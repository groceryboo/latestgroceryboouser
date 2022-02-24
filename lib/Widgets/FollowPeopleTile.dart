import 'package:flutter/material.dart';
import 'package:groceryboouser/Styles/my_colors.dart';
import 'package:groceryboouser/Styles/my_icons.dart';
import 'package:groceryboouser/Utilities/Constant.dart';
import 'package:groceryboouser/Utils/SizeConfig.dart';


Widget followOtherPeopleTile(BuildContext context) {
  SizeConfig().init(context);
  return Container(
    margin: EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 2),
    decoration: BoxDecoration(
      color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.grey[200],
          blurRadius: 2,
          spreadRadius: 0.5,

        ),
      ]
    ),
    child: ListTile(
      dense: true,
      onTap: (){},
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      tileColor: Colors.white,
      contentPadding: EdgeInsets.all(5),
      leading: Container(
        width: SizeConfig.screenWidth * 0.15,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: AssetImage(orange_img))),
      ),
      title: Row(
        children: [
          Text(
            'ternaklele',
            style: TextStyle(
                fontFamily: sf_pro_display_semibold,
                color: black_273433,
                fontSize: 14),
          ),
          SizedBox(
            width: SizeConfig.blockSizeHorizontal,
          ),
          Container(
            decoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
            padding: EdgeInsets.all(2),
            child: Icon(
              Icons.check,
              color: Colors.white,
              size: SizeConfig.blockSizeVertical,
            ),
          ),
        ],
      ),
      trailing: MaterialButton(
        onPressed: () {},
        color: skygreen_24d39e,
        padding: EdgeInsets.zero,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(color: skygreen_24d39e)),
        child: Text(
          'Follow',
          style: TextStyle(
              color: Colors.white, fontSize: 12, fontFamily: sf_pro_display_bold),
        ),
        height: SizeConfig.blockSizeVertical * 4,
        minWidth: SizeConfig.screenWidth * 0.2,
      ),
      subtitle: Text('Ariana Venti',
      style: TextStyle(
        fontFamily: sf_pro_display_regular,
        fontSize: 14,
        color: grey_96a6a3,
      ),),
    ),
  );
}
