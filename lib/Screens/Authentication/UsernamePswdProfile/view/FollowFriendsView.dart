import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:groceryboouser/Model/FollowFriendModel.dart';
import 'package:groceryboouser/Screens/AllSet.dart';
import 'package:groceryboouser/Styles/my_colors.dart';
import 'package:groceryboouser/Styles/my_icons.dart';
import 'package:groceryboouser/Styles/my_strings.dart';
import 'package:groceryboouser/Utilities/Constant.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:groceryboouser/Utils/common_widget.dart';

class FollowFriends extends StatefulWidget {
  @override
  _FollowFriendsState createState() => _FollowFriendsState();
}

class _FollowFriendsState extends State<FollowFriends> {
  // List<FollowFriendModel> onFollowFriendModel = [];
//  List<Contact> onFollowFriendModel = [];
  List<Contact> contacts=[];
  List<Contact>  _contacts=[];
  List<Contact> selectedList = [];
  ScrollController _scrollController = new ScrollController();
  bool isPerformingRequest = false;
  bool isLoading = false;
  int currentValue = 10;
  @override
  void initState() {
    //onFollowFriendModel.clear();
    Future.delayed(Duration.zero, () {
      //startLoader();
      allContacts();
      //moreData();
    });

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
         _getMoreData();
        //startLoader();

      }
    });
    // onFollowFriendModel.add(FollowFriendModel("John Doe", "john_doe25"));
    // onFollowFriendModel.add(FollowFriendModel("Erik", "erik_90"));
    // onFollowFriendModel.add(FollowFriendModel("John Doe", "john_doe25"));
    // onFollowFriendModel.add(FollowFriendModel("Erik", "erik_90"));
    // onFollowFriendModel.add(FollowFriendModel("John Doe", "john_doe25"));
    // onFollowFriendModel.add(FollowFriendModel("Erik", "erik_90"));
    // onFollowFriendModel.add(FollowFriendModel("John Doe", "john_doe25"));
    // onFollowFriendModel.add(FollowFriendModel("Erik", "erik_90"));
    super.initState();
  }
  _getMoreData(){
    print("object----------$currentValue");
    currentValue=currentValue+10;
    Future.delayed(Duration(seconds: 1), () {
     isLoading=true;
    });
   setState(() {

     contacts.addAll(contacts.take(currentValue));
   });
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading=false;
      });
    });
  }



  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
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
            child: Padding(
              padding: EdgeInsets.only(left: 24, right: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Connect with your friends
                  // .
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () => Get.to(AllSet()),
                        child: Text("NEXT",
                            style: TextStyle(
                                color: black,
                                fontWeight: FontWeight.w700,
                                fontFamily: sf_pro_display_bold,
                                fontStyle: FontStyle.normal,
                                height: 1.2,
                                fontSize: 14),
                            textAlign: TextAlign.right),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  // SizedBox(height: 20,),
                  Row(
                    children: <Widget>[
                      // SizedBox(
                      //   width: 20,
                      // ),
                      Container(
                        height: 6.0,
                        width: 250,
                        decoration: const BoxDecoration(
                            color: skygreen_24d39e,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(6),
                              bottomLeft: Radius.circular(6),
                            )),
                      ),
                      Expanded(
                        child: Container(
                          height: 7.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: grey_e9ecec,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(6),
                                  bottomRight: Radius.circular(6))),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(connect_with_friend,
                      style: TextStyle(
                          color: black,
                          fontWeight: FontWeight.w700,
                          fontFamily: sf_pro_display_bold,
                          fontStyle: FontStyle.normal,
                          height: 1.2,
                          fontSize: 24.0),
                      textAlign: TextAlign.left),

                  SizedBox(
                    height: 40,
                  ),

                  Container(
                    height: MediaQuery.of(context).size.height/1.5,
                    child: Stack(
                      children: [
                        ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.all(0),
                            physics: ScrollPhysics(),
                            controller: _scrollController,
                            itemCount: contacts.length,
                            itemBuilder: (context, i) {
                              return GestureDetector(
                                onTap: () {
                                  setState(
                                        () {
                                      if (selectedList.contains(contacts[i])) {
                                        selectedList.remove(contacts[i]);
                                      } else {
                                        selectedList.add(contacts[i]);
                                      }
                                    },
                                  );
                                  print(selectedList.length);
                                  print(contacts.length);
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 16),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0x17747796).withOpacity(0.1),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset:
                                          Offset(0, 7), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Row(
                                        children: [
                                          contacts[i].avatar !=null && contacts[i].avatar.length >0?

                                          Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: skygreen_24d39e),
                                            child: CircleAvatar(backgroundImage: MemoryImage(contacts[i].avatar)),
                                          ):
                                          Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: skygreen_24d39e),
                                            child: CircleAvatar(child: Text(contacts[i].initials())),
                                          ),
                                          // Expanded(
                                          //   child: Image.memory(
                                          //     onFollowFriendModel[i].avatar!,
                                          //     width: 40,
                                          //     height: 40,
                                          //   ),
                                          // ),
                                          SizedBox(
                                            width: 16,
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                // ternaklele
                                                Text(contacts[i].displayName,
                                                    style: TextStyle(
                                                        color: const Color(0xff273433),
                                                        fontWeight: FontWeight.w700,
                                                        fontFamily: sf_pro_display_bold,
                                                        fontStyle: FontStyle.normal,
                                                        fontSize: 12.0),
                                                    textAlign: TextAlign.left),

                                                // Ariana Venti
                                                Text(
                                                    contacts[i].phones[0].value,
                                                    style: TextStyle(
                                                        color: grey_aaaaaa,
                                                        fontWeight: FontWeight.w500,
                                                        fontFamily: sf_pro_display_medium,
                                                        fontStyle: FontStyle.normal,
                                                        fontSize: 12.0),
                                                    textAlign: TextAlign.left)
                                              ],
                                            ),
                                          ),
                                          // Rectangle 2453
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.all(Radius.circular(80)),
                                              // border: Border.all(
                                              //     color: selectedList.contains(onFollowFriendModel[i]) ? Colors.transparent:Color(0xff2f8be6),
                                              //     width: 1
                                              // ),
                                              color: selectedList
                                                  .contains(contacts[i])
                                                  ? skygreen_24d39e
                                                  : grey_e9ecec,
                                            ),
                                            child: // Follow
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 6.7,
                                                  bottom: 6.7,
                                                  left: 16,
                                                  right: 16),
                                              child: Text(
                                                  selectedList.contains(
                                                      contacts[i])
                                                      ? "Follow"
                                                      : "Following",
                                                  style: TextStyle(
                                                      color: selectedList.contains(
                                                          contacts[i])
                                                          ? Colors.white
                                                          : skygreen_24d39e,
                                                      fontWeight: FontWeight.w400,
                                                      fontFamily: sf_pro_display_bold,
                                                      fontStyle: FontStyle.normal,
                                                      fontSize: 12.0),
                                                  textAlign: TextAlign.center),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                        _loader()
                      ],
                    ),
                  ),
                  SizedBox(height: 10,)
                ],
              ),
            ),
          ),
        ));
  }
  Widget _loader() {
    return isLoading==true
        ? new Align(
      child: new Container(
        width: 70.0,
        height: 70.0,
        child: new Padding(
            padding: const EdgeInsets.all(5.0),
            child: new Center(child: new CircularProgressIndicator())),
      ),
      alignment: FractionalOffset.bottomCenter,
    )
        : new SizedBox(
      width: 0.0,
      height: 0.0,
    );
  }


   allContacts() async {
    //CircularProgressIndicator();
    onLoading(context, "Loading..");

  _contacts= (await ContactsService.getContacts(withThumbnails: false)).toList();

    setState(() {
        contacts=_contacts;
      contacts.addAll(_contacts.take(currentValue));
      Navigator.pop(context);
    });


// Get all contacts without thumbnail (faster)
    // List<Contact> contacts = await ContactsService.getContacts(withThumbnails: false);
  }
  // void startLoader() {
  //
  // setState(() {
  //   isLoading = !isLoading;
  //   fetchData();
  // });
  // }
  // fetchData() async {
  //
  //   var _duration = new Duration(seconds: 2);
  //   allContacts();
  //   return new Timer(_duration, onResponse);
  // }
  //
  // void onResponse() {
  //   setState(() {
  //     isLoading = !isLoading;
  //     print("dafafafafafaf   ");
  //     onFollowFriendModel.addAll(contacts.take(5));
  //   });
  // }
}
