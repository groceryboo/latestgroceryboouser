import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:groceryboouser/Styles/my_icons.dart';

class BackLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  GestureDetector(
        onTap: (){
          Get.back();
          // Navigator.pop(context);
        },
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
            child: SvgPicture.asset(BackArrow,width: 24,height: 24,),
          ),
        ),
      ),
    );
  }
}
