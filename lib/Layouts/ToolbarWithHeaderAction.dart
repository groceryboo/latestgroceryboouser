import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:groceryboouser/Screens/Location/controller/AddressController.dart';
import 'package:groceryboouser/Styles/my_colors.dart';
import 'package:groceryboouser/Styles/my_icons.dart';
import 'package:groceryboouser/Styles/my_strings.dart';
import 'package:groceryboouser/Utilities/Constant.dart';

class ToolbarWithHeaderAction extends StatelessWidget {
   String title;
   var actionIcon;
  VoidCallback onCustomButtonPressed;

  ToolbarWithHeaderAction(_title, _actionIcon,
      VoidCallback _onCustomButtonPressed) {
    this.title = _title;
    this.actionIcon = _actionIcon;
    this.onCustomButtonPressed = _onCustomButtonPressed;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () => Get.back(),
              child: Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 6,
                      blurRadius: 10,
                      offset: Offset(1, 4), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    BackArrow,
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
            ),
            Text(title,
                style: TextStyle(
                    color: black_273433,
                    fontWeight: FontWeight.w500,
                    fontFamily: sf_pro_display_bold,
                    fontStyle: FontStyle.normal,
                    fontSize: 16),
                textAlign: TextAlign.center),
            InkWell(
              onTap: onCustomButtonPressed,
              child: Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 6,
                      blurRadius: 10,
                      offset: Offset(1, 4), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    actionIcon,
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
