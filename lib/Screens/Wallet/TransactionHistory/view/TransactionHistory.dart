import 'package:flutter/material.dart';
import '../../../../Styles/my_colors.dart';
import '../../../../Utils/SizeConfig.dart';
import '../../../../Styles/my_height.dart';
import '../../../../Utilities/Constant.dart';

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({Key key}) : super(key: key);

  @override
  _TransactionHistoryState createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 2,
          actions: [
            IconButton(
                onPressed: () {
                  _openBottomSheet(context);
                },
                icon: Icon(Icons.filter_alt))
          ],
          title: Text(
            "Transaction History",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Container(
            margin: EdgeInsets.symmetric(
                horizontal: SizeConfig.screenWidth * 0.05,
                vertical: SizeConfig.screenHeight * 0.025),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: () {
                      _openBottomSheet(context);
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          color: skygreen_24d39e,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Sep 29 2021 - Sep 31 2021",
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(Icons.arrow_drop_down),
                      ],
                    )),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: ((context, index) {
                          return _listviewItem(context, index);
                        })))
              ],
            )));
  }

  Widget _listviewItem(context, index) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Topup",
              style: TextStyle(
                  color: skygreen_24d39e, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Wallet",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            SizedBox(
              height: 8,
            ),
            Text("Grocery Boo"),
          ]),
          Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                Text(
                  "Dec 16 2021 at 11.00pm",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "\$50",
                  style: TextStyle(
                      color: skygreen_24d39e, fontWeight: FontWeight.bold),
                ),
              ])),
        ]),
      ),
    );
  }

  _openBottomSheet(context) {
    showModalBottomSheet<void>(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        builder: (BuildContext context) {
          return Container(
            height: SizeConfig.screenHeight / 2,
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.screenWidth * 0.05,
                vertical: SizeConfig.screenHeight * 0.025),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 50,
                      height: 3,
                      color: Colors.grey,
                    )),
                SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Filter Transaction History',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Date Filter',
                  style: TextStyle(fontSize: 17),
                ),
                Row(
                  children: [
                    Expanded(
                        child: GestureDetector(
                            child: Card(
                                color: Colors.grey[300],
                                child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                            backgroundColor: Colors.white,
                                            child: Icon(
                                              Icons.calendar_today,
                                              color: Colors.grey,
                                            )),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("From"),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                "29 Sep 2021",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ]),
                                      ],
                                    ))))),
                    Expanded(
                        child: GestureDetector(
                            child: Card(
                                color: Colors.grey[300],
                                child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                            backgroundColor: Colors.white,
                                            child: Icon(
                                              Icons.calendar_today,
                                              color: Colors.grey,
                                            )),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("To"),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                "30 Sep 2021",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ]),
                                      ],
                                    ))))),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Color(0x17747796).withOpacity(0.07),
                      spreadRadius: 10,
                      blurRadius: 10,
                      offset: Offset(0, 20), // changes position of shadow
                    ),
                  ]),
                  child: SizedBox(
                    width: double.infinity,
                    height: HeightData.sixty,
                    child: ElevatedButton(
                        child: //
                            Text("Search Filter",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: sf_pro_display_bold,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 16.0),
                                textAlign: TextAlign.left),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: skygreen_24d39e,
                          onPrimary: Colors.white,
                          elevation: 0,
                          padding:
                              EdgeInsets.symmetric(horizontal: 0, vertical: 21),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(color: skygreen_24d39e, width: 0),
                          ),
                        )),
                  ),
                )
              ],
            ),
          );
        });
  }
}
