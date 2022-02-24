import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:groceryboouser/Styles/my_colors.dart';
import 'package:groceryboouser/Styles/my_strings.dart';
import 'package:groceryboouser/Utilities/Constant.dart';

import 'ToolbarBackOnly.dart';

class ToolbarCenterTitle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container
      (
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
      child: Stack(
        children: [
          BackLayout(),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 2.8,),
                Text(
                  transaction_failed,
                  style: TextStyle(
                    fontSize: 18,
                    color: pink_fa586a,
                    fontFamily: sf_pro_display_bold,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 2,),

                Text(timing,
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: sf_pro_display_regular,
                      color: pink_fa586a,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                    textAlign: TextAlign.center)
              ],
            ),
          ),
        ],
      ),
    );

  }
}
