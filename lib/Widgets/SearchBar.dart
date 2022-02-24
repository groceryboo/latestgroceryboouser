import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:groceryboouser/Utils/SizeConfig.dart';
import '../Styles/my_colors.dart';
import '../Styles/my_icons.dart';
import '../Utilities/Constant.dart';

class SearchBar extends StatefulWidget {
  VoidCallback onCustomButtonPressed;

  // SearchBar(String searchInput, onCustomButtonPressed, {Key key}) : super(key: key);
  SearchBar({Key key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
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
                  // searchInput,
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
    );
  }
}
