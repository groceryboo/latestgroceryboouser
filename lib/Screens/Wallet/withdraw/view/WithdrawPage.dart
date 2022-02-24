import 'package:flutter/material.dart';
import 'package:groceryboouser/Styles/my_colors.dart';
import '../../../../Utils/SizeConfig.dart';

class WithdrawPage extends StatefulWidget {
  const WithdrawPage({Key key}) : super(key: key);

  @override
  _WithdrawPageState createState() => _WithdrawPageState();
}

class _WithdrawPageState extends State<WithdrawPage> {
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
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
                      Text("Balance",
                          style: TextStyle(
                            color: Colors.grey[200],
                          )),
                      Spacer(),
                      Text(
                        "\$6,200",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ]),
                  ),
                  SizedBox(height: 15),
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "Search",
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.search)),
                      )),
                  SizedBox(height: 15),
                  Text(
                    "Recent Withdraw",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  Expanded(
                      child: ListView.builder(
                    itemBuilder: _listViewItem,
                    itemCount: 20,
                  ))
                ])));
  }

// Withdraw List View Items
  Widget _listViewItem(context, index) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // Withdraw Account Column
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Account",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "****1231",
                style: TextStyle(),
              ),
            ],
          ),
          SizedBox(
            width: 20,
          ),

          // Withdraw Date Column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "On",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Dec 16 2021 at 11:00 pm",
                  style: TextStyle(fontSize: 11),
                ),
              ],
            ),
          ),
          
          SizedBox(
            width: 20,
          ),

          //Withdraw Status Column
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                index % 2 == 0 ? "Processing" : "Paid",
                style: TextStyle(
                    color: index % 2 == 0 ? Colors.orange : Colors.green,
                    fontSize: 12),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "\$100",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
