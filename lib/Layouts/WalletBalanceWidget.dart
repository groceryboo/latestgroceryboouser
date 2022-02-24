import 'package:flutter/material.dart';
import 'package:groceryboouser/Utils/text_utilities.dart';

import '../Styles/my_colors.dart';
import '../Styles/my_strings.dart';

class WalletBalanceWidget extends StatefulWidget {
  const WalletBalanceWidget({Key key, this.amount}) : super(key: key);

  final String amount;

  @override
  _WalletBalanceWidgetState createState() => _WalletBalanceWidgetState();
}

class _WalletBalanceWidgetState extends State<WalletBalanceWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        gradient: LinearGradient(
            colors: [
              green_15CF7D,
              skygreen_24d39e,
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Row(children: [
        setRegulerText(
            balance, 14, Colors.white, FontWeight.w600, FontStyle.normal),
        Spacer(),
        setRegulerText("${widget.amount}", 24, Colors.white, FontWeight.w700,
            FontStyle.normal),
      ]),
    );
  }
}
