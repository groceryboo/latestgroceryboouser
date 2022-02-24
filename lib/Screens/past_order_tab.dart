import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:groceryboouser/Model/ItemModel.dart';
import 'package:groceryboouser/Model/PastOrderTabModel.dart';
import 'package:groceryboouser/Screens/OrderDetails/view/OrderDetail.dart';
import 'package:groceryboouser/Screens/OrderHistory/controller/OrderHistoryController.dart';
import 'package:groceryboouser/Styles/my_colors.dart';
import 'package:groceryboouser/Styles/my_icons.dart';
import 'package:groceryboouser/Styles/my_strings.dart';
import 'package:groceryboouser/Utilities/Constant.dart';

class past_order_tab extends StatefulWidget {

  @override
  _past_order_tabState createState() => _past_order_tabState();
}

class _past_order_tabState extends State<past_order_tab> {
  OrderHistoryController orderHistoryController = Get.put(OrderHistoryController());
  // List<PastOrderTabModel> modelClass = [
  //   PastOrderTabModel("Thursday, 1 Dec 2021", "Pin this basket", "6 items", "\$450"),
  //   PastOrderTabModel("Thursday, 1 Dec 2021", "Already pinned", "6 items", "\$450"),
  //   PastOrderTabModel("Thursday, 1 Dec 2021", "Already pinned", "6 items", "\$450"),
  //   PastOrderTabModel("Thursday, 1 Dec 2021", "Already pinned", "6 items", "\$450"),
  // ];
  //
  // List<ItemModel> itemClass = [
  //   ItemModel("assets/images/lemon.png", "Strawberry", "\$1.5/1kg", "\$15"),
  //   ItemModel("assets/images/lemon.png", "Lemon", "\$1kg", "\$25"),
  // ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Obx(()=>
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  orderHistoryController.boolonPastOrderList.value==true
                      ?
                  ListView.builder(
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    primary: false,
                    shrinkWrap: true,
                    itemCount: orderHistoryController.pastOrderList.length,
                    itemBuilder: (context, i) =>
                        InkWell(
                          onTap: (){
                            Navigator.of(context, rootNavigator: true).push(
                              MaterialPageRoute(
                                builder: (context) => OrderDetail(order_id: orderHistoryController.pastOrderList[i].id),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.only(bottom: 17),
                            margin: EdgeInsets.only(top: 0, right: 24, left: 24, bottom: 16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [BoxShadow(
                                  color:  Color(0x144343b2),
                                  offset: Offset(0,0),
                                  blurRadius: 20,
                                  spreadRadius: 2
                              )] ,
                            ),

                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 12, left: 16, right: 16),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          orderHistoryController.pastOrderList[i].createdAt,
                                          style: TextStyle(
                                              fontFamily: sf_pro_display_medium,
                                              color: black,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:  FontStyle.normal,
                                              fontSize: 12),
                                        ),
                                        flex: 1,
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 7, horizontal: 12),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(16),
                                            gradient: LinearGradient(
                                              begin: Alignment.topRight,
                                              end: Alignment.bottomLeft,
                                              colors: [
                                                Color(0xff1c2535),
                                                Color(0xff04080f),
                                              ],
                                            )),
                                        child: Text(
                                          "${orderHistoryController.pastOrderList[i].orderStatus}",
                                          style: TextStyle(
                                              fontFamily: sf_pro_display_bold,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              fontStyle:  FontStyle.normal,
                                              fontSize: 12),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 8.5,
                                ),
                                const Divider(
                                  color: silver_f4f6f6,
                                  thickness: 1.1,
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 13.5, left: 16, right: 16),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SvgPicture.asset(
                                        bagGray,
                                        width: 12,
                                        height: 12,
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Expanded(
                                        child: Text(
                                          "${orderHistoryController.pastOrderList.length} items",
                                          style: TextStyle(
                                              fontFamily: sf_pro_display_medium,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:  FontStyle.normal,
                                              color: black,
                                              fontSize: 12),
                                        ),
                                        flex: 1,
                                      ),
                                      Container(
                                          alignment: Alignment.centerLeft,
                                          height: 8,
                                          width: 8,
                                          decoration: BoxDecoration(
                                            color: Color(0xff58c4f6),
                                            shape: BoxShape.circle,
                                          )),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(delivered,
                                        style: TextStyle(
                                            fontFamily: sf_pro_display_bold,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:  FontStyle.normal,
                                            color: sky_blue,
                                            fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 11.5,
                                ),

                                /*--------- Horizontal Recyclerview ---------*/
                                Container(
                                  width: double.infinity,
                                  height: 80,
                                  child: ListView.separated(
                                    physics: ClampingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    primary: false,
                                    separatorBuilder: (context, index) => SizedBox(
                                      width: 16,
                                    ),
                                    shrinkWrap: true,
                                    padding: EdgeInsets.only(left: 16,right: 16),
                                    itemCount: orderHistoryController.pastOrderList[i].orderItems.length,
                                    itemBuilder: (context, index) =>
                                        Container(
                                            width: 180,
                                            padding: EdgeInsets.only(top: 10, bottom: 10, left: 8),


                                            decoration: BoxDecoration(
                                              color: rect_box,
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(
                                                  width: 1.5, color: grey_e9ecec),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: rect_box,
                                                )
                                              ],
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Image.network(
                                                  orderHistoryController.pastOrderList[i].orderItems[index].productDetailsimage, width: 56, height: 56,),
                                                SizedBox(width: 16,),
                                                Center(
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        orderHistoryController.pastOrderList[i].orderItems[index].productDetailsName, style: TextStyle(
                                                          fontFamily: sf_pro_display_medium,
                                                          fontWeight: FontWeight.w500,
                                                          fontStyle:  FontStyle.normal,color: black,
                                                          fontSize: 14),),

                                                      SizedBox(height: 2,),

                                                      Text(
                                                        orderHistoryController.pastOrderList[i].orderItems[index].variantDetailsCost, style: TextStyle(
                                                          fontFamily: sf_pro_display_medium,
                                                          fontWeight: FontWeight.w500,
                                                          fontStyle:  FontStyle.normal, color: grey_96a6a3,
                                                          fontSize: 12),),
                                                      SizedBox(height: 2,),
                                                      Text(
                                                        orderHistoryController.pastOrderList[i].orderItems[index].variantDetailsCost, style: TextStyle(
                                                          fontFamily: sf_pro_display_medium,
                                                          fontWeight: FontWeight.w500,
                                                          fontStyle:  FontStyle.normal, color: skygreen_24d39e,
                                                          fontSize: 12),),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            )),
                                  ),
                                ),
                                SizedBox(
                                  height: 11.5,
                                ),
                                const Divider(
                                  color: silver_f4f6f6,
                                  thickness: 1.1,
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 16.5, left: 16, right: 16),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        total_bill,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:  FontStyle.normal,
                                            fontFamily: sf_pro_display_semibold,
                                            color: grey_96a6a3),
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          orderHistoryController.pastOrderList[i].totalAmount,
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700,
                                              fontStyle:  FontStyle.normal,
                                              fontFamily: sf_pro_display_bold,
                                              color: black),
                                        ),
                                      ),
                                      Text(
                                        reorder_items,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                            fontStyle:  FontStyle.normal,
                                            fontFamily: sf_pro_display_bold,
                                            color: skygreen_24d39e),
                                      ),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      RotatedBox(
                                        quarterTurns: 3,
                                        child: Image.asset(
                                          arrow,
                                          width: 12,
                                          height: 12,
                                          color: skygreen_24d39e,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                  ):
                  Container()
                ],
              ),
          )
        ),
      ),
    );
  }
}
