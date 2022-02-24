import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:groceryboouser/Layouts/Chip.dart';
import 'package:groceryboouser/Screens/Pinned/controller/PinnedController.dart';
import 'package:groceryboouser/Styles/my_colors.dart';
import 'package:groceryboouser/Styles/my_icons.dart';
import 'package:groceryboouser/Styles/my_strings.dart';
import 'package:groceryboouser/Utilities/Constant.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_tag_editor/tag_editor.dart';
import '../../../Layouts/ToolbarBackOnly.dart';


class SetPinnedBasket extends StatefulWidget {
  int order_id;

  SetPinnedBasket({this.order_id});

  @override
  _SetPinnedBasketState createState() => _SetPinnedBasketState();
}

class _SetPinnedBasketState extends State<SetPinnedBasket> {
  var titleController = TextEditingController();
  var descriptionTextController = TextEditingController();


  XFile image;
  final picker = ImagePicker();
  int values;
  PinnedController pinnedController = Get.put(PinnedController());
  String stringList="";
  List<String> _values = [];
  _onDelete(index) {
    setState(() {
      _values.removeAt(index);
    });
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      BackLayout(),
                      Expanded(
                        child: Center(
                          child: Text(
                            set_pinned_basket,
                            style: TextStyle(
                              fontSize: 18,
                              color: black_273433,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              fontFamily: sf_pro_display_bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: silver_f4f6f6,
                  thickness: 1.3,
                ),
                Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 24, right: 24, left: 24),
                    padding: image == null
                        ? EdgeInsets.symmetric(vertical: 32.5, horizontal: 16)
                        : EdgeInsets.all(0),
                    decoration: BoxDecoration(
                        border: Border.all(color: grey_e9ecec, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: light_silver_66f3f6f6),
                    child: InkWell(
                        onTap: () {
                          onClickImage();
                        },
                        child: image == null || image.path == null
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    picture_image,
                                    width: 24,
                                    height: 24,
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    browse_image,
                                    style: TextStyle(
                                        fontFamily: sf_pro_display_semibold,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FontStyle.normal,
                                        color: black_273433),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    this_image,
                                    style: TextStyle(
                                        fontFamily: sf_pro_display_regular,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        color: grey_96a6a3,
                                        height: 1.5),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 140,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8))),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8)),
                                          child: Image.file(
                                            File(image.path),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 35,
                                        width: 110,
                                        decoration: BoxDecoration(
                                            color: skygreen_24d39e,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              picture_image,
                                              width: 24,
                                              height: 24,
                                              color: white_ccffffff,
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              change,
                                              style: TextStyle(
                                                  fontFamily:
                                                      sf_pro_display_semibold,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle: FontStyle.normal,
                                                  color: white_ccffffff),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ))),
                Container(
                    margin: EdgeInsets.only(top: 24, left: 24),
                    child: Text(
                      title_txt,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontFamily: sf_pro_display_bold,
                          color: black),
                    )),
                Container(
                  margin: EdgeInsets.only(top: 4, right: 24, left: 24),
                  padding: EdgeInsets.symmetric(vertical: 10.5, horizontal: 16),
                  decoration: BoxDecoration(
                      border: Border.all(color: grey_e9ecec, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: Colors.white),
                  child: new TextField(
                    controller: titleController,
                    style: const TextStyle(
                        color: black,
                        fontWeight: FontWeight.w500,
                        fontFamily: sf_pro_display_medium,
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0),
                    decoration: new InputDecoration(
                      isDense: true,
                      hintText: Set_your_pinned_basket,
                      hintStyle: TextStyle(
                          color: grey_96a6a3,
                          fontWeight: FontWeight.w500,
                          fontFamily: sf_pro_display_medium,
                          fontStyle: FontStyle.normal,
                          fontSize: 14.0),
                      border: InputBorder.none,
                    ),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 16, left: 24),
                    child: Text(
                      description,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontFamily: sf_pro_display_bold,
                          color: black),
                    )),
                Container(
                  height: 120,
                  margin: EdgeInsets.only(top: 4, right: 24, left: 24),
                  padding: EdgeInsets.symmetric(vertical: 7, horizontal: 16),
                  decoration: BoxDecoration(
                      border: Border.all(color: grey_e9ecec, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: Colors.white),
                  child: Container(
                    child: new TextField(
                      controller: descriptionTextController,
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
                ),
                Container(
                    margin: EdgeInsets.only(top: 16, left: 24),
                    child: Text(
                      set_category,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontFamily: sf_pro_display_bold,
                          color: black),
                    )),
                Container(
                  margin: EdgeInsets.only(top: 4, right: 24, left: 24),
                  padding: EdgeInsets.symmetric(vertical: 10.5, horizontal: 16),
                  decoration: BoxDecoration(
                      border: Border.all(color: grey_e9ecec, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: grey_e9ecec),
                  child: Container(
                    child: TagEditor(
                      length: _values.length,
                      hasAddButton: false,
                      resetTextOnSubmitted: true,
                      delimiters: [',', ' '],
                      inputDecoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Add Category...',
                      ),
                      onTagChanged: (newValue) {
                        setState(() {
                          _values.add(newValue);
                          print(_values);
                        });
                      },
                      tagBuilder: (context, index) => ChipLayout(
                        index: index,
                        label: _values[index],
                        onDeleted: _onDelete,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x17747796).withOpacity(0.0),
                          spreadRadius: 0,
                          blurRadius: 0,
                          offset: Offset(0, 20), // changes position of shadow
                        ),
                      ]
                  ),
                  child: Container(
                    margin: EdgeInsets.only(left: 24,right: 24),
                    child: ElevatedButton(
                        child: //
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            // Add to basket
                            Text(CONTINUE,
                              style:  TextStyle(
                                  color:  Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: sf_pro_display_semibold,
                                  fontStyle:  FontStyle.normal,
                                  fontSize: 16.0
                              ),
                            ),


                          ],
                        ), // Button
                        onPressed: () {
                          setState(() {
                            stringList=_values.join(",");
                          });
                          pinnedController.addPinnedAPI(context, image.path.toString(),titleController.text,descriptionTextController.text,stringList,widget.order_id);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: skygreen_24d39e,
                          onPrimary: Colors.white,
                          elevation: 0,
                          padding:
                          EdgeInsets.symmetric(horizontal: 0, vertical: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(color: skygreen_24d39e, width: 0),
                          ),
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onClickImage() {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) => CupertinoActionSheet(
              title: const Text('Choose Options'),
              cancelButton: CupertinoActionSheetAction(
                child: const Text('Cancel'),
                isDefaultAction: true,
                onPressed: () {
                  Navigator.pop(context, 'Cancel');
                },
              ),
              actions: <Widget>[
                CupertinoActionSheetAction(
                  child: const Text('Camera'),
                  onPressed: () {
                    Navigator.pop(context, 'Camera');
                    getImage(ImageSource.camera);
                  },
                ),
                CupertinoActionSheetAction(
                  child: const Text('Gallery'),
                  onPressed: () {
                    Navigator.pop(context, 'Gallery');
                    getImage(ImageSource.gallery);
                  },
                )
              ],
            ));
  }

  Future getImage(ImageSource imageSource) async {
    XFile pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      image = XFile(pickedFile.path);
    });
    print(image);
  }
}
