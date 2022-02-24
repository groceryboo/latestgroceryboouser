import 'package:flutter/material.dart';
import 'package:groceryboouser/Utils/SizeConfig.dart';
import '../Styles/my_colors.dart';
import '../Utilities/Constant.dart';

class RePinnedTile extends StatefulWidget {
  RePinnedTile({Key key, this.follow}) : super(key: key);

  bool follow = false;

  @override
  _RePinnedTileState createState() => _RePinnedTileState();
}

/*test*/

class _RePinnedTileState extends State<RePinnedTile> {
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
      padding: EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            dense: true,
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
              elevation: 0,

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
            ),
          ),
        ],
      ),
    );
  }
}
