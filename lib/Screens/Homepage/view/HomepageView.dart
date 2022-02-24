import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:groceryboouser/Model/BannerModel.dart';
import 'package:groceryboouser/Model/FollowFriendModel.dart';
import 'package:groceryboouser/Screens/Categoryscreen/view/AllProducts.dart';
import 'package:groceryboouser/Screens/Homepage/controller/HomePageController.dart';
import 'package:groceryboouser/Screens/Location/controller/AddressController.dart';
import 'package:groceryboouser/Screens/Location/view/addcurrentlocation.dart';
import 'package:groceryboouser/Screens/Location/view/saveAddressView.dart';
import 'package:groceryboouser/Styles/my_colors.dart';
import 'package:groceryboouser/Styles/my_icons.dart';
import 'package:groceryboouser/Styles/my_strings.dart';
import 'package:groceryboouser/Utilities/Constant.dart';
import 'package:groceryboouser/Utils/common_widget.dart';
import 'package:groceryboouser/Utils/preference_utils.dart';
import 'package:groceryboouser/Utils/share_predata.dart';


class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  HomePageController homePageController = Get.put(HomePageController());
  //HomePageController homePageController = Get.find();

  List<BannerModel> onBannerModel = [
    BannerModel("assets/images/banner1.png"),
    BannerModel("assets/images/banner1.png"),
    BannerModel("assets/images/banner1.png"),
    BannerModel("assets/images/banner1.png"),
  ];

  // List<FollowFriendModel> onFollowFriendModel = [
  //   FollowFriendModel('assets/images/fruit.png', 'Fruit'),
  //   FollowFriendModel('assets/images/cold_drink.png', 'Cold Drink'),
  //   FollowFriendModel('assets/images/fruit.png', 'Fruit'),
  //   FollowFriendModel('assets/images/cold_drink.png', 'Cold Drink'),
  // ];

  bool isFirst = true;
  bool isSecond = false;

  // @override
  // void initState() {
  //   WidgetsBinding.instance.addObserver(this);
  //   super.initState();
  // }
  //
  // @override
  // void dispose() {
  //   WidgetsBinding.instance.removeObserver(this);
  //   super.dispose();
  // }
  //


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Obx(
                ()=> Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 24, right: 24, top: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Deliver to
                            Stack(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    displayBottomSheet(context);
                                    setState(() {
                                      isFirst = false;
                                      isSecond = true;
                                    });
                                  },
                                  child: Visibility(
                                    visible: isFirst,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Text("Deliver to",
                                            style: TextStyle(
                                                color: grey_96a6a3,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: sf_pro_display_medium,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 11.0),
                                            textAlign: TextAlign.left),
                                        Row(
                                          children: [
                                            // 1226 University Dr
                                            Text("1226 University Dr",
                                                style: TextStyle(
                                                    color: const Color(
                                                        0xff273433),
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily: sf_pro_display_bold,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 14.0),
                                                textAlign: TextAlign.left),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            SvgPicture.asset(
                                              down_arrow,
                                              width: 10,
                                              height: 10,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isFirst = true;
                                      isSecond = false;
                                    });
                                  },
                                  child: Visibility(
                                    visible: isSecond,
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: grey_e9ecec),
                                          child: Icon(Icons.person),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment
                                              .start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            // Deliver to uyi
                                            Text("Deliver to uyi ",
                                                style: TextStyle(
                                                    color: Color(0xff273433),
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily: sf_pro_display_bold,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 12.0),
                                                textAlign: TextAlign.left),
                                            Row(
                                              children: [
                                                // 1226 University Dr
                                                Text("1226 University Dr",
                                                    style: TextStyle(
                                                        color: grey_96a6a3,
                                                        fontWeight: FontWeight
                                                            .w500,
                                                        fontFamily:
                                                        sf_pro_display_medium,
                                                        fontStyle: FontStyle
                                                            .normal,
                                                        fontSize: 11.0),
                                                    textAlign: TextAlign.left),
                                                SizedBox(
                                                  width: 4,
                                                ),
                                                SvgPicture.asset(
                                                  down_arrow,
                                                  width: 10,
                                                  height: 10,
                                                  color: grey_96a6a3,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  notification_icon,
                                  width: 18,
                                  height: 18,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                SvgPicture.asset(
                                  message_icon,
                                  width: 18,
                                  height: 18,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        /*Search Layout Below Side*/
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: grey_e9ecec,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 15, right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  search,
                                  width: 16.3,
                                  height: 16.3,
                                ),
                                SizedBox(
                                  width: 7.7,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: new TextField(
                                      style: const TextStyle(
                                          color: black,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: sf_pro_display_medium,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 12.0),
                                      decoration: new InputDecoration(
                                        isDense: true,
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 0, vertical: 10),
                                        hintText: "Search for a product, brand...",
                                        hintStyle: TextStyle(
                                            color: grey_96a6a3,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: sf_pro_display_medium,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 12.0),
                                        border: InputBorder.none,
                                      ),
                                      keyboardType: TextInputType.text,
                                      cursorColor: black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 24),
                    child: Container(
                      height: 120,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        primary: false,
                        shrinkWrap: true,
                        separatorBuilder: (context, index) =>
                            SizedBox(
                              width: 16,
                            ),
                        padding: EdgeInsets.only(left: 24, right: 24),
                        itemCount: onBannerModel.length,
                        itemBuilder: (context, i) =>
                            Column(
                              children: [
                                Image.asset(
                                  onBannerModel[i].banner,
                                  width: 330,
                                  height: 120,
                                  fit: BoxFit.cover,
                                )
                              ],
                            ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: 24, right: 24, top: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Categories
                            Text("Categories",
                                style: TextStyle(
                                    color: const Color(0xff273433),
                                    fontWeight: FontWeight.w700,
                                    fontFamily: sf_pro_display_bold,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 16.0),
                                textAlign: TextAlign.left),

                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Color(0xff273433)),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      bulk_paper,
                                      width: 12,
                                      height: 12,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    // Recent orders
                                    Text("Recent orders",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: sf_pro_display_semibold,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 10.0),
                                        textAlign: TextAlign.center)
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 16,
                  ),
                  // Rectangle 1325
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Color(0x144343b2),
                            offset: Offset(0, 0),
                            blurRadius: 20,
                            spreadRadius: 10)
                      ],
                    ),
                    child: homePageController
                        .boolCategory.value ==
                        true
                        ? Padding(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: GridView.builder(
                        primary: false,
                        shrinkWrap: true,
                        padding: EdgeInsets.all(0),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.85,
                            mainAxisSpacing: 0.0,
                            crossAxisSpacing: 0.0),
                        itemCount: homePageController
                            .CategoryList.length,
                        itemBuilder: (context, i) =>
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => AllProducts(),
                                ));
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 8, right: 8, bottom: 16),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12)),

                                      // boxShadow: [BoxShadow(
                                      //     color:  Color(0x144343b2),
                                      //     offset: Offset(5,20),
                                      //     blurRadius: 20,
                                      //     spreadRadius: 10
                                      // )] ,
                                      color: Colors.white),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Image
                                            .network(
                                          homePageController
                                              .CategoryList[i].image,
                                          width: double.infinity,
                                          height: 140,
                                          fit: BoxFit.fill,
                                        ),
                                      ),

                                      // Fruit
                                      Text(homePageController
                                          .CategoryList[i].name,
                                          style: TextStyle(
                                              color: const Color(0xff273433),
                                              fontWeight: FontWeight.w700,
                                              fontFamily: sf_pro_display_bold,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 14.0),
                                          textAlign: TextAlign.center)
                                    ],
                                  ),
                                ),
                              ),


                            ),
                      ),
                      ):  Padding(
                      padding: const EdgeInsets.only(
                          left: 24,
                          right: 24,
                          bottom: 24),),
                  ),

                    // ),

                ],
              ),
            ),
          ),
        ));
  }

  // Click bottomsheet on click of address layout
  void displayBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (context) {
          return bottomSheetContent();
        });
  }

}

class bottomSheetContent extends StatefulWidget {
  const bottomSheetContent({Key key}) : super(key: key);

  @override
  _bottomSheetContentState createState() => _bottomSheetContentState();
}

class _bottomSheetContentState extends State<bottomSheetContent> {
  HomePageController homePageController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.45,
        //set this as you want
        maxChildSize: 1,
        //set this as you want
        minChildSize: 0.1,
        //set this as you want
        expand: true,
        builder: (context, scrollController) {
          return StatefulBuilder(builder: (BuildContext context,
              StateSetter setState /*You can rename this!*/) {
            return Container(
              // margin: new EdgeInsets.only(bottom: 24),
                height: MediaQuery
                    .of(context)
                    .size
                    .height - 400.0,
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(30.0),
                        topRight: const Radius.circular(30.0))),
                child: new Wrap(
                  children: <Widget>[
                    Obx(
                          () =>
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 25,
                              ),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Opacity(
                                  opacity: 0.4000000059604645,
                                  child: Container(
                                      width: 48,
                                      height: 4,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4)),
                                          color: const Color(
                                              0xff96a6a3))),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment
                                    .start,
                                crossAxisAlignment: CrossAxisAlignment
                                    .end,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 17,
                                        left: 24,
                                        right: 28.3,
                                        bottom: 17),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(your_current_loc,
                                                  style: TextStyle(
                                                      color: grey_96a6a3,
                                                      fontWeight:
                                                      FontWeight.w500,
                                                      fontFamily:
                                                      sf_pro_display_medium,
                                                      fontStyle:
                                                      FontStyle.normal,
                                                      fontSize: 12.0),
                                                  textAlign: TextAlign
                                                      .left),
                                              SizedBox(
                                                height: 6,
                                              ),
                                              Row(
                                                children: [
                                                  SvgPicture.asset(
                                                      location_pin,
                                                      width: 24,
                                                      height: 24),
                                                  SizedBox(
                                                    width: 8,
                                                  ),
                                                  Container(
                                                    width: 200,
                                                    child: Text(
                                                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived no",
                                                        style: TextStyle(
                                                            color:
                                                            black_273433,
                                                            fontWeight:
                                                            FontWeight
                                                                .w500,
                                                            fontFamily:
                                                            sf_pro_display_medium,
                                                            fontStyle:
                                                            FontStyle
                                                                .normal,
                                                            overflow:
                                                            TextOverflow
                                                                .ellipsis,
                                                            fontSize: 16),
                                                        textAlign:
                                                        TextAlign.left),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () => {
                                            sendToGetCurrentLocation(),
                                          },
                                          child: SvgPicture.asset(
                                            map,
                                            width: 16,
                                            height: 16,
                                            alignment: Alignment
                                                .centerRight,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    color: gray_f4f6f6,
                                    thickness: 1,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 17,
                                        left: 24,
                                        right: 24,
                                        bottom: 17),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Text(saved_places,
                                              style: TextStyle(
                                                  color: grey_96a6a3,
                                                  fontWeight: FontWeight
                                                      .w500,
                                                  fontFamily:
                                                  sf_pro_display_medium,
                                                  fontStyle: FontStyle
                                                      .normal,
                                                  fontSize: 14.0),
                                              textAlign: TextAlign.left),
                                        ),
                                        InkWell(
                                          onTap: () => {
                                            sendToGetCurrentLocation(),
                                          },
                                          child: Text(add_new,
                                              style: TextStyle(
                                                  color: skygreen_24d39e,
                                                  fontWeight: FontWeight
                                                      .w500,
                                                  fontFamily:
                                                  sf_pro_display_medium,
                                                  fontStyle: FontStyle
                                                      .normal,
                                                  fontSize: 14),
                                              textAlign: TextAlign.left),
                                        ),
                                      ],
                                    ),
                                  ),
                                  homePageController
                                      .boolDisplayAddresses.value ==
                                      true
                                      ? SingleChildScrollView(
                                    child: Container(
                                      height: MediaQuery
                                          .of(context)
                                          .size
                                          .height - 200.0,
                                      // height: 300,
                                      child: ListView.separated(
                                        primary: false,
                                        shrinkWrap: true,
                                        separatorBuilder:
                                            (context, index) =>
                                            SizedBox(
                                              height: 16,
                                            ),
                                        padding: EdgeInsets.only(
                                            top: 16, bottom: 16),
                                        itemCount: homePageController
                                            .addressList.length,
                                        itemBuilder: (context, i) =>
                                            Container(
                                                margin: new EdgeInsets.only(
                                                    left: 24, right: 24),
                                                decoration: BoxDecoration(
                                                  color: grey_e9ecec,
                                                  borderRadius:
                                                  BorderRadius.all(
                                                      Radius.circular(8)),
                                                ),
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      left: 8.0,
                                                      top: 12,
                                                      right: 20,
                                                      bottom: 12),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        width: 38,
                                                        height: 38,
                                                        child: homePageController
                                                            .addressList[
                                                        i]
                                                            .image !=
                                                            null
                                                            ? SizedBox(
                                                          width: 14,
                                                          height: 14,
                                                          child: Padding(
                                                              padding: const EdgeInsets
                                                                  .all(8.0),
                                                              child: Image
                                                                  .network(
                                                                  homePageController
                                                                      .addressList[i]
                                                                      .image)
                                                          ),
                                                        )
                                                            : SizedBox(),
                                                        decoration:
                                                        BoxDecoration(
                                                            shape: BoxShape
                                                                .circle,
                                                            color: Colors
                                                                .white),
                                                      ),
                                                      SizedBox(
                                                        width: 16,
                                                      ),
                                                      Expanded(
                                                        flex: 1,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                          children: [
                                                            Text(
                                                                homePageController
                                                                    .addressList[
                                                                i]
                                                                    .savedName,
                                                                style: TextStyle(
                                                                    color:
                                                                    black_273433,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                    fontFamily:
                                                                    sf_pro_display_semibold,
                                                                    fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                    fontSize:
                                                                    16.0),
                                                                textAlign:
                                                                TextAlign
                                                                    .center),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            Container(
                                                              width: 150,
                                                              child: Text(
                                                                  homePageController
                                                                      .addressList[
                                                                  i]
                                                                      .address,
                                                                  style: TextStyle(
                                                                      color:
                                                                      grey_96a6a3,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                      fontFamily:
                                                                      sf_pro_display_regular,
                                                                      fontStyle:
                                                                      FontStyle
                                                                          .normal,
                                                                      fontSize:
                                                                      14),
                                                                  textAlign:
                                                                  TextAlign
                                                                      .left),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () async {
                                                          var preferences =
                                                          MySharedPref();

                                                          printData("Address went for edit", homePageController
                                                              .addressList[
                                                          i].toString());

                                                          await preferences
                                                              .setAddressDatumModel(
                                                              homePageController
                                                                  .addressList[
                                                              i],
                                                              SharePreData
                                                                  .key_SaveAddressDatumModel);

                                                          Get.to(() => SaveAddress());

                                                        },
                                                        child: Icon(
                                                          Icons.more_horiz,
                                                          size: 20,
                                                          color: black_273433,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                      ),
                                    ),
                                  )
                                      : Padding(
                                    padding: const EdgeInsets.only(
                                        left: 24,
                                        right: 24,
                                        bottom: 24),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: grey_e9ecec,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                      ),
                                      child: Padding(
                                        padding:
                                        const EdgeInsets.all(24.0),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment
                                              .stretch,
                                          children: [
                                            // SvgPicture.asset(
                                            //   invalid_name,
                                            //   width: 24,
                                            //   height: 24,
                                            //   alignment: Alignment.centerRight,
                                            // ),
                                            Image.asset(
                                              'assets/images/cherry_with_orange.png',
                                              width: 24,
                                              height: 24,
                                              alignment:
                                              Alignment.center,
                                            ),
                                            SizedBox(
                                              height: 16,
                                            ),
                                            Text(you_hv_no_savedplace,
                                                style: TextStyle(
                                                    color: black_273433,
                                                    fontWeight:
                                                    FontWeight.w500,
                                                    fontFamily:
                                                    sf_pro_display_bold,
                                                    fontStyle: FontStyle
                                                        .normal,
                                                    fontSize: 14.0),
                                                textAlign:
                                                TextAlign.center),

                                            SizedBox(
                                              height: 3,
                                            ),

                                            Text(some_places,
                                                style: TextStyle(
                                                    color: grey_96a6a3,
                                                    fontWeight:
                                                    FontWeight.w500,
                                                    fontFamily:
                                                    sf_pro_display_bold,
                                                    fontStyle: FontStyle
                                                        .normal,
                                                    fontSize: 14.0),
                                                textAlign:
                                                TextAlign.center),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ],
                          ),
                    ),
                  ],
                ));
          });
        });
  }

  sendToGetCurrentLocation() async {
    var preferences = MySharedPref();
    await preferences.clear(SharePreData.key_SaveAddressDatumModel);
    Get.to(AddCurrentLocation());

  }
}

