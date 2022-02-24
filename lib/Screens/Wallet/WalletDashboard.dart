import 'package:flutter/material.dart';
import 'package:groceryboouser/Screens/Wallet/TransactionHistory/view/TransactionHistory.dart';
import 'package:groceryboouser/Screens/Wallet/withdraw/view/WithdrawPage.dart';
import 'package:groceryboouser/Styles/my_strings.dart';
import '../../Styles/my_colors.dart';
import '../../Styles/my_strings.dart';
import '../../Utils/SizeConfig.dart';


class WalletDashboard extends StatefulWidget {
  const WalletDashboard({Key key}) : super(key: key);

  @override
  _WalletDashboardState createState() => _WalletDashboardState();
}

class _WalletDashboardState extends State<WalletDashboard> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 2,
          title: Text(
            "Wallet",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: Container(
            margin: EdgeInsets.symmetric(
                horizontal: SizeConfig.screenWidth * 0.05,
                vertical: SizeConfig.screenHeight * 0.025),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    height: SizeConfig.screenHeight / 4.5,
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
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(children: [
                        Row(
                          children: [
                            Text(
                              "JASON STEM",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Text(
                              "Grocery Boo",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Spacer(),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    my_wallet,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "\$147.00",
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ]))
                      ]),
                    )),
                Row(
                  children: [
                    Expanded(
                        child: GestureDetector(
                            child: Card(
                                elevation: 5,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.add),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text("Top up")
                                      ]),
                                )))),
                    Expanded(
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WithdrawPage()));
                            },
                            child: Card(
                                elevation: 5,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.file_upload_outlined),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text("Withdraw")
                                      ]),
                                ))))
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(
                        child: GestureDetector(
                            child: Card(
                                elevation: 5,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("Pin Revenue"),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "\$1,500",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ]),
                                )))),
                    Expanded(
                        child: GestureDetector(
                            child: Card(
                                elevation: 5,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                                  child: Column(children: [
                                    Text("Ads. Revenue"),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "\$100",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ]),
                                ))))
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text(
                      "Transaction History",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TransactionHistory()));
                      },
                      child: Text("See all"),
                    )
                  ],
                ),
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
}
