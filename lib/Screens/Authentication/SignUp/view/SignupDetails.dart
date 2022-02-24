import 'dart:math';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:groceryboouser/Layouts/ElevatedGreenButton.dart';
import 'package:groceryboouser/Screens/Authentication/SignUp/controller/UpdatedSignupController.dart';
import 'package:groceryboouser/Styles/my_colors.dart';
import 'package:groceryboouser/Styles/my_height.dart';
import 'package:groceryboouser/Styles/my_icons.dart';
import 'package:groceryboouser/Styles/my_strings.dart';
import 'package:groceryboouser/Utilities/Constant.dart';
import 'package:groceryboouser/Utilities/TextUtilities.dart';
import 'package:groceryboouser/Utils/internet_connection.dart';
import 'package:groceryboouser/Utils/text_utilities.dart';

class SignUpDetails extends StatefulWidget {
  const SignUpDetails({Key key}) : super(key: key);

  @override
  _SignUpDetailsState createState() => _SignUpDetailsState();
}

class _SignUpDetailsState extends State<SignUpDetails> {
  var mobileNumberTextController = TextEditingController();
  UpdatedSignupController controller = Get.put(UpdatedSignupController());
  final signupKey = GlobalKey<FormState>();

  /*Country Bottom Sheet*/
  void displayCountryBottomSheet(BuildContext context) async {
    // showSearch<String>(
    //   context: context,
    //   delegate: CustomDelegate(),
    // );
    // calling funtion to handle search country field
    await controller.clearCountryField();

    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
      ),
      builder: (BuildContext context) {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.white, // navigation bar color
          statusBarColor: blue_3551ff, // status bar color
          statusBarIconBrightness: Brightness.light, // status bar icons' color
          systemNavigationBarIconBrightness:
          Brightness.light, //navigation bar icons' color
        ));

        return DraggableScrollableSheet(
            initialChildSize: 0.75,
            //set this as you want
            maxChildSize: 1,
            //set this as you want
            minChildSize: 0.1,
            //set this as you want
            expand: true,
            builder: (context, scrollController) {
              return StatefulBuilder(
                builder: (BuildContext context,
                    StateSetter setState /*You can rename this!*/) {
                  return Padding(
                      padding: MediaQuery.of(context).viewInsets,
                      child: Container(
                          height: MediaQuery.of(context).size.height - 500.0,
                          decoration: new BoxDecoration(
                              color: Colors.white,
                              borderRadius: new BorderRadius.only(
                                  topLeft: const Radius.circular(30.0),
                                  topRight: const Radius.circular(30.0))),
                          child: Wrap(
                            children: <Widget>[
                              Column(
                                children: [
                                  SizedBox(
                                    height: 25,
                                  ),
                                  // Rectangle 1329
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
                                              color: const Color(0xff96a6a3))),
                                    ),
                                  ),

                                  /*Search Layout Below Side*/
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 24,
                                        right: 24,
                                        top: 16,
                                        bottom: 16),
                                    child: Container(

                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            width: 1, color: grey_e9ecec),
                                        color: Colors.white,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 15, right: 15,top: 4.5,bottom: 4.5),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              search,
                                              width: 18,
                                              height: 18,
                                              color: black_273433,
                                            ),
                                            SizedBox(
                                              width: 7.7,
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Padding(
                                                padding:
                                                const EdgeInsets.all(5),
                                                child: new TextField(
                                                  controller: controller
                                                      .searchCountryText.value,
                                                  onChanged: (value) async {
                                                    await controller
                                                        .filterCountryList(
                                                        value);

                                                    setState(() {});
                                                  },
                                                  style: const TextStyle(
                                                      color: black,
                                                      fontWeight:
                                                      FontWeight.w500,
                                                      fontFamily:
                                                      sf_pro_display_medium,
                                                      fontStyle:
                                                      FontStyle.normal,
                                                      fontSize: 16.0),
                                                  decoration:
                                                  new InputDecoration(
                                                    isDense: true,
                                                    contentPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 0,
                                                        vertical: 10),
                                                    hintText: "Search Country",
                                                    hintStyle: TextStyle(
                                                        color: grey_96a6a3,
                                                        fontWeight:
                                                        FontWeight.w500,
                                                        fontFamily:
                                                        sf_pro_display_medium,
                                                        fontStyle:
                                                        FontStyle.normal,
                                                        fontSize: 16.0),
                                                    border: InputBorder.none,
                                                  ),
                                                  keyboardType:
                                                  TextInputType.text,
                                                  cursorColor: black,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),

                                  SizedBox(height: 14,),

                                  SingleChildScrollView(
                                    child: Container(
                                      height:
                                      MediaQuery.of(context).size.height -
                                          300.0,
                                      child: ListView.separated(
                                        scrollDirection: Axis.vertical,
                                        primary: false,
                                        shrinkWrap: true,
                                        separatorBuilder: (context, index) =>
                                            SizedBox(
                                              height: 14,
                                            ),
                                        padding: EdgeInsets.only(
                                            top: 0,
                                            bottom: 0,
                                            right: 24,
                                            left: 12),
                                        itemCount:
                                        controller.countrylist.length,
                                        // itemCount: controller.listToShow.length,
                                        itemBuilder: (_, i) {
                                          // var noun = controller.listToShow[i];
                                          return ListTile(
                                            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                                            //  contentPadding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                                            dense: false,
                                            title: Text(
                                              controller.countrylist[i].name,
                                              style: TextStyle(
                                                fontFamily:
                                                sf_pro_display_medium,
                                                fontSize: 16,
                                              ),
                                            ),
                                            onTap: () => {
                                              controller.countryId.value =
                                                  controller.countrylist[i].id
                                                      .toString(),
                                              controller.strCountry.value =
                                                  controller.countrylist[i].name
                                                      .toString(),
                                              controller.cityId.value = '',
                                              controller.strCity.value = 'Select City',
                                              Navigator.pop(context),
                                              controller.callCityListApi(
                                                  controller.countryId.value),
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )));
                },
              );
            });
      },
    );
  }

  /*City Bottom Sheet*/
  void displayCityBottomSheet(BuildContext context) async {
    await controller.clearCityField();

    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
      ),
      builder: (BuildContext context) {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.white, // navigation bar color
          statusBarColor: blue_3551ff, // status bar color
          statusBarIconBrightness: Brightness.light, // status bar icons' color
          systemNavigationBarIconBrightness:
          Brightness.light, //navigation bar icons' color
        ));

        // List<BannerModel> onBannerModel = [
        //   BannerModel( "Gujarat"),
        //   BannerModel( "Rajasthan"),
        //   BannerModel( "Bihar"),
        //   BannerModel( "Kerala"),
        // ];

        return DraggableScrollableSheet(
            initialChildSize: 0.60,
            //set this as you want
            maxChildSize: 1,
            //set this as you want
            minChildSize: 0.1,
            //set this as you want
            expand: true,
            builder: (context, scrollController) {
              return StatefulBuilder(builder: (BuildContext context,
                  StateSetter setState /*You can rename this!*/) {
                return Padding(
                    padding: MediaQuery.of(context).viewInsets,
                    child: Container(
                        height: MediaQuery.of(context).size.height - 500.0,
                        decoration: new BoxDecoration(
                            color: Colors.white,
                            borderRadius: new BorderRadius.only(
                                topLeft: const Radius.circular(30.0),
                                topRight: const Radius.circular(30.0))),
                        child: Wrap(
                          children: <Widget>[
                            Column(
                              children: [
                                SizedBox(
                                  height: 25,
                                ),
                                // Rectangle 1329
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
                                            color: const Color(0xff96a6a3))),
                                  ),
                                ),

                                /*Search Layout Below Side*/
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 24, right: 24, top: 16, bottom: 12),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          width: 1, color: grey_e9ecec),
                                      color: Colors.white,
                                    ),
                                    child: Padding(
                                      padding:
                                      EdgeInsets.only(left: 15, right: 15,top:4.5,bottom: 4.5),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            search,
                                            width: 16.3,
                                            height: 16.3,
                                            color: black_273433,
                                          ),
                                          SizedBox(
                                            width: 7.7,
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Padding(
                                              padding: const EdgeInsets.all(5),
                                              child: new TextField(
                                                controller: controller
                                                    .searchCityText.value,
                                                onChanged: (value) async {
                                                  await controller
                                                      .filterCityList(value);

                                                  setState(() {});
                                                },
                                                style: const TextStyle(
                                                    color: black,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily:
                                                    sf_pro_display_medium,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 16.0),
                                                decoration: new InputDecoration(
                                                  isDense: true,
                                                  contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 0,
                                                      vertical: 10),
                                                  hintText: "Search City",
                                                  hintStyle: TextStyle(
                                                      color: grey_96a6a3,
                                                      fontWeight:
                                                      FontWeight.w500,
                                                      fontFamily:
                                                      sf_pro_display_medium,
                                                      fontStyle:
                                                      FontStyle.normal,
                                                      fontSize: 16.0),
                                                  border: InputBorder.none,
                                                ),
                                                keyboardType:
                                                TextInputType.text,
                                                cursorColor: black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 14,),

                                SingleChildScrollView(
                                  child: Container(
                                    height: MediaQuery.of(context).size.height -
                                        300.0,
                                    child: ListView.separated(
                                      scrollDirection: Axis.vertical,
                                      primary: false,
                                      shrinkWrap: true,
                                      separatorBuilder: (context, index) =>
                                          SizedBox(
                                            height: 36,
                                          ),
                                      padding: EdgeInsets.only(
                                          top: 16,
                                          bottom: 16,
                                          right: 24,
                                          left: 24),
                                      itemCount: controller.cityList.length,
                                      itemBuilder: (context, i) => InkWell(
                                        onTap: () {
                                          controller.cityId.value = controller
                                              .cityList[i].id
                                              .toString();
                                          controller.countryId.value =
                                              controller.cityList[i].countryId
                                                  .toString();
                                          controller.strCity.value = controller
                                              .cityList[i].name
                                              .toString();
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          controller.cityList[i].name,
                                          style: TextStyle(
                                            fontFamily: sf_pro_display_medium,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        )));
              });
            });
      },
    );
  }

  static const _kBasePadding = 17.0;
  static const kExpandedHeight = 150.0;

  final ValueNotifier<double> _titlePaddingNotifier =
  ValueNotifier(_kBasePadding);

  final _scrollController = ScrollController();

  double get _horizontalTitlePadding {
    const kCollapsedPadding = 50.0;

    if (_scrollController.hasClients) {
      return min(
          _kBasePadding + kCollapsedPadding,
          _kBasePadding +
              (kCollapsedPadding * _scrollController.offset) /
                  (kExpandedHeight - kToolbarHeight));
    }

    return _kBasePadding;
  }

  @override
  Widget build(BuildContext context) {

    _scrollController.addListener(() {
      _titlePaddingNotifier.value = _horizontalTitlePadding;
    });

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: blue_3551ff, // navigation bar color
      statusBarColor: blue_3551ff, // status bar color
      statusBarIconBrightness: Brightness.light, // status bar icons' color
      systemNavigationBarIconBrightness:
      Brightness.light, //navigation bar icons' color
    ));

    return SafeArea(
      child:
      Scaffold(
        backgroundColor: blue_3551ff,
        body: NestedScrollView(
          controller: _scrollController,
          physics: ScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: blue_3551ff,
                  toolbarHeight: 80,
                  title: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: SvgPicture.asset(
                      BackArrow,
                      width: 24,
                      height: 24,
                      color: Colors.white,
                    ),

                  ),
                  forceElevated: innerBoxIsScrolled,
                  expandedHeight: kExpandedHeight,
                  floating: false,
                  pinned: true,
                  stretch: false,
                  shadowColor: grey_e9ecec.withOpacity(0.3),
                  flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.pin,
                      centerTitle: false,
                      titlePadding:
                      EdgeInsets.symmetric(vertical: 26, horizontal: 0),
                      title: ValueListenableBuilder(
                        valueListenable: _titlePaddingNotifier,
                        builder: (context, value, child) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: double.parse(value.toString())),
                            child:
                            setMediumSFProText("Details", HeightData.eighteen, Colors.white,
                                FontWeight.w700, FontStyle.normal),
                          );
                        },
                      ),
                      background: Container(color:blue_3551ff))),
            ];
          },
          body: Obx(
                ()=> Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24,right: 24),
                    child: Form(
                      key: signupKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          setMediumSFProText(lorem, 14, Colors.white.withOpacity(0.7),
                              FontWeight.w500, FontStyle.normal),
                          SizedBox(
                            height: 34,
                          ),
                          GestureDetector(
                            onTap: () => {displayCountryBottomSheet(context)},
                            child: Container(
                              height: HeightData.sixty_two,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                  color: edt_blue_213deb),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                  right: 20,
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      globe,
                                      width: 15,
                                      height: 15,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                        child: setSemiBoldSFProText(
                                            controller.strCountry.value,
                                            16,
                                            Colors.white.withOpacity(0.7),
                                            FontWeight.w600,
                                            FontStyle.normal)),
                                    SvgPicture.asset(
                                      down_arrow,
                                      width: 15,
                                      height: 15,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          GestureDetector(
                            onTap: () => {displayCityBottomSheet(context)},
                            child: Container(
                              height: HeightData.sixty_two,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                  color: edt_blue_213deb),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                  right: 20,
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      light_location,
                                      width: 15,
                                      height: 15,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                        child: setSemiBoldSFProText(
                                            controller.strCity.value,
                                            16,
                                            Colors.white.withOpacity(0.7),
                                            FontWeight.w600,
                                            FontStyle.normal)),
                                    SvgPicture.asset(
                                      down_arrow,
                                      width: 15,
                                      height: 15,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Container(
                            height: HeightData.sixty_two,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                color: edt_blue_213deb),
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 6,
                                right: 6,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CountryCodePicker(
                                    onChanged: (e) => print(e.toLongString()),
                                    initialSelection: 'IND',
                                    showCountryOnly: true,
                                    padding: EdgeInsets.zero,
                                    showFlagMain: true,
                                    flagWidth: 25,
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: sf_pro_display_bold),
                                    showOnlyCountryWhenClosed: false,
                                    favorite: ['+91', 'IND'],
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Container(
                                      width: 1,
                                      height: 27,
                                      decoration:
                                      BoxDecoration(color: Color(0x4d000000))),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Theme(
                                          data: new ThemeData(
                                            primaryColor: Colors.green,
                                            primaryColorDark: Colors.red,
                                          ),
                                          child: TextFormField(
                                            autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                            controller: controller.phoneNumText.value,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: sf_pro_display_semibold,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 16.0),
                                            decoration: new InputDecoration(
                                              isDense: true,
                                              // contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                                              hintText: "Enter your mobile number",
                                              hintStyle: TextStyle(
                                                  color: grey_96a6a3,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: sf_pro_display_semibold,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 16.0),
                                              border: InputBorder.none,
                                            ),
                                            // textInputAction: textInputAction,
                                            // keyboardType: inputType,
                                            cursorColor: Colors.white,
                                            keyboardType: TextInputType.number,
                                            inputFormatters: [
                                              FilteringTextInputFormatter.digitsOnly,
                                              LengthLimitingTextInputFormatter(10),
                                            ],
                                            validator: (String argsa) {
                                              if (GetUtils.isPhoneNumber(argsa)) {
                                                return null;
                                              } else {
                                                return "Phone no is not valid";
                                              }
                                            },
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 32,
                          ),

                          SizedBox(
                            height: HeightData.sixty_two,
                            child: CommonElevatedButton(
                              "CONTINUE",
                              blue_3551ff,
                              Colors.white,
                                  () {
                                FocusScope.of(context).unfocus();
                                if (signupKey.currentState.validate()) {
                                  if (controller.countryId.isEmpty) {
                                    snackBar(context, "Please select country");
                                    return;
                                  }
                                  if (controller.cityId.isEmpty) {
                                    snackBar(context, "Please select city");
                                    return;
                                  }
                                  if(controller.phoneNumText.value.text.length <10){
                                    snackBar(context, "Please enter mobile number");
                                    return;
                                  }
                                  checkNet(context).then((value) {
                                    print("if");
                                    controller.callSignupSecondApi(context);
                                  });
                                } else {
                                  print("else");
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class CustomDelegate extends SearchDelegate<String> {
//   UpdatedSignupController controller = Get.put(UpdatedSignupController());
//
//   @override
//   List<Widget> buildActions(BuildContext context) => [SizedBox()];
//
//   // List<Widget> buildActions(BuildContext context) => [IconButton(icon: Icon(Icons.clear), onPressed: () => query = '')];
//
//   @override
//   Widget buildLeading(BuildContext context) =>
//       IconButton(icon: Icon(Icons.search), onPressed: () => {});
//
//   // Widget buildLeading(BuildContext context) => IconButton(icon: Icon(Icons.chevron_left), onPressed: () => close(context, ''));
//
//   @override
//   Widget buildResults(BuildContext context) => Container();
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     List<String> data = [];
//
//     for (int i = 0; i < controller.countrylist.length; i++) {
//       CountryDatum model = controller.countrylist[i];
//       data.add(model.name);
//     }
//
//     if (query.isNotEmpty)
//       controller.listToShow = data
//           .where((e) =>
//               e.toString().toLowerCase().contains(query.toLowerCase()) &&
//               e.toString().toLowerCase().startsWith(query.toLowerCase()))
//           .toList();
//     else
//       controller.listToShow = data;
//
//     return Container(
//       child: ListView.builder(
//         itemCount: controller.listToShow.length,
//         itemBuilder: (_, i) {
//           var noun = controller.listToShow[i];
//           return ListTile(
//             title: Text(noun),
//             onTap: () => close(context, noun),
//           );
//         },
//       ),
//     );
//   }
// }