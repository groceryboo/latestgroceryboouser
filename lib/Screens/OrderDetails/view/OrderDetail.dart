import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:groceryboouser/Layouts/ToolbarBackOnly.dart';
import 'package:groceryboouser/Model/ItemsModel.dart';
import 'package:groceryboouser/Screens/OrderDetails/controller/OrderDetailsController.dart';
import 'package:groceryboouser/Styles/my_colors.dart';
import 'package:groceryboouser/Styles/my_icons.dart';
import 'package:groceryboouser/Styles/my_strings.dart';
import 'package:groceryboouser/Utilities/Constant.dart';

class OrderDetail extends StatefulWidget {

 final int order_id;
  const OrderDetail({Key key, this.order_id}) : super(key: key);


  @override
  _OrderDetailState createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {


   OrderDetailsController orderDetailsController ;
    //String  sub_total="";
  var sum=0.0 ;
  var delivery_fee_amount=5.0;
  var total=0.0;
  List<double> given_list=[];

  @override
  void initState() {
    // TODO: implement initState
    orderDetailsController=Get.put(OrderDetailsController(orderId: widget.order_id));
    super.initState();
  }

  // List<OrderDetailModel> orderDeatailModel = [
  //   OrderDetailModel("assets/images/fruit.png", "Pomegranate 1 kg", "\$4.5",
  //       "\Qty: 1", "\$4.5"),
  //   OrderDetailModel("assets/images/fruit.png", "Pomegranate 1 kg", "\$4.5",
  //       "\Qty: 1", "\$4.5"),
  // ];


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, // navigation bar color
      statusBarColor: Colors.white, // status bar color
      statusBarIconBrightness: Brightness.dark, // status bar icons' color
      systemNavigationBarIconBrightness:
      Brightness.light, //navigation bar icons' color
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body:
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 19, horizontal: 18),
                      child: Row(
                        children: [
                          BackLayout(),
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 4,),
                                Text(
                                  order_details,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: black_273433,
                                    fontFamily: poppins_bold,
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 1,
                                ),
                                Text(
                                  date_timing,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: grey_96a6a3,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    fontFamily: sf_pro_display_medium,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  Obx(()=>
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(
                        color: silver_f4f6f6,
                        thickness: 1,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 24, top: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 12,
                                ),
                                SvgPicture.asset(bulk_location),
                                SizedBox(width: 7.3),
                                DottedLine(
                                  dashLength: 8,
                                  dashGapLength: 3,
                                  lineThickness: 2,
                                  dashColor: dash_gray,
                                  dashGapColor: Colors.white,
                                  direction: Axis.vertical,
                                  lineLength: 54,
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(walmart,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        fontFamily: sf_pro_display_semibold,
                                        color: black_273433),
                                    textAlign: TextAlign.left),
                                SizedBox(
                                  height: 1,
                                ),
                                Text(
                                  Kingstreet,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                      fontFamily: sf_pro_display_medium,
                                      color: grey_96a6a3),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 0, left: 50),
                        child: Text(
                          Uyi,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              fontFamily: sf_pro_display_semibold,
                              color: black_273433),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(bulk_location),
                            SizedBox(
                              width: 9,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 1.5),
                              child: Text(
                                university,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: sf_pro_display_medium,
                                  color: grey_96a6a3,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 24, left: 16, right: 16),
                        child: Divider(
                          color: grey_e9ecec,
                          thickness: 1.2,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 24, top: 15.5, right: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(delivery_status_img),
                            SizedBox(
                              width: 24,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(delivery_status,
                                    style: TextStyle(
                                      fontFamily: sf_pro_display_bold,
                                      fontSize: 18,
                                      color: black_273433,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                    ),
                                    textAlign: TextAlign.center),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(order_on_the_way,
                                    style: TextStyle(
                                      fontFamily: sf_pro_display_semibold,
                                      fontSize: 16,
                                      color: skygreen_24d39e,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.normal,
                                    ),
                                    textAlign: TextAlign.center),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 21.5, left: 24, right: 24),
                        child: Divider(
                          color: grey_e9ecec,
                          thickness: 1,
                        ),
                      ),
                      SizedBox(
                        height: 17.5,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(light_bag),
                            SizedBox(
                              width: 4,
                            ),
                            orderDetailsController.boolorderDetails.value==true?
                            Text("${orderDetailsController.orderDetailsList.length} items",
                                style: const TextStyle(
                                    color: grey_96a6a3,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: sf_pro_display_medium,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 12.0),
                                textAlign: TextAlign.center):Text("")
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),


                      orderDetailsController.boolorderDetails.value==true?
                      ListView.builder(
                          primary: false,
                          shrinkWrap: true,
                          itemCount: orderDetailsController.orderDetailsList.length,
                          itemBuilder: (context, i) {

                            //given_list.fillRange(0,orderDetailsController.orderDetailsList.length);
                            given_list.add(double.parse(orderDetailsController.orderDetailsList[i].totalAmount));
                            print("object-------------$given_list");
                            sum += given_list[i];
                            total= sum+delivery_fee_amount;

                            return  Container(
                              margin: EdgeInsets.only(bottom: 24),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 24,right: 24),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Image.network(
                                          orderDetailsController.orderDetailsList[i].productDetailsimage,
                                          height: 80,
                                          width: 80,
                                          fit: BoxFit.fill,
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: EdgeInsets.only(left: 24),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    orderDetailsController.orderDetailsList[i].productDetailsName,
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: black_273433,
                                                      fontFamily: sf_pro_display_semibold,
                                                      fontWeight: FontWeight.w600,
                                                      fontStyle: FontStyle.normal,
                                                    ),
                                                    textAlign: TextAlign.center

                                                ),
                                                SizedBox(
                                                  height: 7.5,
                                                ),
                                                Text(
                                                    "\$${orderDetailsController.orderDetailsList[i].variantDetailsCost}",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: black_273433,
                                                      fontFamily: sf_pro_display_semibold,
                                                      fontWeight: FontWeight.w600,
                                                      fontStyle: FontStyle.normal,
                                                    ),
                                                    textAlign: TextAlign.right

                                                ),
                                                SizedBox(
                                                  height: 7.5,
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                        "Qty: ${orderDetailsController.orderDetailsList[i].variantDetailsUnit}",
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: grey_96a6a3,
                                                          fontFamily: sf_pro_display_medium,
                                                          fontWeight: FontWeight.w500,
                                                          fontStyle: FontStyle.normal,
                                                        ),textAlign: TextAlign.center
                                                    ),
                                                    Text(
                                                        "\$${orderDetailsController.orderDetailsList[i].totalAmount}",
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          color: black,
                                                          fontFamily: sf_pro_display_semibold,
                                                          fontWeight: FontWeight.w600,
                                                          fontStyle: FontStyle.normal,
                                                        ),
                                                        textAlign: TextAlign.right

                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),

                                  SizedBox(height: 24,),
                                  Divider(
                                    color: silver_f4f6f6,
                                    thickness: 1,
                                  ),
                                ],
                              ),
                            );
                          }

                      ):Container(),



                      Container(
                        margin: EdgeInsets.only(left: 24),
                        child: Text(payment_summary,
                            style: const TextStyle(
                                color: black_273433,
                                fontWeight: FontWeight.w700,
                                fontFamily: sf_pro_display_bold,
                                fontStyle: FontStyle.normal,
                                fontSize: 18.0),
                            textAlign: TextAlign.left),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 12, left: 24, right: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(Subtotal,
                                  style: const TextStyle(
                                      color: grey_96a6a3,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: sf_pro_display_medium,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.0),
                                  textAlign: TextAlign.left),
                              flex: 1,
                            ),
                            Text("\$${sum}",
                                style: const TextStyle(
                                    color: grey_96a6a3,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: sf_pro_display_medium,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14.0),
                                textAlign: TextAlign.left)
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 6, left: 24, right: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(delivery_fee,
                                  style: const TextStyle(
                                      color: grey_96a6a3,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: sf_pro_display_medium,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.0),
                                  textAlign: TextAlign.left),
                              flex: 1,
                            ),
                            Text("\$$delivery_fee_amount",
                                style: const TextStyle(
                                    color: grey_96a6a3,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: sf_pro_display_medium,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14.0),
                                textAlign: TextAlign.left)
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 3.5, left: 24, right: 24),
                        child: Divider(
                          color: grey_e9ecec,
                          thickness: 1,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 7.5, left: 24, right: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(Total,
                                  style: const TextStyle(
                                      color: black_273433,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: sf_pro_display_bold,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 18.0),
                                  textAlign: TextAlign.left),
                              flex: 1,
                            ),
                            Text("\$${total}",
                                style: const TextStyle(
                                    color: black_273433,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: sf_pro_display_bold,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 18.0),
                                textAlign: TextAlign.left)
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: silver_f4f6f6,
                        thickness: 1,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 16, left: 24),
                        child: Text(wallet,
                            style: const TextStyle(
                                color: black_273433,
                                fontWeight: FontWeight.w400,
                                fontFamily: sf_pro_display_regular,
                                fontStyle: FontStyle.normal,
                                fontSize: 14),
                            textAlign: TextAlign.left),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 6, left: 24, right: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(debit_credit_card,
                                  style: const TextStyle(
                                      color: black_273433,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: sf_pro_display_regular,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14),
                                  textAlign: TextAlign.left),
                              flex: 1,
                            ),
                            Text(trxn_id,
                                style: const TextStyle(
                                    color: grey_96a6a3,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: sf_pro_display_medium,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 12),
                                textAlign: TextAlign.left),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Divider(
                        color: silver_f4f6f6,
                        thickness: 1,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 24, left: 24),
                        child: Text(instruction_note,
                            style: const TextStyle(
                                color: black_273433,
                                fontWeight: FontWeight.w700,
                                fontFamily: sf_pro_display_bold,
                                fontStyle: FontStyle.normal,
                                fontSize: 18.0),
                            textAlign: TextAlign.left),
                      ),
                      Container(
                        height: 79,
                        margin:
                        EdgeInsets.only(top: 8, right: 24, left: 24, bottom: 25),
                        padding: EdgeInsets.symmetric(vertical: 7, horizontal: 16),
                        decoration: BoxDecoration(
                            border: Border.all(color: grey_e9ecec, width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: Colors.white),
                        child: new TextField(
                          style: const TextStyle(
                              color: black,
                              fontWeight: FontWeight.w500,
                              fontFamily: sf_pro_display_medium,
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0),
                          decoration: new InputDecoration(
                            isDense: true,
                            hintText: write_description,
                            hintStyle: TextStyle(
                                color: grey_96a6a3,
                                fontWeight: FontWeight.w500,
                                fontFamily: sf_pro_display_medium,
                                fontStyle: FontStyle.normal,
                                fontSize: 14.0),
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.multiline,
                          maxLines: 4,
                        ),
                      ),
                    ],
                  )
                  )
                  ],
                ),
              ),

        ),
      ),
    );
  }
}
