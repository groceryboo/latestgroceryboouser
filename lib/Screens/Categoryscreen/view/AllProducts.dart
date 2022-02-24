import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:groceryboouser/Layouts/ToolbarBackOnly.dart';
import 'package:groceryboouser/Model/CategorySecondModel.dart';
import 'package:groceryboouser/Model/FollowFriendModel.dart';
import 'package:groceryboouser/Model/QuantityList.dart';
import 'package:groceryboouser/Screens/Categoryscreen/controller/ProductController.dart';
import 'package:groceryboouser/Screens/Pinned/view/PinnedDetails.dart';
import 'package:groceryboouser/Screens/Pinned/view/PinnedDetailsOwn.dart';
import 'package:groceryboouser/Screens/ProductDetail/ProductDetailMultiple.dart';
import 'package:groceryboouser/Screens/ProductDetail/ProductDetailSingle.dart';
import 'package:groceryboouser/Styles/my_colors.dart';
import 'package:groceryboouser/Styles/my_icons.dart';
import 'package:groceryboouser/Utilities/Constant.dart';
import 'package:get/get.dart';
import 'package:groceryboouser/Utils/internet_connection.dart';

import '../../Homepage/model/CategoryModel.dart';

class AllProducts extends StatefulWidget {
  @override
  _AllProductsState createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {

  CategoryController homePageController = Get.put(CategoryController());

  // List<CategorySecondModel> onCategorySecondModel = [
  //   CategorySecondModel('assets/images/fruit.png', 'Fruit', id: 1),
  //   CategorySecondModel('assets/images/cold_drink.png', 'Cold Drink',id:2 ),
  //   CategorySecondModel('assets/images/fruit.png', 'Fruit',id: 3),
  //   CategorySecondModel('assets/images/cold_drink.png', 'Cold Drink',id:4 ),
  //   CategorySecondModel('assets/images/fruit.png', 'Fruit', id: 5),
  //   CategorySecondModel('assets/images/cold_drink.png', 'Cold Drink',id:6 ),
  //   CategorySecondModel('assets/images/fruit.png', 'Fruit',id: 7),
  //   CategorySecondModel('assets/images/cold_drink.png', 'Cold Drink',id:8 ),
  // ];

  // List<CategoryModel> onCategoryModel = [
  //   CategoryModel('assets/images/fruit.png', 'Fruit'),
  //   CategoryModel('assets/images/cold_drink.png', 'Cold Drink'),
  //   CategoryModel('assets/images/fruit.png', 'Fruit'),
  //   CategoryModel('assets/images/cold_drink.png', 'Cold Drink'),
  // ];

  //List<FollowFriendModel> onRecommanded = [];
  List<FollowFriendModel> selectedList = [];

  @override
  void initState() {
    //onRecommanded.clear();
    // onRecommanded.add(FollowFriendModel(
    //     'assets/images/cherry_img.png', 'Anne Baker Birthday'));
    // onRecommanded.add(
    //     FollowFriendModel('assets/images/orange_img.png', 'Best Dessert Ever'));
    // onRecommanded.add(FollowFriendModel(
    //     'assets/images/cherry_img.png', 'Anne Baker Birthday'));
    // onRecommanded.add(
    //     FollowFriendModel('assets/images/orange_img.png', 'Best Dessert Ever'));

    super.initState();
  }

  int myposition = 0;
  bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, // navigation bar color
      statusBarColor: Colors.white, // status bar color
      statusBarIconBrightness: Brightness.dark, // status bar icons' color
      systemNavigationBarIconBrightness:
      Brightness.light, //navigation bar icons' color
    ));

    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Obx(()=>
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                BackLayout(),
                                SizedBox(
                                  width: 16,
                                ),

                              ],
                            ),
                          ],
                        ),
                      ),

                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          // // Rectangle 360
                          // Container(
                          //   width: 48,
                          //   height: 46,
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.all(Radius.circular(8)),
                          //     border: Border.all(color: grey_e9ecec, width: 1),
                          //   ),
                          //   child: Padding(
                          //     padding: const EdgeInsets.all(10.0),
                          //     child: SvgPicture.asset(
                          //       filter_icon,
                          //       width: 24,
                          //       height: 24,
                          //     ),
                          //   ),
                          // ),

                          Expanded(
                            flex: 1,
                            child: Container(
                                height: 75,
                                child:homePageController
                                    .boolDisplayproduct.value ==
                                    true?
                                ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  physics: ClampingScrollPhysics(),
                                  primary: false,
                                  separatorBuilder: (context, index) => SizedBox(
                                    width: 16,
                                  ),
                                  shrinkWrap: true,
                                  padding: EdgeInsets.only(left: 25, right: 25),
                                  itemCount: homePageController.categoryList.length,
                                  itemBuilder: (context, i) => GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        myposition = homePageController.categoryList[i].id;
                                      });
                                    },
                                    child: Column(
                                      children: [
                                        // Rectangle 361

                                        SizedBox(
                                          width: 48,
                                          height: 48,
                                          child: CircularProfileAvatar(
                                            '',
                                            child: Image.network(
                                              homePageController.categoryList[i].image,
                                              width: 48,
                                              height: 48,
                                              fit: BoxFit.cover,
                                            ),
                                            borderColor: Colors.purpleAccent,
                                            borderWidth: 0,
                                            elevation: 2,
                                            radius: 50,
                                          ),
                                        ),
                                        // Image.asset(
                                        //   onFollowFriendModel[i].title,
                                        //   width: 48,
                                        //   height: 48,
                                        //   fit: BoxFit.cover,
                                        // ),

                                        SizedBox(
                                          height: 6,
                                        ),
                                        // Fruit
                                        Text(homePageController.categoryList[i].name,
                                            style: TextStyle(
                                                color: myposition == homePageController.categoryList[i].id ?black:grey_96a6a3,
                                                fontWeight: FontWeight.w700,
                                                fontFamily: sf_pro_display_bold,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 12.0),
                                            textAlign: TextAlign.left),


                                      ],
                                    ),
                                  ),
                                ):
                                Container()
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        margin: new EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                        height: 1,
                        color: Color(0xfff4f6f6),
                      ),
                    ],
                  ),
                  Expanded(
                    flex: 1,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding:
                            const EdgeInsets.only(left: 25, right: 25, top: 27),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Recommended Pinned
                                Text("Recommended Pinned",
                                    style: TextStyle(
                                        color: const Color(0xff273433),
                                        fontWeight: FontWeight.w700,
                                        fontFamily: sf_pro_display_bold,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16.0),
                                    textAlign: TextAlign.left),

                                // See all
                                Text("See all",
                                    style: TextStyle(
                                        color: grey_96a6a3,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: sf_pro_display_medium,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 13.0),
                                    textAlign: TextAlign.left)
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Container(
                            height: 220,
                            child: homePageController.boolRecommendedPinnedList
                                .value == true?
                            ListView.separated(
                              padding: EdgeInsets.only(left: 24, right: 24),
                              scrollDirection: Axis.horizontal,
                              separatorBuilder: (context, index) => SizedBox(
                                width: 15,
                              ),
                              primary: false,
                              shrinkWrap: true,
                              itemCount: homePageController.recommendedList.length,
                              itemBuilder: (context, i) => Padding(
                                padding: EdgeInsets.only(right: 0),
                                child: InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => PinnedDetails(id: homePageController.recommendedList[i].id,),
                                    ));
                                  },
                                  child: Container(
                                    width: 156,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 156,
                                          width: 156,
                                          child: Stack(
                                            children: [
                                              Image.network(
                                                homePageController.recommendedList[i].cover,
                                                width: double.infinity,
                                                height: 156,
                                                fit: BoxFit.fill,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  setState(
                                                        () {
                                                      if (selectedList
                                                          .contains(homePageController.recommendedList[i])) {
                                                        selectedList
                                                            .remove(homePageController.recommendedList[i]);
                                                      } else {
                                                        //selectedList.add(homePageController.recommendedList[i]);
                                                      }
                                                    },
                                                  );

                                                  print(selectedList.length);
                                                  print(homePageController.recommendedList.length);
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Align(
                                                      alignment: Alignment.topRight,
                                                      child: SvgPicture.asset(
                                                        selectedList.contains(
                                                            homePageController.recommendedList[i])
                                                            ? orange_pin
                                                            : white_pin,
                                                        width: 24,
                                                        height: 24,
                                                      )),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(16.0),
                                                child: Align(
                                                  alignment: Alignment.bottomLeft,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.circular(50),
                                                        color: black),
                                                    child: // Purchase now
                                                    Padding(
                                                      padding: const EdgeInsets.all(6.0),
                                                      child: Text("Purchase  now",
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontFamily:
                                                              sf_pro_display_semibold,
                                                              fontStyle: FontStyle.normal,
                                                              fontSize: 11.0),
                                                          textAlign: TextAlign.left),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 9,
                                        ),
                                        Text(homePageController.recommendedList[i].title,
                                            style: TextStyle(
                                                color: const Color(0xff273433),
                                                fontFamily: sf_pro_display_medium,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14.0),
                                            textAlign: TextAlign.left),

                                        SizedBox(
                                          height: 4,
                                        ),
                                        // $150
                                        Text("\$150",
                                            style: const TextStyle(
                                                color: const Color(0xff273433),
                                                fontFamily: sf_pro_display_bold,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14.0),
                                            textAlign: TextAlign.left),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ):
                                Container()
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 25,right: 25,top: 25,bottom: 25),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(6.7)),
                                  color: grey_e9ecec),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  SvgPicture.asset(
                                    search,
                                    color: grey_96a6a3,
                                    width: 15,
                                    height: 15,
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
                                            fontFamily: sf_pro_display_medium,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 12),
                                        decoration: new InputDecoration(
                                          isDense: true,
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 0, vertical: 10),
                                          hintText:
                                          "Search for a product, brand...",
                                          hintStyle: TextStyle(
                                              color: grey_96a6a3,
                                              // fontWeight: FontWeight.w500,
                                              fontFamily: sf_pro_display_medium,
                                              /*akib changes*/
                                              fontStyle: FontStyle.normal,
                                              fontSize: 12),
                                          /*akib changes*/
                                          border: InputBorder.none,
                                        ),
                                        keyboardType: TextInputType.text,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 25, right: 25),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Recommended Pinned
                                Text("Fruit Result",
                                    style: TextStyle(
                                        color: const Color(0xff273433),
                                        fontWeight: FontWeight.w700,
                                        fontFamily: sf_pro_display_bold,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16.0),
                                    textAlign: TextAlign.left),

                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Color(0x1924d39e)),
                                  child: // 200 items
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8, top: 2, bottom: 2),
                                    child: Text("200 items",
                                        style: TextStyle(
                                            color: skygreen_24d39e,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: sf_pro_display_medium,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 12.0),
                                        textAlign: TextAlign.left),
                                  ),
                                )
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
                            child: Padding(
                                padding: EdgeInsets.only(left: 8, right: 8),
                                child:homePageController.boolProductModelWithVeriantimportCategoryproduct
                                    .value == true?
                                GridView.builder(
                                  primary: false,
                                  shrinkWrap: true,
                                  padding: EdgeInsets.all(0),
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 0.80,
                                      /*akib changes*/
                                      mainAxisSpacing: 0.0,
                                      crossAxisSpacing: 0.0),
                                  itemCount: homePageController.productModelWithVeriantimportCategory.length,
                                  itemBuilder: (context, i) => InkWell(
                                    onTap: (){
                                      if(homePageController.productModelWithVeriantimportCategory[i].varientsList.length == 1){
                                        Navigator.push(context, MaterialPageRoute(
                                          builder: (context) => ProductDetailSingle(productId:homePageController.productModelWithVeriantimportCategory[i].id),
                                        ));
                                      }else if(homePageController.productModelWithVeriantimportCategory[i].varientsList.length >= 1){
                                        Navigator.push(context, MaterialPageRoute(
                                          builder: (context) => ProductDetailMultiple(productId:homePageController.productModelWithVeriantimportCategory[i].id ),
                                        ));
                                      }


                                    },
                                    child: Padding(
                                      padding:
                                      EdgeInsets.only(left: 8, right: 8, bottom: 16),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(12)),

                                            // boxShadow: [BoxShadow(
                                            //     color:  Color(0x144343b2),
                                            //     offset: Offset(5,20),
                                            //     blurRadius: 20,
                                            //     spreadRadius: 10
                                            // )] ,
                                            color: Colors.white),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Image.network(
                                                homePageController.productModelWithVeriantimportCategory[i].image,
                                                width: double.infinity,
                                                height: 114,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            /*akib changes*/

                                            // Fruit
                                            Padding(
                                              padding: EdgeInsets.only(left: 16, right: 16),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text(homePageController.productModelWithVeriantimportCategory[i].name,
                                                      style: TextStyle(
                                                          color: const Color(0xff273433),
                                                          fontWeight: FontWeight.w600,
                                                          fontFamily:
                                                          sf_pro_display_semibold,
                                                          fontStyle: FontStyle.normal,
                                                          fontSize: 12.0),
                                                      textAlign: TextAlign.center),


                                                  //   By weight , $1.5/kg
                                                  //    for(int index=0;index<homePageController.productModelWithVeriantimportCategory[i].
                                                  //    varientsList.length ;index++)
                                                  Text(homePageController.productModelWithVeriantimportCategory[i].varientsList[0].unit,
                                                      style: TextStyle(
                                                          color: grey_96a6a3,
                                                          fontWeight: FontWeight.w500,
                                                          fontFamily: sf_pro_display_medium,
                                                          fontStyle: FontStyle.normal,
                                                          fontSize: 11.0),
                                                      textAlign: TextAlign.left),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      // $1.5
                                                      Text("\$${homePageController.productModelWithVeriantimportCategory[i].varientsList[0].cost}",
                                                          style: const TextStyle(
                                                              color:
                                                              const Color(0xff273433),
                                                              fontWeight: FontWeight.w600,
                                                              fontFamily:
                                                              sf_pro_display_semibold,
                                                              fontStyle: FontStyle.normal,
                                                              fontSize: 14.0),
                                                          textAlign: TextAlign.left),

                                                      Column(
                                                        children: [
                                                          homePageController.productModelWithVeriantimportCategory[i].varientsList[0].isAdded==true
                                                              ? Row(
                                                            mainAxisSize:
                                                            MainAxisSize.min,
                                                            children: <Widget>[
                                                              SizedBox(
                                                                height: 25,
                                                                width: 25,
                                                                child: IconButton(
                                                                  icon: Icon(
                                                                      Icons.remove),
                                                                  padding:
                                                                  EdgeInsets.zero,
                                                                  onPressed: () {
                                                                    setState(() {
                                                                      if ( homePageController.productModelWithVeriantimportCategory[i].varientsList[0].count > 0) {
                                                                        homePageController.productModelWithVeriantimportCategory[i].varientsList[0].count=
                                                                            homePageController.productModelWithVeriantimportCategory[i].varientsList[0].count -1;
                                                                      }
                                                                    });
                                                                  },
                                                                  color: Colors.green,
                                                                ),
                                                              ),
                                                              Text(homePageController.productModelWithVeriantimportCategory[i].varientsList[0].count
                                                                  .toString()),
                                                              SizedBox(
                                                                height: 25,
                                                                width: 25,
                                                                child: IconButton(
                                                                  icon:
                                                                  Icon(Icons.add),
                                                                  color: Colors.green,
                                                                  padding:
                                                                  EdgeInsets.zero,
                                                                  onPressed: () {
                                                                    print("object---------------------");
                                                                    setState(() {
                                                                      homePageController.productModelWithVeriantimportCategory[i].varientsList[0].count=
                                                                          homePageController.productModelWithVeriantimportCategory[i].varientsList[0].count +1;
                                                                    });
                                                                  },
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                              : GestureDetector(
                                                            onTap: () {
                                                              setState(() {
                                                                print("object");
                                                                if(homePageController.productModelWithVeriantimportCategory[i].varientsList.length == 1)
                                                                {
                                                                  FocusScope.of(context).unfocus();
                                                                  checkNet(context).then((value) {
                                                                    homePageController.addToCart(homePageController.productModelWithVeriantimportCategory[i].id.toString(),context);
                                                                  });
                                                                }
                                                                else if(homePageController.productModelWithVeriantimportCategory[i].varientsList.length >= 1){
                                                                  displayBottomSheetVarient(homePageController.productModelWithVeriantimportCategory[i].id.toString(),context);
                                                                }

                                                                // homePageController.productModelWithVeriantimportCategory[i].varientsList[0].isAdded = true;
                                                                // if(homePageController.productModelWithVeriantimportCategory[i].varientsList.length==1){
                                                                //   homePageController.addToCart(homePageController.productModelWithVeriantimportCategory[i].id,context);
                                                                //   //homePageController.getProductId=homePageController.productModelWithVeriantimportCategory[i].id;
                                                                //   if( homePageController.boolgetProductId.value ==true){
                                                                //     showModalBottomSheet(
                                                                //         isScrollControlled: false,
                                                                //         backgroundColor: Colors.transparent,
                                                                //         context: context,
                                                                //         builder: (ctx) {
                                                                //
                                                                //           return DraggableScrollableSheet(
                                                                //               initialChildSize: 0.80,
                                                                //               maxChildSize: 1,
                                                                //               minChildSize: 0.1,
                                                                //
                                                                //
                                                                //               builder: (BuildContext context, ScrollController scrollController) {
                                                                //                 return StatefulBuilder(
                                                                //                   builder: (context, setState) => Container(
                                                                //                       decoration: new BoxDecoration(
                                                                //                         //   color: forDialog ? Color(0xFF737373) : Colors.white,
                                                                //                           color: Colors.white,
                                                                //                           borderRadius: new BorderRadius.only(
                                                                //                               topLeft: const Radius.circular(30.0),
                                                                //                               topRight: const Radius.circular(30.0))),
                                                                //                       //    height: MediaQuery.of(context).size.height  * 0.3,
                                                                //                       child: Column(
                                                                //                         mainAxisAlignment: MainAxisAlignment.start,
                                                                //                         crossAxisAlignment: CrossAxisAlignment.start,
                                                                //                         children: <Widget>[
                                                                //
                                                                //                           SizedBox(height: 25,),
                                                                //
                                                                //                           // Rectangle 1329
                                                                //                           Align(
                                                                //                             alignment: Alignment.topCenter,
                                                                //                             child: Opacity(
                                                                //                               opacity : 0.4000000059604645,
                                                                //                               child:   Container(
                                                                //                                   width: 48,
                                                                //                                   height: 4,
                                                                //                                   decoration: BoxDecoration(
                                                                //                                       borderRadius: BorderRadius.all(
                                                                //                                           Radius.circular(4)
                                                                //                                       ),
                                                                //                                       color: const Color(0xff96a6a3)
                                                                //                                   )
                                                                //                               ),
                                                                //                             ),
                                                                //                           ),
                                                                //
                                                                //
                                                                //
                                                                //
                                                                //
                                                                //                           SizedBox(height: 22,),
                                                                //
                                                                //                           Padding(
                                                                //                             padding: const EdgeInsets.only(left: 24,right: 24),
                                                                //                             child: Column(
                                                                //                               mainAxisAlignment: MainAxisAlignment.start,
                                                                //                               crossAxisAlignment: CrossAxisAlignment.start,
                                                                //                               children: [
                                                                //
                                                                //                                 // Avocardo America
                                                                //                                 Text(
                                                                //                                     "Avocardo America",
                                                                //                                     style: const TextStyle(
                                                                //                                         color:  const Color(0xff273433),
                                                                //
                                                                //                                         fontFamily: sf_pro_display_bold,
                                                                //                                         fontStyle:  FontStyle.normal,
                                                                //                                         fontSize: 24.0
                                                                //                                     ),
                                                                //                                     textAlign: TextAlign.left
                                                                //                                 ),
                                                                //
                                                                //                                 SizedBox(height: 10,),
                                                                //                                 // Select any one
                                                                //                                 Text(
                                                                //                                     "Select any one",
                                                                //                                     style:  TextStyle(
                                                                //                                         color:  black_273433,
                                                                //                                         //fontFamily: sfProRegularFont,
                                                                //                                         fontStyle:  FontStyle.normal,
                                                                //                                         fontSize: 14.0
                                                                //                                     ),
                                                                //                                     textAlign: TextAlign.left
                                                                //                                 ),
                                                                //
                                                                //                                 SizedBox(height: 20,),
                                                                //
                                                                //                               ],
                                                                //                             ),
                                                                //                           )
                                                                //
                                                                //
                                                                //                         ],
                                                                //                       )
                                                                //                   ),
                                                                //                 );
                                                                //               }
                                                                //           );
                                                                //         }
                                                                //     );
                                                                //
                                                                //
                                                                //   }
                                                                //   print("Single");
                                                                // }else{
                                                                //   if( homePageController.boolgetProductId.value ==true){
                                                                //
                                                                //   }
                                                                //
                                                                //   print("Multiple");
                                                                // }
                                                              });
                                                            },
                                                            child: Container(
                                                              height: 20,
                                                              width: 20,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(6),
                                                                  color:
                                                                  skygreen_24d39e),
                                                              child: Icon(
                                                                Icons.add,
                                                                color: Colors.white,
                                                                size: 14,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ):
                                Container()
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
          )


        ));
  }
  void displayBottomSheetVarient(String productid,BuildContext context) {
    homePageController.multivariantAPI(productid.toString(),context);
    int radioItem = 5;

    int id = 1;

    int _n = 1;


    showModalBottomSheet(
        isScrollControlled: false,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (ctx) {

            return    DraggableScrollableSheet(
            initialChildSize: 0.80,
            maxChildSize: 1,
            minChildSize: 0.1,


            builder: (BuildContext context, ScrollController scrollController) {
              return StatefulBuilder(
                builder: (context, setState) => Container(
                    decoration: new BoxDecoration(
                      //   color: forDialog ? Color(0xFF737373) : Colors.white,
                        color: Colors.white,
                        borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(30.0),
                            topRight: const Radius.circular(30.0))),
                    //    height: MediaQuery.of(context).size.height  * 0.3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        SizedBox(height: 25,),

                        // Rectangle 1329
                        Align(
                          alignment: Alignment.topCenter,
                          child: Opacity(
                            opacity : 0.4000000059604645,
                            child:   Container(
                                width: 48,
                                height: 4,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(4)
                                    ),
                                    color: const Color(0xff96a6a3)
                                )
                            ),
                          ),
                        ),
                        SizedBox(height: 22,),

                        Padding(
                          padding: const EdgeInsets.only(left: 24,right: 24),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              // Avocardo America
                              Text(
                                  homePageController.productModelWithVeriantimportCategory[0].name,
                                  style: const TextStyle(
                                      color:  const Color(0xff273433),

                                      fontFamily: sf_pro_display_bold,
                                      fontStyle:  FontStyle.normal,
                                      fontSize: 24.0
                                  ),
                                  textAlign: TextAlign.left
                              ),

                              SizedBox(height: 10,),
                              // Select any one
                              Text(
                                  "Select any one",
                                  style:  TextStyle(
                                      color:  black_273433,
                                      //fontFamily: sfProRegularFont,
                                      fontStyle:  FontStyle.normal,
                                      fontSize: 14.0
                                  ),
                                  textAlign: TextAlign.left
                              ),

                              SizedBox(height: 20,),

                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:
                                homePageController.productModelWithVeriantimportCategory[0].varientsList.map((data) => RadioListTile(
                                  title: Text("${data.unit}",style: TextStyle(
                                      fontFamily: sf_pro_display_semibold,
                                      fontSize: 14,
                                      color: black_273433
                                  ),),
                                  groupValue: id,
                                  controlAffinity: ListTileControlAffinity.trailing,
                                  dense: false,
                                  activeColor: skygreen_24d39e,
                                  contentPadding: EdgeInsets.symmetric(horizontal: 0,vertical: 5),
                                  visualDensity: const VisualDensity(
                                      horizontal: VisualDensity.minimumDensity,
                                      vertical: VisualDensity.minimumDensity),
                                  //    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  value: data.id,
                                  onChanged: (val) {
                                    setState(() {
                                      //radioItem =
                                      id = data.id;
                                    });
                                  },
                                )).toList(),
                              ),

                              Row(
                                children: [
                                  new Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: grey_e9ecec
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: new Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[

                                          Container(
                                            width: 24,
                                            height: 24,
                                            child: new FloatingActionButton(
                                              onPressed: (){
                                                setState(() {
                                                  if (_n != 0){
                                                    _n--;
                                                  }
                                                  //radioItem=_n * radioItem;
                                                  //print(radioItem);
                                                });
                                              },
                                              elevation: 0,
                                              child: Container(
                                                width: 24,
                                                height: 24,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(6),

                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(5.0),
                                                  child: SvgPicture.asset(minus_icon,),
                                                ),
                                              ),
                                              backgroundColor: Colors.white,),
                                          ),

                                          SizedBox(width: 15,),

                                          // 1
                                          SizedBox(
                                            width: 20,
                                            child: Center(
                                              child: Text(
                                                  '$_n',
                                                  style:  TextStyle(
                                                    color:  black_273433,
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily: sf_pro_display_bold,
                                                    fontStyle:  FontStyle.normal,
                                                    fontSize: 16.0,
                                                  ),
                                                  textAlign: TextAlign.left
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 15,),
                                          Container(
                                            width: 24,
                                            height: 24,
                                            child: new FloatingActionButton(
                                              onPressed: (){

                                                setState(() {
                                                  _n++;
                                                  //radioItem=_n * radioItem;
                                                });
                                              },
                                              elevation: 0,
                                              child: Container(
                                                width: 24,
                                                height: 24,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(6),

                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(5.0),
                                                  child: SvgPicture.asset(plus,),
                                                ),
                                              ),
                                              backgroundColor: Colors.white,),
                                          ),



                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 20,),
                                  Expanded(
                                    flex: 1,
                                    child: ElevatedButton(
                                        child: //
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [

                                            // Add to basket
                                            Text(
                                                "Add to basket",
                                                style:  TextStyle(
                                                    color:  Colors.white,
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily: sf_pro_display_bold,
                                                    fontStyle:  FontStyle.normal,
                                                    fontSize: 16.0
                                                ),
                                                textAlign: TextAlign.left
                                            ),
                                            SizedBox(width: 5,),
                                            Text(
                                                "\$${radioItem}",
                                                style:  TextStyle(
                                                    color:  Colors.white,
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily: sf_pro_display_bold,
                                                    fontStyle:  FontStyle.normal,
                                                    fontSize: 16.0
                                                ),
                                                textAlign: TextAlign.left
                                            ),
                                            //for(int j=0;j<homePageController.productModelWithVeriantimportCategory[0].varientsList.length;j++)

                                            // Text(
                                            //     "\$${homePageController.productModelWithVeriantimportCategory[0].varientsList[j].cost}",
                                            //     style:  TextStyle(
                                            //         color:  Colors.white,
                                            //         fontWeight: FontWeight.w700,
                                            //         fontFamily: sf_pro_display_bold,
                                            //         fontStyle:  FontStyle.normal,
                                            //         fontSize: 16.0
                                            //     ),
                                            //     textAlign: TextAlign.left
                                            // ),
                                          ],
                                        ), // Button
                                        onPressed: () {
                                          homePageController.addToCart(productid.toString(),context);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: skygreen_24d39e,
                                          onPrimary: Colors.white,
                                          elevation: 0,
                                          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 21),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8),
                                            side: BorderSide(color: skygreen_24d39e, width: 0),
                                          ),
                                        )),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )


                      ],
                    )
                ),
              );
            }
            );



        }
    );
  }
}