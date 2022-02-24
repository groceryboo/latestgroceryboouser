import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:groceryboouser/Layouts/ElevatedGreenButton.dart';
import 'package:groceryboouser/Layouts/ToolbarBackOnly.dart';
import 'package:groceryboouser/Model/BannerModel.dart';
import 'package:groceryboouser/Model/PinnedGridModel.dart';
import 'package:groceryboouser/Screens/Dashboard/view/BottomNavigation.dart';
import 'package:groceryboouser/Screens/Homepage/view/HomepageView.dart';
import 'package:groceryboouser/Screens/MyBasketScreen/view/MyBasket.dart';
import 'package:groceryboouser/Screens/Pinned/controller/PinnedController.dart';
import 'package:groceryboouser/Styles/my_colors.dart';
import 'package:groceryboouser/Styles/my_icons.dart';
import 'package:groceryboouser/Styles/my_strings.dart';
import 'package:groceryboouser/Utilities/Constant.dart';
import 'package:groceryboouser/Utilities/TextUtilities.dart';
import 'package:groceryboouser/Utils/text_utilities.dart';

import '../../../Model/QuantityList.dart';

class PinnedDetails extends StatefulWidget {
  int id;


  PinnedDetails({this.id});

  @override
  _PinnedDetailsState createState() => _PinnedDetailsState();
}

class _PinnedDetailsState extends State<PinnedDetails> {
  PinnedController pinnedController = Get.put(PinnedController());

  // String descText = "Donec laoreet, nulla quis auctor porta, orci augue sodales est, in ultricies sapien massa in lacus. Aenean magna nisl, varius sit amet ligula et, faucibus consequat mauris. In luctus ex quis dolor pulvinar, vel egestas tortor ultrices."
  //     "\nIn eget varius metus. Suspendisse ultricies magna in tincidunt tincidunt. Aenean quis est at sem ultrices efficitur eget ac elit. Nam dapibus tortor tincidunt orci ultricies blandit. Quisque maximus metus eu lectus tempor, sit amet porta dolor aliquam. Praesent volutpat elit ipsum, placerat volutpat leo eleifend sed.";
   bool descTextShowFlag = false;
  //
  // List<PinnedGridModel> onPinnedGridModel = [
  //   PinnedGridModel('assets/images/lemon.png', 'Lemon','1.5 kg','\$25'),
  //   PinnedGridModel('assets/images/lemon.png', 'Lemon','1.5 kg','\$25'),
  //   PinnedGridModel('assets/images/watermelon.png', 'Watermelon','3 kg','\$30'),
  //   PinnedGridModel('assets/images/watermelon.png', 'Watermelon','3 kg','\$30'),
  //   PinnedGridModel('assets/images/avocado.png', 'Avocado','1 kg','\$20'),
  //   PinnedGridModel('assets/images/avocado.png', 'Avocado','1 kg','\$20'),
  //   PinnedGridModel('assets/images/avocado.png', 'Avocado','1 kg','\$20'),
  //
  // ];

  List<BannerModel> onBannerModel = [
    BannerModel( "assets/images/avocado.png"),
    BannerModel( "assets/images/avocado.png"),
    BannerModel( "assets/images/avocado.png"),
    BannerModel( "assets/images/avocado.png"),
  ];
  @override
  void initState() {
    // TODO: implement initState
    pinnedController.displayPinnedDetails(widget.id);
    super.initState();
  }





  /*Add on click bottom sheet open code*/

  void displayBottomSheet(BuildContext context) {

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

                        Padding(
                          padding:  EdgeInsets.only(left: 24,right: 24,top: 28,bottom: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  setBoldText("Replacements", 14, black_273433, FontWeight.w700, FontStyle.normal),
                                  setMemdiumHindText("Choose your preferred replacements below", 12, grey_96a6a3,
                                      FontWeight.w500, FontStyle.normal)
                                ],
                              ),
                              Container(
                                height: 24,
                                width: 24,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: skygreen_24d39e
                                ),
                                child: Center(child: setBoldText("4", 12, Colors.white, FontWeight.w700, FontStyle.normal)),
                              )
                            ],
                          ),
                        ),


                        Container(
                          margin: new EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                          height: 1,
                          color: Color(0xfff4f6f6),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: grey_e9ecec
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    children: [
                                      Image.asset(avocado,width: 38,height: 38,),
                                      SizedBox(width: 16,),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            setBoldText("Avocado", 13, black_273433, FontWeight.w700, FontStyle.normal),
                                            setMemdiumHindText("\$1.5 per 1kg", 12, grey_96a6a3, FontWeight.w500, FontStyle.normal)
                                          ],
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(40),
                                            color: Colors.white
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: setBoldText("OUT OF STOCK", 11, black_273433, FontWeight.w700, FontStyle.normal),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 24,),

                              setBoldText("Replace with", 12, grey_96a6a3, FontWeight.w700, FontStyle.normal),


                            ],
                          ),
                        ),

                        Container(
                          height: 65,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            physics: ClampingScrollPhysics(),
                            primary: false,
                            separatorBuilder: (context, index) => SizedBox(
                              width: 16,
                            ),
                            shrinkWrap: true,
                            padding: EdgeInsets.only(left: 24,right: 24),
                            itemCount: onBannerModel.length,
                            itemBuilder: (context, i) => Container(
                              width: 240,

                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1,
                                      color: grey_e9ecec
                                  ),
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  children: [
                                    Image.asset(onBannerModel[i].banner,width: 51,height: 51,),
                                    SizedBox(width: 16,),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        setBoldText("Avocado America", 13, black_273433, FontWeight.w700, FontStyle.normal),
                                        setMemdiumHindText("\$1.5 per 1kg", 12, grey_96a6a3, FontWeight.w500, FontStyle.normal)
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(24.0),

                        //  child: ContinueGreenButton("Replace it",skygreen_24d39e,(){}),

                          child: CommonElevatedButton("Replace it", Colors.white,skygreen_24d39e,saveAvatar()),

                        )


                      ],
                    )
                );
              }
          );
        }
    );
  }

  /*Add on click bottom sheet open code*/

  void displayBottomSheetVarient(BuildContext context) {

    // Default Radio Button Item
    String radioItem = 'Mango';

    // Group Value for Radio Button.
    int id = 1;

    List<QuantityList> fList = [
      QuantityList(
        index: 1,
        name: "Mango",
      ),
      QuantityList(
        index: 2,
        name: "Apple",
      ),
    ];

    int _n = 1;

    void add() {
      setState(() {
        _n++;
      });
    }

    void minus() {
      setState(() {
        if (_n != 0)
          _n--;
      });
    }

    showModalBottomSheet(
        isScrollControlled: false,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (ctx) {

          return DraggableScrollableSheet(
              initialChildSize: 0.65,
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
                                    "Avocardo America",
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
                                        fontFamily: sfProRegularFont,
                                        fontStyle:  FontStyle.normal,
                                        fontSize: 14.0
                                    ),
                                    textAlign: TextAlign.left
                                ),

                                SizedBox(height: 20,),

                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children:
                                  fList.map((data) => RadioListTile(
                                    title: Text("${data.name}",style: TextStyle(
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
                                    value: data.index,
                                    onChanged: (val) {
                                      setState(() {
                                        radioItem = data.name ;
                                        id = data.index;
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
                                                onPressed: minus,
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
                                                  "\$5",
                                                  style:  TextStyle(
                                                      color:  Colors.white,
                                                      fontWeight: FontWeight.w700,
                                                      fontFamily: sf_pro_display_bold,
                                                      fontStyle:  FontStyle.normal,
                                                      fontSize: 16.0
                                                  ),
                                                  textAlign: TextAlign.left
                                              ),
                                            ],
                                          ), // Button
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
          body: SingleChildScrollView(
            child: Obx(()=>
                Padding(
                  padding:  EdgeInsets.only(left: 24,right: 24,top: 30),
                  child: pinnedController
                      .boolPinnedDetails.value ==
                      true?
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BackLayout(),
                      SizedBox(height: 17,),
                      Row(
                        children: [
                          SizedBox(
                            height: 30.6,
                            width: 30.6,
                            child: CircularProfileAvatar(
                              '',
                              child: Image.network(pinnedController.pinnedDetailsArray[0].userImage),
                              borderColor: skygreen_24d39e,
                              borderWidth: 1,
                              elevation: 2,
                              radius: 50,
                            ),
                          ),
                          SizedBox(width: 10,),
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Pinned by Kelly
                                Text(
                                    pinnedController.pinnedDetailsArray[0].title,
                                    style:  TextStyle(
                                        color:  black_273433,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: sf_pro_display_bold,
                                        fontStyle:  FontStyle.normal,
                                        fontSize: 11.0
                                    ),
                                    textAlign: TextAlign.left
                                ),

                                Row(
                                  children: [
                                    SvgPicture.asset(time,width: 12,height: 12,),
                                    SizedBox(width: 4,),
                                    // 2hrs ago
                                    Text(
                                        "2hrs ago",
                                        style:  TextStyle(
                                            color: grey_96a6a3,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: sf_pro_display_regular,
                                            fontStyle:  FontStyle.normal,
                                            fontSize: 10.0
                                        ),
                                        textAlign: TextAlign.left
                                    )

                                  ],
                                )
                              ],
                            ),
                          ),
                          SvgPicture.asset(circle_dots,width: 28,height: 28,)
                        ],
                      ),

                      SizedBox(height: 17,),
                      // Anne Baker Birthday 🎉
                      Text(
                          pinnedController.pinnedDetailsArray[0].title,
                          style:  TextStyle(
                              color:  black_273433,
                              fontWeight: FontWeight.w600,
                              fontFamily: sf_pro_display_semibold,
                              fontStyle:  FontStyle.normal,
                              fontSize: 11.0
                          ),
                          textAlign: TextAlign.center
                      ),
                      SizedBox(height: 17,),
                      GestureDetector(
                          onTap: ()=>  displayBottomSheetVarient(context),
                          child: Image.network(pinnedController.pinnedDetailsArray[0].cover,width: double.infinity,height: 248,fit: BoxFit.fill,)),
                      SizedBox(height: 17,),
                      Container(
                        margin: new EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                        height: 1,
                        color: Color(0xfff4f6f6),
                      ),

                      SizedBox(height: 16,),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(top: 3),
                            child: Container(
                              height: 30,
                              width: 40,
                              // alignment: FractionalOffset.center,
                              child: new Stack(
                                //alignment:new Alignment(x, y)
                                children: <Widget>[
                                  SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProfileAvatar(
                                      '',
                                      child: Image.asset('assets/images/girl.png'),
                                      borderColor: Colors.white,
                                      borderWidth: 1,
                                      elevation: 2,
                                      radius: 50,
                                    ),
                                  ),
                                  new Positioned(
                                    left: 10.0,
                                    child: SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProfileAvatar(
                                        '',
                                        child: Image.asset('assets/images/girl.png'),
                                        borderColor: Colors.white,
                                        borderWidth: 1,
                                        elevation: 2,
                                        radius: 50,
                                      ),
                                    ),
                                  ),
                                  new Positioned(
                                    left:20.0,
                                    child: SvgPicture.asset(black_more_dot_icon,width: 22,height: 22,),
                                  )

                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 5,),
                          Expanded(
                              flex: 1,
                              child: setRegularHindText("Kelly & 3,500+ pinned this", 12, grey_96a6a3, FontWeight.w500, FontStyle.normal)),
                          SvgPicture.asset(bookmark,width: 32,height: 32,),
                          SvgPicture.asset(share_btn,width: 32,height: 32,),
                        ],
                      ),

                      /*Hide Show Description*/
                      Container(
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(pinnedController.pinnedDetailsArray[0].description,style: TextStyle(fontFamily: sf_pro_display_regular,fontSize: 13,color: grey_96a6a3),
                              maxLines: descTextShowFlag ? 12 : 5,textAlign: TextAlign.start,),
                            SizedBox(height: 6,),
                            InkWell(
                              onTap: (){ setState(() {
                                descTextShowFlag = !descTextShowFlag;
                              }); },

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  descTextShowFlag ? setBoldText("Read less", 12, skygreen_24d39e, FontWeight.w500, FontStyle.normal) : setBoldText("Read More", 12, skygreen_24d39e, FontWeight.w500, FontStyle.normal),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 16,),

                      Container(
                        margin: new EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                        height: 1,
                        color: Color(0xfff4f6f6),
                      ),

                      SizedBox(height: 16,),

                      Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: setBoldText("List items on this basket", 12, black_273433, FontWeight.w700, FontStyle.normal)),
                          SvgPicture.asset(light_bag,width: 12,height: 12,),
                          SizedBox(width: 5,),
                          setMemdiumPoppinsText("${pinnedController.pinnedDetailsArray[0].pinItems.length} items", 12, grey_96a6a3, FontWeight.w500, FontStyle.normal)
                        ],
                      ),

                      SizedBox(height: 16,),

                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: grey_e9ecec,
                              width: 1
                          ),
                          borderRadius: BorderRadius.circular(6),
                          color: Color(0xfff5f8f8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(info,width: 15,height: 15,),
                              SizedBox(width: 7,),
                              setMemdiumPoppinsText("Some of the items is out of stock. Wanna replace it ? \nwe will suggest you the preferred item.",
                                  10, grey_96a6a3, FontWeight.w500, FontStyle.normal)
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 10,),

                      GridView.builder(
                        primary: false,
                        shrinkWrap: true,
                        padding: EdgeInsets.all(0),
                        gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 0.73,
                            mainAxisSpacing: 15.0,
                            crossAxisSpacing: 12.0),
                        itemCount: pinnedController.pinnedDetailsArray[0].pinItems.length,
                        itemBuilder: (context, i) => GestureDetector(
                          onTap: () =>  null,
                          child: Container(
                            width: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    Image.network(pinnedController.pinnedDetailsArray[0].pinItems[i].productImage,width: double.infinity,height: 100,fit: BoxFit.fill,),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: SvgPicture.asset(delete_black,),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 5,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    setSemiBoldPoppinsText(pinnedController.pinnedDetailsArray[0].pinItems[i].productName, 11, black_273433, FontWeight.w600, FontStyle.normal),
                                    setMemdiumPoppinsText(pinnedController.pinnedDetailsArray[0].pinItems[i].varientUnit, 10, grey_96a6a3, FontWeight.w500, FontStyle.normal)
                                  ],
                                ),

                                setMemdiumPoppinsText("\$ ${pinnedController.pinnedDetailsArray[0].pinItems[i].varientCost}", 11, skygreen_24d39e, FontWeight.w500, FontStyle.normal)

                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        margin: EdgeInsets.only(left: 18,right:18,bottom: 15),
                        child: Expanded(
                          flex: 1,
                          child: ElevatedButton(
                              child: //
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Add to basket
                                  Text(
                                    purchase_now,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: sf_pro_display_bold,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16.0),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "\$ 400",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: sf_pro_display_semibold,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16.0),
                                  ),
                                ],
                              ), // Button
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => MyBasket(),
                                ));
                              },
                              style: ElevatedButton.styleFrom(
                                primary: skygreen_24d39e,
                                onPrimary: Colors.white,
                                elevation: 0,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 20),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side: BorderSide(color: skygreen_24d39e, width: 0),
                                ),
                              )),
                        ),
                      )

                    ],
                  ):
                      Center(child: CircularProgressIndicator())
                ),
            )
          ),
        ));
  }
}


// class StackIamge extends StatelessWidget {
//
//
//   @override
//   Widget build(BuildContext context) {
//     List<string> images = ["image1Link", "image2Link", "image3Link"];
//     List<BannerModel> onBannerModel = [
//       BannerModel( "assets/images/banner1.png"),
//       BannerModel( "assets/images/banner1.png"),
//       BannerModel( "assets/images/banner1.png"),
//       BannerModel( "assets/images/banner1.png"),
//     ];
//     return ImageStack(
//       imageList: images,
//       imageRadius: 25, // Radius of each images
//       imageCount: 3, // Maximum number of images to be shown
//       imageBorderWidth: 3, // Border width around the images
//     );
//   }
// }

saveAvatar() {
  Get.to(BottomNavigation());

}