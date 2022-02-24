import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:groceryboouser/Layouts/ElevatedGreenButton.dart';
import 'package:groceryboouser/Styles/my_colors.dart';
import 'package:groceryboouser/Styles/my_strings.dart';
import 'package:groceryboouser/Utils/text_utilities.dart';

import '../../../../Layouts/ElevatedWhiteButtonGreenBorder.dart';
import '../../../../Styles/my_icons.dart';
import '../../../../Utils/SizeConfig.dart';

class TopupFailedPage extends StatefulWidget {
  const TopupFailedPage({Key key}) : super(key: key);

  @override
  _TopupFailedPageState createState() => _TopupFailedPageState();
}

class _TopupFailedPageState extends State<TopupFailedPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
        body: SafeArea(
      child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(
              horizontal: SizeConfig.screenWidth * 0.05,
              vertical: SizeConfig.screenHeight * 0.025),
          child: Column(children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    topup_failure,
                    width: 160,
                    height: 160,
                  ),
                  setRegulerText(failed, 40.0, red_FA586A, FontWeight.w700,
                      FontStyle.normal),
                  SizedBox(
                    height: 10,
                  ),
                  setRegulerText("$topup_failed : \$255", 16, black,
                      FontWeight.w600, FontStyle.normal),
                  SizedBox(
                    height: 10,
                  ),
                  setRegulerText("$trxn_id : 1212121212", 12, black_273433,
                      FontWeight.w400, FontStyle.normal),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: ElevatedWhiteButtonGreenBorder(
                        cancel_text, skygreen_24d39e, Colors.white, () {})),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                    child: CommonElevatedButton(
                        retry, Colors.white, skygreen_24d39e, () {
                  Get.back();
                }))
              ],
            )
          ])),
    ));
  }
}
