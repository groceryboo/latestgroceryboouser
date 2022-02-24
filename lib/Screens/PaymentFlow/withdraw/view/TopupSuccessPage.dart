import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:groceryboouser/Layouts/ElevatedGreenButton.dart';
import 'package:groceryboouser/Styles/my_colors.dart';
import 'package:groceryboouser/Styles/my_icons.dart';
import 'package:groceryboouser/Utils/text_utilities.dart';

import '../../../../Styles/my_strings.dart';
import '../../../../Utils/SizeConfig.dart';

class TopupSuccessPage extends StatefulWidget {
  const TopupSuccessPage({Key key}) : super(key: key);

  @override
  _TopupSuccessPageState createState() => _TopupSuccessPageState();
}

class _TopupSuccessPageState extends State<TopupSuccessPage> {
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
                    topup_success,
                    width: 160,
                    height: 160,
                  ),
                  setBoldText(success_, 40, skygreen_24d39e, FontWeight.w700,
                      FontStyle.normal),
                  SizedBox(
                    height: 10,
                  ),
                  setRegulerText("$topup_done_ : \$255", 16, black,
                      FontWeight.w600, FontStyle.normal),
                  SizedBox(
                    height: 10,
                  ),
                  setRegulerText("$trxn_id : 1212121212", 12, black_273433,
                      FontWeight.w400, FontStyle.normal),
                ],
              ),
            ),
            CommonElevatedButton(ok_text, Colors.white, skygreen_24d39e, () {})
          ])),
    ));
  }
}
