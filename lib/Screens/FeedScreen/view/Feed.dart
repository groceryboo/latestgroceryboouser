import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:groceryboouser/Layouts/ElevatedGreenButton.dart';
import 'package:groceryboouser/Layouts/ElevatedGreenRoundedButton.dart';
import 'package:groceryboouser/Model/StatusListModel.dart';
import 'package:groceryboouser/Screens/FeedScreen/controller/CollectionController.dart';
import 'package:groceryboouser/Styles/my_colors.dart';
import 'package:groceryboouser/Styles/my_icons.dart';
import 'package:groceryboouser/Styles/my_strings.dart';
import 'package:groceryboouser/Utilities/TextUtilities.dart';
import 'package:groceryboouser/Utils/text_utilities.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../Styles/my_height.dart';
import '../../../Utilities/Constant.dart';
import '../../../Utils/SizeConfig.dart';
import '../../../Utils/common_widget.dart';
import '../../../Utils/internet_connection.dart';
import '../../Networks/api_endpoint.dart';
import '../model/PersonModel.dart';

class Feed extends StatefulWidget {
  const Feed({Key key}) : super(key: key);

  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  FeedController controller = Get.put(FeedController());
  TextEditingController _editingController = TextEditingController();

  File imageFile;

  var filePath;

  int _selectedPersonIndex = 0;
  List<StatusListModel> statusList = [
    StatusListModel(cookImage, "Anne"),
    StatusListModel(cookImage, "Jennifer"),
    StatusListModel(cookImage, "Anne"),
    StatusListModel(cookImage, "Jennifer"),
    StatusListModel(cookImage, "Anne"),
    StatusListModel(cookImage, "Anne"),
    StatusListModel(cookImage, "Jennifer"),
    StatusListModel(cookImage, "Jennifer"),
  ];

  List<PersonModel> personList = [
    PersonModel("Add to your story", 'assets/images/person_one.png'),
    PersonModel("Jennifer Law", 'assets/images/person_two.png'),
    PersonModel("Gregori Rian", 'assets/images/person_three.png'),
    PersonModel("Emily Paris", 'assets/images/person_four.png'),
    PersonModel("Jennifer Law", 'assets/images/person_two.png'),
  ];

  List<PersonModel> shareAppList = [
    PersonModel("Message", 'assets/images/sms_app_logo.png'),
    PersonModel("Email", 'assets/images/mail_app_logo.png'),
    PersonModel("Instagram", 'assets/images/insta_app_logo.png'),
    PersonModel("Whats App", 'assets/images/whats_app_logo.png'),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
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
                      Text(
                        "Feed",
                        style: TextStyle(
                            fontSize: 26,
                            color: Color(0xFF273433),
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        message_icon,
                        width: 18,
                        height: 18,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      SvgPicture.asset(
                        notification_icon,
                        width: 18,
                        height: 18,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      SvgPicture.asset(
                        vector,
                        width: 18,
                        height: 18,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 26,
              ),
              Container(
                height: 100,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: statusList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Column(
                            children: [
                              Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Container(
                                      height: 60,
                                      width: 45,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(8)),
                                        gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            Color(0xFF2AD0CA),
                                            Color(0xFFE1F664),
                                            Color(0xFFFEB0FE),
                                            Color(0xFFABB3FC),
                                            Color(0xFF5DF7A4),
                                            Color(0xFF58C4F6),
                                          ],
                                          tileMode: TileMode.mirror,
                                        ),
                                      ),
                                      child: Container(
                                        width: 40,
                                        height: 55,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8)),
                                          color: Colors.white,
                                        ),
                                        alignment: Alignment.center,
                                        child: Image.asset(
                                          statusList[index].image,
                                          fit: BoxFit.fill,
                                        ),
                                      )),
                                  Container(
                                      height: 30,
                                      width: 30,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              Color(0xFF2AD0CA),
                                              Color(0xFFE1F664),
                                              Color(0xFFFEB0FE),
                                              Color(0xFFABB3FC),
                                              Color(0xFF5DF7A4),
                                              Color(0xFF58C4F6),
                                            ],
                                            tileMode: TileMode.mirror,
                                          ),
                                          shape: BoxShape.circle),
                                      child: Container(
                                        width: 25,
                                        height: 25,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                        ),
                                        alignment: Alignment.center,
                                        // child: CircleAvatar(
                                        //   child: Image.asset(
                                        //     statusList[index].image,
                                        //     fit: BoxFit.fill,
                                        //   ),
                                        // ),
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                statusList[index].name,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF121212)),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          )
                        ],
                      );
                    }),
              ),
              SizedBox(
                height: 14,
              ),
              Divider(
                height: 1,
                color: grey_E9ECEC,
              ),
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  height: 380,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(67, 67, 178, 0.08),
                            blurRadius: 4.0,
                            spreadRadius: 2.0),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 17, right: 17, top: 17),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                height: 30,
                                width: 30,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xFF2AD0CA),
                                        Color(0xFFE1F664),
                                        Color(0xFFFEB0FE),
                                        Color(0xFFABB3FC),
                                        Color(0xFF5DF7A4),
                                        Color(0xFF58C4F6),
                                      ],
                                      tileMode: TileMode.mirror,
                                    ),
                                    shape: BoxShape.circle),
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  alignment: Alignment.center,
                                  // child: CircleAvatar(
                                  //   child: Image.asset(
                                  //     statusList[index].image,
                                  //     fit: BoxFit.fill,
                                  //   ),
                                  // ),
                                )),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Pinned by Kelly",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff273433)),
                                ),
                                Text(
                                  "Repinned from @Toribroadsha",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff96A6A3)),
                                ),
                              ],
                            ),
                            SvgPicture.asset(
                              more,
                              width: 28,
                              height: 28,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Text(
                          "Tori’s cooking diaries to make your day! 🙌🏻",
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Stack(
                          children: [
                            Container(
                              height: 194,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40))),
                              child: Image.asset(
                                item_purchase,
                                fit: BoxFit.fill,
                                width: 28,
                                height: 28,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, bottom: 10, top: 150),
                              child: Container(
                                height: 28,
                                width: 95,
                                alignment: Alignment.bottomLeft,
                                decoration: BoxDecoration(
                                    color: black,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40))),
                                child: Center(
                                    child: Text(
                                  "Purchase Now",
                                  style: TextStyle(
                                      color: white_ccffffff, fontSize: 11),
                                )),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 200, top: 10, right: 10),
                              child: Container(
                                height: 28,
                                width: 95,
                                alignment: Alignment.topRight,
                                child: SvgPicture.asset(
                                  addItem,
                                  width: 28,
                                  height: 28,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Row(
                          children: [
                            Row(
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      Stack(
                                        children: [
                                          SvgPicture.asset(
                                            addItem,
                                            width: 28,
                                            height: 28,
                                          ),
                                          Positioned(
                                            right: -10,
                                            child: SvgPicture.asset(
                                              addItem,
                                              width: 28,
                                              height: 28,
                                            ),
                                          ),
                                          Positioned(
                                            right: -20,
                                            child: SvgPicture.asset(
                                              addItem,
                                              width: 28,
                                              height: 28,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Text(
                                  "Anne & 3,500+ pinned this",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xffAAAAAA)),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    checkNet(context).then((value) async {
                                      // calling the api
                                      await controller
                                          .callCollectionListApi(context);

                                      //opening bottom sheet after api
                                      _collectionsBottomSheet(context);
                                    });
                                  },
                                  child: SvgPicture.asset(
                                    save_collection,
                                    // height: 10.33,
                                    // width: 12.81,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _shareBottomSheet(context);
                                  },
                                  child: SvgPicture.asset(
                                    send_icon,
                                    // height: 10.33,
                                    // width: 12.81,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Text(
                          "Here is my favorite menu in my diaries."
                          " I love cooking good ole fashion texan food and I know you’ll ...",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffAAAAAA)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  height: 380,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(67, 67, 178, 0.08),
                            blurRadius: 4.0,
                            spreadRadius: 2.0),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 17, right: 17, top: 17),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                height: 30,
                                width: 30,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xFF2AD0CA),
                                        Color(0xFFE1F664),
                                        Color(0xFFFEB0FE),
                                        Color(0xFFABB3FC),
                                        Color(0xFF5DF7A4),
                                        Color(0xFF58C4F6),
                                      ],
                                      tileMode: TileMode.mirror,
                                    ),
                                    shape: BoxShape.circle),
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  alignment: Alignment.center,
                                  // child: CircleAvatar(
                                  //   child: Image.asset(
                                  //     statusList[index].image,
                                  //     fit: BoxFit.fill,
                                  //   ),
                                  // ),
                                )),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Pinned by Kelly",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff273433)),
                                ),
                                Text(
                                  "Repinned from @Toribroadsha",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff96A6A3)),
                                ),
                              ],
                            ),
                            SvgPicture.asset(
                              more,
                              width: 28,
                              height: 28,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Text(
                          "Tori’s cooking diaries to make your day! 🙌🏻",
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Stack(
                          children: [
                            Container(
                              height: 194,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40))),
                              child: Image.asset(
                                item_purchase,
                                fit: BoxFit.fill,
                                width: 28,
                                height: 28,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, bottom: 10, top: 150),
                              child: Container(
                                height: 28,
                                width: 95,
                                alignment: Alignment.bottomLeft,
                                decoration: BoxDecoration(
                                    color: black,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40))),
                                child: Center(
                                    child: Text(
                                  "Purchase Now",
                                  style: TextStyle(
                                      color: white_ccffffff, fontSize: 11),
                                )),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 200, top: 10, right: 10),
                              child: Container(
                                height: 28,
                                width: 95,
                                alignment: Alignment.topRight,
                                child: SvgPicture.asset(
                                  addItem,
                                  width: 28,
                                  height: 28,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Row(
                          children: [
                            Row(
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      Stack(
                                        children: [
                                          SvgPicture.asset(
                                            addItem,
                                            width: 28,
                                            height: 28,
                                          ),
                                          Positioned(
                                            right: -10,
                                            child: SvgPicture.asset(
                                              addItem,
                                              width: 28,
                                              height: 28,
                                            ),
                                          ),
                                          Positioned(
                                            right: -20,
                                            child: SvgPicture.asset(
                                              addItem,
                                              width: 28,
                                              height: 28,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Text(
                                  "Anne & 3,500+ pinned this",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xffAAAAAA)),
                                ),
                              ],
                            ),
                            Row(
                              children: [],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Text(
                          "Here is my favorite menu in my diaries."
                          " I love cooking good ole fashion texan food and I know you’ll ...",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffAAAAAA)),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

  _saveToCollectionBottomSheet(context) {
    showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (BuildContext context,
              StateSetter setState /*You can rename this!*/) {
            return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Container(
                child: Wrap(
                  children: <Widget>[
                    Container(
                      height: SizeConfig.screenHeight / 2,
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.screenWidth * 0.05,
                          vertical: SizeConfig.screenHeight * 0.025),
                      child: Stack(
                        children: [
                          Positioned(
                              right: 0,
                              top: 15,
                              child: CommonElevatedRoundedButton(
                                save,
                                Colors.white,
                                skygreen_24d39e,
                                50.0,
                                () async {
                                  print("Save clicked");

                                  if (imageFile == null) {
                                    // showFlutterToast(select_image_first);
                                    await snackBar(context, select_image_first);

                                  } else if (_editingController.text.isEmpty) {
                                    // showFlutterToast(enter_collection_name);
                                    await snackBar(context, select_image_first);

                                  } else {
                                    // hit create Collection API
                                    await controller.callCreateCollectionApi(
                                        _editingController.text,
                                        filePath,
                                        context);

                                    Navigator.pop(context);
                                    // if (controller.createCollectionModel!.data !=
                                    //     null) {
                                    //   showFlutterToast(
                                    //       controller.createCollectionModel!.message);
                                    // } else {
                                    //   showFlutterToast(
                                    //       controller.createCollectionModel!.message);
                                    // }
                                  }
                                },
                              )),
                          Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    width: 50,
                                    height: 3,
                                    color: grey_96a6a3,
                                  )),
                              SizedBox(
                                height: 25,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: setBoldSFProText(
                                    new_collection,
                                    18.0,
                                    Colors.black,
                                    FontWeight.w700,
                                    FontStyle.normal),
                              ),
                              Spacer(),
                              Center(
                                  child: GestureDetector(
                                onTap: () async {
                                  if (await Permission.storage
                                      .request()
                                      .isGranted) {
                                    final ImagePicker _picker = ImagePicker();

                                    var picture = await _picker.pickImage(
                                        source: ImageSource.gallery);
                                    // Navigator.of(context).pop();
                                    setState(() {
                                      if (picture != null) {
                                        imageFile = File(picture.path);
                                        filePath = picture.path;
                                      }
                                    });
                                  } else {
                                    print("Permission not granted");
                                  }
                                },
                                child: imageFile != null
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.file(
                                          imageFile,
                                          width: 110,
                                          height: 110,
                                          fit: BoxFit.fill,
                                        ))
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.asset(
                                          item_purchase,
                                          height: 110,
                                          width: 110,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                              )),
                              Spacer(),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: grey_A0B0AD),
                                  borderRadius: BorderRadius.circular(10),
                                  color: grey_E9ECEC,
                                ),
                                // padding: EdgeInsets.only(
                                //     bottom: MediaQuery.of(context).viewInsets.bottom),
                                child: TextField(
                                  controller: _editingController,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(10),
                                    hintStyle: TextStyle(
                                        fontSize: 14, color: grey_A0B0AD),
                                    hintText: write_the_collection_name_here,
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }

  _collectionsBottomSheet(context) {
    SizeConfig().init(context);
    showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        builder: (BuildContext context) {
          return Container(
            height: SizeConfig.screenHeight / 2.5,
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.screenWidth * 0.05,
                vertical: SizeConfig.screenHeight * 0.025),
            child: Stack(
              children: [
                Positioned(
                    right: 0,
                    top: 15,
                    child: CommonElevatedRoundedButton(
                      plus_add,
                      Colors.white,
                      skygreen_24d39e,
                      50.0,
                      () {
                        print("plus_add clicked");
                        Navigator.pop(context);
                        _saveToCollectionBottomSheet(context);
                      },
                    )),
                Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 50,
                          height: 3,
                          color: grey_96a6a3,
                        )),
                    SizedBox(
                      height: 25,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: setBoldSFProText(save_to, 18.0, Colors.black,
                          FontWeight.w700, FontStyle.normal),
                    ),
                    Spacer(),
                    controller.collectionList.isEmpty
                        ? Center(
                            child: Text("No Collection"),
                          )
                        : Container(
                            height: 100,
                            child: ListView.builder(
                                padding: EdgeInsets.all(5),
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.collectionList.length,
                                itemBuilder: (context, index) =>
                                    radiusImageLoad(
                                        controller
                                            .collectionList[index].image,
                                        90.0,
                                        85.0,
                                        5.0)
                                //  Container(
                                //   margin: EdgeInsets.only(left: 5, right: 5),
                                //   height: 380,
                                //   decoration: BoxDecoration(
                                //       color: Colors.white,
                                //       boxShadow: [
                                //         BoxShadow(
                                //             color: Colors.grey.withOpacity(0.2),
                                //             blurRadius: 10.0,
                                //             spreadRadius: 0.5),
                                //       ],
                                //       borderRadius:
                                //           BorderRadius.all(Radius.circular(8))),
                                //   padding: const EdgeInsets.all(5.0),
                                //   child: ClipRRect(
                                //     borderRadius: BorderRadius.circular(5),
                                //     child: Image.network(
                                //       controller.collectionList![index].image!,
                                //       height: 90,
                                //       width: 90,
                                //       fit: BoxFit.fill,
                                //     ),
                                //   ),
                                // ),
                                ),
                          ),
                    Spacer(),
                  ],
                ),
              ],
            ),
          );
        });
  }

  _shareBottomSheet(context) {
    SizeConfig().init(context);
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
        // backgroundColor: Colors.black,
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Container(
              child: Wrap(
                children: <Widget>[
                  Container(
                    // height: SizeConfig.screenHeight! / 1.5,
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth * 0.05,
                        vertical: SizeConfig.screenHeight * 0.025),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: 50,
                              height: 3,
                              color: grey_96a6a3,
                            )),
                        SizedBox(
                          height: 25,
                        ),

                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: grey_E9ECEC,
                          ),
                          // padding: EdgeInsets.only(
                          //     bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              SvgPicture.asset(
                                search_icon,
                                height: 12,
                                width: 12,
                              ),
                              Container(
                                width: double.infinity,
                                child: TextField(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(10),
                                    isDense: true,
                                    hintStyle: TextStyle(
                                      fontSize: 14,
                                      color: grey_A0B0AD,
                                    ),
                                    hintText: search_by_name_or_username,
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        setBoldSFProText(
                          send_to_other_boos,
                          14.0,
                          Colors.black,
                          FontWeight.w700,
                          FontStyle.normal,
                        ),
                        SizedBox(
                          height: 5,
                        ),

                        Container(
                            height: 120,
                            child:
                                // Expanded(
                                //     child:
                                ListView.builder(
                              padding: EdgeInsets.all(5),
                              scrollDirection: Axis.horizontal,
                              itemCount: personList.length,
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          child: Image.asset(
                                            personList[index].profilePic,
                                            height: 70,
                                            width: 70,
                                            fit: BoxFit.fill,
                                          ),
                                        ),

                                        // if(_selectedPersonIndex == index)
                                        // Positioned(
                                        //     bottom: 5,
                                        //     right: 5,
                                        //     child: SvgPicture.asset(add_icon,
                                        //         height: 20, width: 20)),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    setMediumSFProText(
                                      personList[index].name,
                                      11.0,
                                      Colors.black,
                                      FontWeight.w500,
                                      FontStyle.normal,
                                    )
                                  ],
                                ),
                              ),
                            )),
                        // ),
                        Container(
                            // margin: EdgeInsets.only(top: 30),
                            height: 120,
                            // child: Expanded(
                            child: ListView.builder(
                                padding: EdgeInsets.all(5),
                                scrollDirection: Axis.horizontal,
                                itemCount: shareAppList.length,
                                itemBuilder: _buildShareListItems)),
                        // ),
                        // Spacer(),
                        CommonElevatedButton(
                            send_string, Colors.white, skygreen_24d39e, () {
                          Navigator.pop(context);
                        }),
                        //                 SizedBox(
                        //   height: 10,
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget _buildShareListItems(context, index) {
    return GestureDetector(
      onTap: () {
        _onShareClick(index, context);
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                shareAppList[index].profilePic,
                height: 70,
                width: 70,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            setMediumSFProText(
              shareAppList[index].name,
              11.0,
              Colors.black,
              FontWeight.w500,
              FontStyle.normal,
            )
          ],
        ),
      ),
    );
  }

  _onShareClick(index, context) {
    switch (index) {
      case 0:
        {
          if (Platform.isAndroid) {
            launchURL('sms:+39 348 060 888?body=hello%20there');
          } else if (Platform.isIOS) {
            launchURL('sms:0039-348-060-888?body=hello%20there');
          }
        }
        break;
      case 1:
        {
          launchURL('mailto:xyz@gmail.com');
        }
        break;
      case 2:
        {
          var whatsapp = "+919999999999";
          var whatsappURl_android =
              "whatsapp://send?phone=" + whatsapp + "&text=hello";
          var whatappURL_ios =
              "https://wa.me/$whatsapp?text=${Uri.parse("hello")}";

          if (Platform.isAndroid) {
            launchURL(whatsappURl_android);
          } else if (Platform.isIOS) {
            launchURL(whatappURL_ios);
          }
        }
    }
  }
}
