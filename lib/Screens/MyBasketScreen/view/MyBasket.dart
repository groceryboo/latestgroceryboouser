import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:groceryboouser/Screens/Authentication/SignUp/view/emailview.dart';
import 'package:groceryboouser/Screens/Location/controller/AddressController.dart';
import 'package:groceryboouser/Screens/MyBasketScreen/controller/MyBasketController.dart';
import 'package:groceryboouser/Styles/my_colors.dart';
import 'package:groceryboouser/Styles/my_height.dart';
import 'package:groceryboouser/Styles/my_icons.dart';
import 'package:groceryboouser/Utilities/Constant.dart';
import 'package:groceryboouser/Utilities/TextUtilities.dart';
import 'package:groceryboouser/Utils/text_utilities.dart';

import '../../../Model/BannerModel.dart';
import '../../../Model/CategorySecondModel.dart';

class MyBasket extends StatefulWidget {


  @override
  _MyBasketState createState() => _MyBasketState();
}

class _MyBasketState extends State<MyBasket> with SingleTickerProviderStateMixin{

  MyBasketController myBasketController = Get.put(MyBasketController());
  AddressController addressController = Get.put(AddressController());

  var instructionController = TextEditingController();

  // List<PinnedGridModel> onPinnedGridModel = [
  //   PinnedGridModel('assets/images/lemon.png', 'Lemon','1.5 kg','\$25'),
  //   PinnedGridModel('assets/images/watermelon.png', 'Watermelon','3 kg','\$30'),
  //   PinnedGridModel('assets/images/avocado.png', 'Avocado','1 kg','\$20'),
  //
  // ];


  int _n = 1;
  int subTotal=1;

  void add() {
    setState(() {
      _n++;
    });
  }


  bool status = false;
  bool statussecond = false;
  bool isSwitchedPush = false;

  bool isChecked = false;

  TabController _tabController;
  int activePageIndex = 0;
  String is_pinned;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    addressController.listAddressAPI(context);
    myBasketController.displayBasketList(context);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();

  }

  // List<CategorySecondModel> onBannerModel = [
  //   CategorySecondModel( "assets/images/avocado.png","Wrok",id: 1),
  //   CategorySecondModel( "assets/images/avocado.png","Office",id: 2),
  //   CategorySecondModel( "assets/images/avocado.png","Other",id: 3),
  // ];

  String myposition = "";


  /*Add on click bottom sheet open code*/

  void displayBottomSheet(BuildContext context)  {

    showModalBottomSheet(
        isScrollControlled: false,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (ctx) {

          return DraggableScrollableSheet(
              initialChildSize: 0.95,
              maxChildSize: 1,
              minChildSize: 0.1,


              builder: (BuildContext context, ScrollController scrollController) {
                return StatefulBuilder(

                  builder: (BuildContext context,
                      StateSetter setState) {
                    return Container(
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

                            Center(
                              child: Padding(
                                padding:  EdgeInsets.only(left: 24,right: 24,top: 28,bottom: 16),
                                child: setBoldSFProText("Set recurring order", 18, black_273433, FontWeight.w700,
                                    FontStyle.normal),
                              ),
                            ),

                            Container(
                              margin: new EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                              height: 1,
                              color: Color(0xfff4f6f6),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 24,right: 24,top: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: setBoldSFProText("Repeat on", 14, black_273433, FontWeight.w700, FontStyle.normal),

                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom: 10,left: 30),
                                      child: Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: grey_e9ecec,
                                          borderRadius: BorderRadius.circular(
                                            8.0,
                                          ),
                                          // boxShadow: [BoxShadow(
                                          //     color:  Color(0xffe8e8e8),
                                          //     offset: Offset(0,5),
                                          //     blurRadius: 10,
                                          //     spreadRadius: 2
                                          // )] ,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: TabBar(
                                            controller: _tabController,
                                            // give the indicator a decoration (color and border radius)
                                            indicator: BoxDecoration(
                                              borderRadius: BorderRadius.circular(
                                                6.0,
                                              ),
                                              color: Colors.white,
                                            ),
                                            labelColor: black,
                                            unselectedLabelColor: grey_96a6a3,
                                            tabs: [
                                              // first tab [you can add an icon using the icon property]
                                              Tab(
                                                child: Text("Every Day",
                                                  style: TextStyle(fontFamily: sf_pro_display_medium,fontSize: 12),),
                                              ),

                                              // second tab [you can add an icon using the icon property]
                                              Tab(
                                                child: Text("Every Month",style: TextStyle(fontFamily: sf_pro_display_medium,fontSize: 12),),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              margin: new EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                              height: 1,
                              color: Color(0xfff4f6f6),
                            ),

                            // tab bar view here
                            Expanded(
                              child: TabBarView(
                                controller: _tabController,
                                children: [
                                  // first tab bar view widget
                                  new Container(
                                    child: Container(),
                                  ),

                                  // second tab bar view widget
                                  new Container(
                                    child: Email(),
                                  ),
                                ],
                              ),
                            ),


                          ],
                        )
                    );
                  },

                );
              }
          );
        }
    );
  }



  /*choose delivery location bottom sheet open code*/

  void displayBottomSheetDeliveryLocation(BuildContext context)  {

    //listAddressAPI();

    showModalBottomSheet(
        isScrollControlled: false,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (ctx) {

          return DraggableScrollableSheet(
              initialChildSize: 0.78,
              maxChildSize: 1,
              minChildSize: 0.1,


              builder: (BuildContext context, ScrollController scrollController) {
                return StatefulBuilder(

                  builder: (BuildContext context,
                      StateSetter setState) {
                    return Container(
                        decoration: new BoxDecoration(
                          //   color: forDialog ? Color(0xFF737373) : Colors.white,
                            color: Colors.white,
                            borderRadius: new BorderRadius.only(
                                topLeft: const Radius.circular(30.0),
                                topRight: const Radius.circular(30.0))),
                        //    height: MediaQuery.of(context).size.height  * 0.3,
                        child: Obx(()=>
                            Column(
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

                                Center(
                                  child: Padding(
                                    padding:  EdgeInsets.only(left: 24,right: 24,top: 28,bottom: 16),
                                    child: setBoldSFProText("Choose your delivery location", 18, black_273433, FontWeight.w700,
                                        FontStyle.normal),
                                  ),
                                ),

                                Container(
                                  margin: new EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                                  height: 1,
                                  color: Color(0xfff4f6f6),
                                ),

                                SizedBox(height: 24,),

                                Container(
                                  height: 80,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    physics: ClampingScrollPhysics(),
                                    primary: false,
                                    separatorBuilder: (context, index) => SizedBox(
                                      width: 16,
                                    ),
                                    shrinkWrap: true,
                                    padding: EdgeInsets.only(left: 24,right: 24),
                                    itemCount: addressController.addressList.length,
                                    itemBuilder: (context, i) => InkWell(
                                      onTap: (){
                                        setState(() {

                                          myposition = addressController.addressList[i].address;
                                          Navigator.of(context).pop();
                                        });
                                      },
                                      child: Container(
                                        width: 320,

                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1,
                                                color: myposition == addressController.addressList[i].address? skygreen_24d39e:grey_e9ecec
                                            ),
                                            borderRadius: BorderRadius.circular(8)
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Image.network(addressController.addressList[i].image,width: 38,height: 38,),
                                              SizedBox(width: 16,),
                                              Expanded(
                                                flex: 1,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    setBoldText(addressController.addressList[i].savedName, 14, black_273433, FontWeight.w700, FontStyle.normal),
                                                    setMediumSFProText("${addressController.addressList[i].address}", 12, grey_96a6a3, FontWeight.w500, FontStyle.normal)
                                                  ],
                                                ),
                                              ),
                                              Icon(Icons.check,size: 15,color:myposition == addressController.addressList[i].address? skygreen_24d39e:Colors.white,)
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 24,),
                                // or use your current location
                                Padding(
                                  padding: const EdgeInsets.only(left: 24,right: 24),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          "or use your current location",
                                          style: const TextStyle(
                                              color:  grey_96a6a3,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: sf_pro_display_medium,
                                              fontStyle:  FontStyle.normal,
                                              fontSize: 12.0
                                          ),
                                          textAlign: TextAlign.center
                                      ),
                                      SizedBox(height: 10,),
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(3),
                                            border: Border.all(width: 1,color: grey_e9ecec)
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(red_location,width: 13,height: 13,),
                                              SizedBox(width: 10,),
                                              // 1226 University Dr Wahidin...
                                              Expanded(
                                                child: Text(
                                                    "1226 University Dr Wahidin...",
                                                    style: const TextStyle(
                                                        color:  black_273433,
                                                        fontWeight: FontWeight.w700,
                                                        fontFamily: sf_pro_display_bold,
                                                        fontStyle:  FontStyle.normal,
                                                        fontSize: 12.0
                                                    ),
                                                    textAlign: TextAlign.left
                                                ),
                                              ),
                                              SvgPicture.asset(map,width: 15,height: 15,),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )


                              ],
                            )
                        )
                    );
                  },

                );
              }
          );
        }
    );
  }


  // Declare this variable
  int selectedRadio;
  bool _value = false;
  String is_wallet;

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
                  Padding(
                    padding: const EdgeInsets.only(left: 24,right: 24,top: 12,bottom: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 46,
                          height: 46,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 6,
                                blurRadius: 10,
                                offset: Offset(1, 4), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SvgPicture.asset(BackArrow,width: 24,height: 24,),
                          ),
                        ),
                        setBoldSFProText("My Basket", 18, black_273433, FontWeight.w700, FontStyle.normal),
                        Container(
                          width: 46,
                          height: 46,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 6,
                                blurRadius: 10,
                                offset: Offset(1, 4), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SvgPicture.asset(BackArrow,width: 24,height: 24,),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    margin: new EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                    height: 1,
                    color: Color(0xfff4f6f6),
                  ),

              Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap:(){
                          setState(() {
                            displayBottomSheetDeliveryLocation(context);

                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 24,right: 24,top: 12,bottom: 12),
                          child: Row(
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: grey_e9ecec
                                ),
                                child: Icon(Icons.person,size: 18,),
                              ),
                              SizedBox(width: 10,),
                              Expanded(
                                flex: 1,
                                child: Text(
                                    "Deliver to uyi ",
                                    style:  TextStyle(
                                        color:   Color(0xff273433),
                                        fontWeight: FontWeight.w700,
                                        fontFamily: sf_pro_display_semibold,
                                        fontStyle:  FontStyle.normal,
                                        fontSize: 12.0
                                    ),
                                    textAlign: TextAlign.left
                                ),
                              ),
                              Row(
                                children: [
                                  // 1226 University Dr
                                  myposition==""?Text(
                                    "1226 University Dr",
                                    style:  TextStyle(
                                        color:  grey_96a6a3,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: sf_pro_display_medium,
                                        fontStyle:  FontStyle.normal,
                                        fontSize: 11.0
                                    ),
                                    textAlign: TextAlign.left,overflow: TextOverflow.ellipsis,
                                  ):Container(
                                    width:100,
                                    child: Text(
                                      myposition,
                                      style:  TextStyle(
                                          color:  grey_96a6a3,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: sf_pro_display_medium,
                                          fontStyle:  FontStyle.normal,
                                          fontSize: 11.0
                                      ),
                                      textAlign: TextAlign.left,overflow: TextOverflow.ellipsis,maxLines: 1,
                                    ),
                                  ),
                                  SizedBox(width: 4,),
                                  SvgPicture.asset(down_arrow,width: 10,height: 10,color: skygreen_24d39e,),

                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Container(
                            margin: new EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                            height: 1,
                            color: Color(0xfff4f6f6),
                          ),

                          myBasketController.boolDisplayproduct.value ==
                              true?
                          ListView.builder(
                            physics: ClampingScrollPhysics(),
                            primary: false,
                            shrinkWrap: true,
                            itemCount: myBasketController.basketlistModel.length,
                            itemBuilder: (context, i) {
                              return Dismissible(
                                key: UniqueKey(),
                                direction: DismissDirection.endToStart,
                                background: Container(padding:EdgeInsets.only(left: 20),alignment: Alignment.centerLeft,
                                  child:Icon(Icons.delete),
                                  color:Colors.red,
                                ),

                                onDismissed: (_) async{
                                  // Remove the item from the data source.
                                  print(myBasketController.basketlistModel[i].product_id.toString());
                                  setState(() {
                                    myBasketController.deleteFromBasket(myBasketController.basketlistModel[i].product_id, context);
                                    myBasketController.displayBasketList(context);
                                    //items.removeAt(index);
                                  });
                                  setState(() {
                                    snackBar(context, "Delete Items Successfully");
                                  });


                                  // // Then show a snackbar.
                                  // ScaffoldMessenger.of(context)
                                  //     .showSnackBar(SnackBar(content: Text('$item dismissed')));
                                },

                                child: Column(
                                  children: [
                                    Padding(
                                      padding:  EdgeInsets.only(left: 24,right: 24,top: 24,bottom: 24),
                                      child: Container(
                                        width: double.infinity,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Image.network(myBasketController.basketlistModel[i].image,width: 80,height: 80,fit: BoxFit.fill,),
                                            SizedBox(width: 24,),
                                            Expanded(
                                              flex: 1,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  setMediumSFProText(myBasketController.basketlistModel[i].name, 14, black_273433, FontWeight.w600, FontStyle.normal),
                                                  SizedBox(height: 4,),
                                                  setMediumSFProText(myBasketController.basketlistModel[i].varientsList[0].unit, 12, grey_96a6a3, FontWeight.w500, FontStyle.normal),
                                                  SizedBox(height: 12,),
                                                  setSemiBoldSFProText("\$${myBasketController.basketlistModel[i].varientsList[0].cost}", 16, black_273433, FontWeight.w500, FontStyle.normal),
                                                  SizedBox(height: 6,),
                                                ],
                                              ),
                                            ),

                                            Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: new Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: <Widget>[

                                                    Container(
                                                      width: 24,
                                                      height: 24,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(color: Color(0xffe9ecec),width: 1),
                                                          borderRadius: BorderRadius.circular(3)
                                                      ),
                                                      child: new FloatingActionButton(
                                                        onPressed: (){
                                                          setState(() {
                                                            if (_n != 0)
                                                              _n--;

                                                            myBasketController.basketlistModel[i].varientsList[0].cost;
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
                                                      decoration: BoxDecoration(
                                                          border: Border.all(color: Color(0xffe9ecec),width: 1),
                                                          borderRadius: BorderRadius.circular(3)
                                                      ),
                                                      child: new FloatingActionButton(
                                                        onPressed: add,
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



                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: new EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                                      height: 1,
                                      color: Color(0xfff4f6f6),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ):
                          Container(),


                          Padding(
                            padding:  EdgeInsets.only(left: 24,right: 24,top: 16,bottom: 16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                setBoldSFProText("Instruction note", 18, black_273433, FontWeight.w700, FontStyle.normal),
                                SizedBox(height: 8,),
                                Row(
                                  children: [

                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(6.7)),
                                            color: Color(0xfff3f6f6)),
                                        child: Row(
                                          children: [

                                            SizedBox(
                                              width: 7.7,
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Padding(
                                                padding: const EdgeInsets.all(5),
                                                child: new TextField(
                                                  controller: instructionController,
                                                  style: const TextStyle(
                                                      color: black,
                                                      fontFamily: sf_pro_display_medium,
                                                      fontStyle: FontStyle.normal,
                                                      fontSize: 14),
                                                  decoration: new InputDecoration(
                                                    isDense: true,
                                                    contentPadding: EdgeInsets.symmetric(
                                                        horizontal: 0, vertical: 12),
                                                    hintText: "Write here...",
                                                    hintStyle: TextStyle(
                                                        color: grey_96a6a3,
                                                        // fontWeight: FontWeight.w500,
                                                        fontFamily: sf_pro_display_medium,
                                                        /*akib changes*/
                                                        fontStyle: FontStyle.normal,
                                                        fontSize: 14),
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
                                  ],
                                ),
                              ],
                            ),
                          ),

                          Container(
                            margin: new EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                            height: 1,
                            color: Color(0xfff4f6f6),
                          ),

                          Padding(
                            padding:  EdgeInsets.only(left: 24,right: 24,top: 16,bottom: 16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                setBoldSFProText("Wallet", 18, black_273433, FontWeight.w700, FontStyle.normal),
                                SizedBox(height: 22,),
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      _value = !_value;
                                      if(_value==false){
                                        is_wallet="no";
                                      }else{
                                        is_wallet="yes";
                                      }

                                    });
                                  },
                                  child: Row(
                                    children: [

                                      // Use Wallet Balace
                                      Expanded(
                                        flex:1,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                "Use Wallet Balace",
                                                style: const TextStyle(
                                                    color:  black_273433,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: sf_pro_display_medium,
                                                    fontStyle:  FontStyle.normal,
                                                    fontSize: 14.0
                                                ),
                                                textAlign: TextAlign.center
                                            ),

                                            SizedBox(width: 5,),
                                            // $ 5
                                            Text(
                                                "\$ 5",
                                                style: const TextStyle(
                                                    color:  skygreen_24d39e,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: sf_pro_display_semibold,
                                                    fontStyle:  FontStyle.normal,
                                                    fontSize: 14.0
                                                ),
                                                textAlign: TextAlign.left
                                            ),
                                          ],
                                        ),
                                      ),

                                      Container(

                                        child: _value
                                            ? Container(
                                          height: 20,
                                          width: 20,
                                          decoration: BoxDecoration(shape: BoxShape.rectangle,
                                              borderRadius: BorderRadius.circular(5),
                                              color: skygreen_24d39e),
                                          child: Icon(
                                            Icons.check,
                                            size: 15.0,
                                            color: Colors.white,
                                          ),
                                        )
                                            :  Container(
                                          height: 20,
                                          width: 20,
                                          decoration: BoxDecoration(shape: BoxShape.rectangle,
                                              borderRadius: BorderRadius.circular(5),
                                              border: Border.all( width: 1,color: grey_96a6a3)),),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Container(
                            margin: new EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                            height: 1,
                            color: Color(0xfff4f6f6),
                          ),

                          Padding(
                            padding:  EdgeInsets.only(left: 24,right: 24,top: 16,bottom: 16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Push Notifications
                                    Text("Pinned after checkout",
                                        style: TextStyle(
                                            color: black_273433,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: sf_pro_display_medium,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14.0),
                                        textAlign: TextAlign.center),

                                    FlutterSwitch(
                                      width: 40.0,
                                      height: 20.0,
                                      activeColor: skygreen_24d39e,
                                      inactiveColor: Color(0xffe9ecec),
                                      valueFontSize: 0.0,
                                      toggleSize: 15.0,
                                      value: status,
                                      borderRadius: 10.0,
                                      padding: 2.0,
                                      showOnOff: true,
                                      onToggle: (val) {
                                        setState(() {
                                          status = val;
                                          print(status);
                                          if(status==true){
                                            is_pinned="yes";
                                          }else{
                                            is_pinned="no";
                                          }
                                        });
                                      },
                                    ),
                                  ],
                                ),

                                SizedBox(
                                  height: 6,
                                ),

                                // Push notifications are used to provide update on your orders
                                Text("You can make this basket auto pinned \nto your profile after checkout",
                                    style:  TextStyle(
                                        color: grey_96a6a3,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: sf_pro_display_regular,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 12.0),
                                    textAlign: TextAlign.left)
                              ],
                            ),
                          ),

                          Container(
                            margin: new EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                            height: 1,
                            color: Color(0xfff4f6f6),
                          ),

                          Padding(
                            padding:  EdgeInsets.only(left: 24,right: 24,top: 16,bottom: 16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Push Notifications
                                    Text("Make this recurring order",
                                        style: TextStyle(
                                            color: black_273433,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: sf_pro_display_medium,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14.0),
                                        textAlign: TextAlign.center),

                                    FlutterSwitch(
                                      width: 40.0,
                                      height: 20.0,
                                      activeColor: skygreen_24d39e,
                                      inactiveColor: Color(0xffe9ecec),
                                      valueFontSize: 0.0,
                                      toggleSize: 15.0,
                                      value: statussecond,
                                      borderRadius: 10.0,
                                      padding: 2.0,
                                      showOnOff: false,
                                      onToggle: (val) {
                                        setState(() {
                                          statussecond = val;
                                          displayBottomSheet(context);
                                        });
                                      },
                                    ),
                                  ],
                                ),

                                SizedBox(
                                  height: 6,
                                ),

                                // Push notifications are used to provide update on your orders
                                Text("You can make this basket recurring order \nrepeated as you wish.",
                                    style:  TextStyle(
                                        color: grey_96a6a3,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: sf_pro_display_regular,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 12.0),
                                    textAlign: TextAlign.left)
                              ],
                            ),
                          ),


                          Container(
                            margin: new EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                            height: 1,
                            color: Color(0xfff4f6f6),
                          ),
                          Container(
                            margin: new EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                            height: 15,
                            color: Color(0xfff4f6f6),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 24,right: 24,top: 12,bottom: 12),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    setMediumSFProText("Subtotal", 14, grey_96a6a3, FontWeight.w500, FontStyle.normal),
                                    setMediumSFProText("\$100", 14, grey_96a6a3, FontWeight.w500, FontStyle.normal),

                                  ],
                                ),
                                SizedBox(height: 5,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    setMediumSFProText("Delivery fee", 14, grey_96a6a3, FontWeight.w500, FontStyle.normal),
                                    setMediumSFProText("\$5", 14, grey_96a6a3, FontWeight.w500, FontStyle.normal),

                                  ],
                                ),
                                SizedBox(height: 10,),
                                Container(
                                  margin: new EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                                  height: 1,
                                  color: Color(0xfff4f6f6),
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    setBoldSFProText("Total", 18, black_273433, FontWeight.w700, FontStyle.normal),
                                    setBoldSFProText("\$105", 18, black_273433, FontWeight.w700, FontStyle.normal),

                                  ],
                                ),
                                SizedBox(height: 20,),
                                SizedBox(
                                  width: double.infinity,
                                  height: HeightData.sixty,
                                  child: ElevatedButton(
                                      child: //
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          setBoldSfProDisplayTextAlign(
                                              "Checkout",
                                              14,
                                              Colors.white,
                                              FontWeight.w500,
                                              FontStyle.normal,
                                              TextAlign.center),
                                          SizedBox(width: 10,),
                                          Icon(Icons.arrow_forward,color: Colors.white,size: 18,)
                                        ],
                                      ), // Button
                                      onPressed: () {
                                       setState(() {
                                            if(instructionController.text==""){
                                              snackBar(context, "Please add Instruction");
                                            }
                                            else{
                                              if(_value==false){
                                                is_wallet="no";

                                              }else if(status==false || status==null){
                                                is_pinned="no";
                                                print("is_pinned------------------");

                                              }else if(myposition=="" || myposition==null){
                                                myposition="1226 University Dr Wahidin...";
                                                print("myposition------------------");
                                              }else{
                                                print("API------------------");
                                                myBasketController.orderPlaceAPI(context,"2",instructionController.text,is_wallet,is_pinned,myposition);
                                              }
                                              //myBasketController.orderPlaceAPI(context,"2",instructionController.text,is_wallet,is_pinned,myposition);

                                            }


                                         // if(instructionController.text==""){
                                         //   snackBar(context, "Please add Instruction");
                                         // }else if(_value==null || _value==false){
                                         //   is_wallet="no";
                                         // }else if(_value==true){
                                         //   is_wallet="yes";
                                         // }else if(status==null || status==false){
                                         //   is_pinned="no";
                                         // }else if(status==true){
                                         //   is_pinned="yes";
                                         // }else if(myposition=="" || myposition==null){
                                         //   myposition="1226 University Dr";
                                         // } else{
                                         //   myBasketController.orderPlaceAPI(context,"2",instructionController.text,is_wallet,is_pinned,myposition);
                                         // }
                                       });


                                      },
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
                              ],
                            ),
                          )



                        ],
                      ),
                    ),
                  ),


                ],
              ),
          )        )
    );
  }
}

