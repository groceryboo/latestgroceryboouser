import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:groceryboouser/Layouts/ElevatedGreenButton.dart';
import 'package:groceryboouser/Layouts/InputTextLayout.dart';
import 'package:groceryboouser/Layouts/ToolbarWithHeader.dart';
import 'package:groceryboouser/Screens/Checker.dart';
import 'package:groceryboouser/Screens/Location/controller/AddressController.dart';
import 'package:groceryboouser/Screens/Location/view/addcurrentlocation.dart';
import 'package:groceryboouser/Screens/Location/view/addphotoavatarview.dart';
import 'package:groceryboouser/Screens/ProfileInfo/view/SettingsView.dart';
import 'package:groceryboouser/Styles/my_colors.dart';
import 'package:groceryboouser/Styles/my_icons.dart';
import 'package:groceryboouser/Styles/my_strings.dart';
import 'package:groceryboouser/Utilities/Constant.dart';
import 'package:groceryboouser/Utils/common_widget.dart';
import 'package:groceryboouser/Utils/internet_connection.dart';
import 'package:groceryboouser/Utils/share_predata.dart';
import 'package:groceryboouser/Utils/text_utilities.dart';

class SaveAddress extends StatefulWidget {
  @override
  _SaveAddressState createState() => _SaveAddressState();
}

class _SaveAddressState extends State<SaveAddress> {
  AddressController controller = Get.put(AddressController());
  final formKey = GlobalKey<FormState>();
  FocusNode saveName;

  // final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    saveName = FocusNode();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    saveName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, // navigation bar color
      statusBarColor: Colors.white, // status bar color
      statusBarIconBrightness: Brightness.dark, // status bar icons' color
      systemNavigationBarIconBrightness:
          Brightness.light, //navigation bar icons' color
    ));

    /*check*/

    return SafeArea(
      child: Scaffold(
        //resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Obx(
            () => ToolbarWithHeader(
                controller.title, controller.boolDisplayEditLayout.value),
          ),
        ),
        body: Form(
            key: formKey,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
                    child: Obx(
                      () => Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: 17, left: 24, right: 28.3, bottom: 17),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(your_current_loc,
                                          style: TextStyle(
                                              color: grey_96a6a3,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: sf_pro_display_medium,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 12.0),
                                          textAlign: TextAlign.left),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Row(
                                        children: [
                                          SvgPicture.asset(location_pin,
                                              width: 24, height: 24),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Container(
                                            width: 200,
                                            child: Text(
                                                SharePreData
                                                    .strCurrentLocationAddress,
                                                style: TextStyle(
                                                    color: black_273433,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily:
                                                        sf_pro_display_medium,
                                                    fontStyle: FontStyle.normal,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    fontSize: 16),
                                                textAlign: TextAlign.left),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () => Get.to(() => AddCurrentLocation()),
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: black,
                                    size: 16,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Divider(
                            color: gray_f4f6f6,
                            thickness: 1,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 24, top: 16, bottom: 34, right: 24),
                            child: Column(
                              children: [
                                controller.boolDisplayEditLayout.value == true
                                    ? Row(
                                        children: [
                                          Container(
                                            width: 40,
                                            height: 40,
                                            alignment: Alignment.center,
                                            child: Column(
                                              children: [
                                                SizedBox(height: 8),
                                                controller.strProfile.value !=
                                                        "null"
                                                    ? SizedBox(
                                                        width: 24,
                                                        height: 24,
                                                        child: Image.network(
                                                          controller
                                                              .strProfile.value,
                                                          fit: BoxFit.fill,
                                                          alignment:
                                                              Alignment.center,
                                                        ),
                                                      )
                                                    : imagePath.toString() !=
                                                            "File: ''"
                                                        ? SizedBox(
                                                            width: 28,
                                                            height: 30,
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          100.0),
                                                              child: Image.file(
                                                                imagePath,
                                                                fit: BoxFit.fill,
                                                              ),
                                                            ))
                                                        : SvgPicture.asset(
                                                            pick_img,
                                                            width: 28,
                                                            height: 30,
                                                            alignment:
                                                                Alignment.center,
                                                          ),
                                              ],
                                            ),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: grey_e9ecec),
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: InkWell(
                                              onTap: ()=> Get.to(AddPhotoAvatar()),
                                              child: Text("Change Photo",
                                                  style: TextStyle(
                                                      color: skygreen_24d39e,
                                                      fontWeight: FontWeight.w500,
                                                      fontFamily:
                                                          sf_pro_display_bold,
                                                      fontStyle: FontStyle.normal,
                                                      fontSize: 12),
                                                  textAlign: TextAlign.left),
                                            ),
                                          ),
                                          InkWell(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: black_273433,
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(8)),
                                                  shape: BoxShape.rectangle,
                                                  // BoxShape.circle or BoxShape.retangle
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey,
                                                      blurRadius: 1.0,
                                                    ),
                                                  ]),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      iconly_bulk_paper,
                                                      width: 12,
                                                      height: 12,
                                                      alignment: Alignment.center,
                                                    ),
                                                    SizedBox(
                                                      width: 8,
                                                    ),
                                                    Text("Past orders",
                                                        style: TextStyle(
                                                            color: white_ccffffff,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontFamily:
                                                                sf_pro_display_medium,
                                                            fontStyle:
                                                                FontStyle.normal,
                                                            fontSize: 14),
                                                        textAlign:
                                                            TextAlign.left),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            onTap: () {
                                              Get.to(AddPhotoAvatar());
                                            },
                                          ),
                                        ],
                                      )
                                    : InkWell(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Center(
                                              child: Container(
                                                width: 40,
                                                height: 40,
                                                child: Center(
                                                  child: imagePath.toString() !=
                                                          "File: ''"
                                                      ? ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100.0),
                                                          child: Image.file(
                                                            imagePath,
                                                            fit: BoxFit.fill,
                                                            width: 28,
                                                            height: 30,
                                                          ),
                                                        )
                                                      : Column(
                                                          children: [
                                                            SizedBox(
                                                              height: 8,
                                                            ),
                                                            SvgPicture.asset(
                                                              pick_img,
                                                              width: 28,
                                                              height: 30,
                                                              alignment: Alignment
                                                                  .center,
                                                            ),
                                                          ],
                                                        ),
                                                ),
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: grey_e9ecec),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Text("Add photo or avatar",
                                                style: TextStyle(
                                                    color: black_273433,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily:
                                                        sf_pro_display_semibold,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 12),
                                                textAlign: TextAlign.left),
                                          ],
                                        ),
                                        onTap: () {
                                          Get.to(AddPhotoAvatar());
                                        },
                                      ),
                                SizedBox(
                                  height: 26,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: InputTextLayout(
                                      first_name,
                                      controller.firstNameText.value,
                                      false,

                                    )),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Expanded(
                                        child: InputTextLayout(
                                            last_name,
                                            controller.lastNameText.value,
                                            false)),
                                  ],
                                ),

                                /*test*/
                                SizedBox(
                                  height: 8,
                                ),
                                InputTextLayout(Saved_name_as,
                                    controller.savedNameAsText.value, false),
                                SizedBox(
                                  height: 8,
                                ),
                                InputTextLayout(land_mark,
                                    controller.landmarkText.value, false),
                                SizedBox(
                                  height: 8,
                                ),
                                InputTextLayout(street_name,
                                    controller.streetNameText.value, false),
                                SizedBox(
                                  height: 8,
                                ),
                                InputTextLayout(street_name_2,
                                    controller.streetName2Text.value, false),
                                SizedBox(
                                  height: 8,
                                ),
                                InputTextLayout(phone_number,
                                    controller.phoneNumText.value, true),
                                SizedBox(
                                  height: 8,
                                ),
                                InputTextLayout(delivery_instruction,
                                    controller.deliveryInstText.value, false),

                                // setFormTextField(
                                //   controller.deliveryInstText.value,
                                //   "Enter your name",
                                //   false,
                                //   TextInputType.text,
                                //   TextInputAction.done,
                                //       (value) => {
                                //     setState(() {
                                //     }),
                                //     print("  "),
                                //   },
                                //   validator: (value) {
                                //     if (value != "")
                                //       return null;
                                //     else
                                //       return 'Please Enter First Name';
                                //   },
                                // ),

                                SizedBox(
                                  height: 40,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(
                                left: 24, top: 16, bottom: 34, right: 24),
                            child: CommonElevatedButton(saved_address, Colors.white, skygreen_24d39e,
                                    () {
                                  FocusScope.of(context).unfocus();
                                  checkNet(context).then((value) {
                                    if(controller.firstNameText.value.text.isEmpty){
                                      snackBarRapid(context, "Add First Name");
                                      return;
                                    }if(controller.lastNameText.value.text.isEmpty){
                                      snackBarRapid(context, "Add Last Name");
                                      return;
                                    }if(controller.savedNameAsText.value.text.isEmpty){
                                      snackBarRapid(context, "Add saved name");
                                      return;
                                    }if(controller.landmarkText.value.text.isEmpty){
                                      snackBarRapid(context, "Add Landmark");
                                      return;
                                    }if(controller.streetNameText.value.text.isEmpty){
                                      snackBarRapid(context, "Add Streetname");
                                      return;
                                    }if(controller.streetName2Text.value.text.isEmpty){
                                      snackBarRapid(context, "Add Streetname 2");
                                      return;
                                    }
                                    if(validateMobile(controller.phoneNumText.value.text) != null){
                                      snackBarRapid(context,validateMobile(controller.phoneNumText.value.text));
                                      return;
                                    }
                                    if(controller.deliveryInstText.value.text.isEmpty){
                                      snackBarRapid(context, "Add Delivery instruction");
                                      return;
                                    }
                                    if (controller.boolDisplayEditLayout.value == false) {
                                      controller.createAddressAPI(context);
                                    } else {
                                      controller.editAddressAPI(context);
                                    }

                                    // if (formKey.currentState.validate()) {
                                    //   print("else");
                                    //   controller.createAddressAPI(context);
                                    //
                                    // } else {
                                    //   print("else");
                                    // }

                                  });
                                }),
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
    );
  }
}
