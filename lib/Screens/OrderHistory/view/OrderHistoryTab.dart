import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:groceryboouser/Screens/OrderHistory/controller/OrderHistoryController.dart';
import 'package:groceryboouser/Screens/past_order_tab.dart';
import 'package:groceryboouser/Styles/my_colors.dart';
import 'package:groceryboouser/Styles/my_icons.dart';
import 'package:groceryboouser/Styles/my_strings.dart';
import 'package:groceryboouser/Utilities/Constant.dart';
import '../../../Layouts/ToolbarBackOnly.dart';
import '../../ongoing_order_tab.dart';

class OrderHistoryTab extends StatefulWidget {
  @override
  _OrderHistoryTabState createState() => _OrderHistoryTabState();
}

class _OrderHistoryTabState extends State<OrderHistoryTab>
    with SingleTickerProviderStateMixin {

  //late TabController _tabController;
  OrderHistoryController orderHistoryController = Get.put(OrderHistoryController());

  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  final isFirst = true;
  final isSecond = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    BackLayout(),
                    Expanded(
                      child: Center(
                        child: Text(
                          order_history,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            color: black,
                            fontFamily: sf_pro_display_bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: grey_e9ecec,
                thickness: 1.1,
              ),
              Container(
                margin: EdgeInsets.only(top: 12, left: 24, right: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(smily),
                    SizedBox(
                      width: 13,
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(deliver,
                          style: TextStyle(
                            fontFamily: sf_pro_display_semibold,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            color: black_273433,
                          )),
                    ),
                    Text(
                      university_Dr,
                      style: TextStyle(
                          color: grey_96a6a3,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          fontFamily: sf_pro_display_medium),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 4),
                      child: SvgPicture.asset(
                        downArrow,
                        width: 15,
                        height: 15,
                        color: skygreen_24d39e,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: grey_e9ecec,
                thickness: 1.1,
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                margin: EdgeInsets.only(left: 24, right: 24),
                height: 50,
                decoration: BoxDecoration(
                  color: grey_e9ecec,
                  borderRadius: BorderRadius.circular(
                    8.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: TabBar(
                    controller: _tabController,
                    // give the indicator a decoration (color and border radius)
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        8.0,
                      ),
                      color: Colors.white,
                    ),
                    labelColor: black,
                    unselectedLabelColor: grey_96a6a3,
                    tabs: [
                      // First tab
                      Tab(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(ongoing_order,
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: sf_pro_display_bold,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Container(
                              height: 21,
                              width: 21,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isFirst ? skygreen_24d39e :grey_96a6a3,
                                // borderRadius: BorderRadius.circular(
                                //   25.0,
                                // ),
                              ),
                              child: Center(
                                child: Text("${orderHistoryController.onGoingOrderList.length}",
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontFamily: sf_pro_display_bold,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                      color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                        // text: 'Past Orders (10)',
                      ),

                      // Second tab
                      Tab(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(past_order,
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: sf_pro_display_bold,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Container(
                              height: 21,
                              width: 21,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:isSecond ? skygreen_24d39e :grey_96a6a3 ,
                                // borderRadius: BorderRadius.circular(
                                //   25.0,
                                // ),
                              ),
                              child: Center(
                                child: Text(
                                  "${orderHistoryController.pastOrderList.length}",
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontFamily: sf_pro_display_bold,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                      color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                        // text: 'Past Orders (10)',
                      ),
                    ],
                  ),
                ),
              ),

              /*------ viewpager code here -----------*/
              Expanded(
                flex: 1,
                child: TabBarView(
                  physics: BouncingScrollPhysics(),
                  controller: _tabController,
                  children: [
                    // first tab set in Tablayout.
                    ongoing_order_tab(),

                    // second tab set in Tablayout.
                    past_order_tab(),
                  ],

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
