import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:groceryboouser/Styles/my_colors.dart';
import 'package:groceryboouser/Styles/my_icons.dart';
import 'package:groceryboouser/Utilities/Constant.dart';
import 'Utils/SizeConfig.dart';

class OtherprofileView extends StatefulWidget {
  @override
  _OtherprofileViewState createState() => _OtherprofileViewState();
}

class _OtherprofileViewState extends State<OtherprofileView> {
  bool spam = false;
  bool reason1 = false;
  bool reason2 = false;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                      padding: EdgeInsets.all(20),
                      width: SizeConfig.screenWidth,
                      height: SizeConfig.screenHeight * 0.25,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://www.tripsavvy.com/thmb/xa76ixNK6kS3ZmR3wXP-qeHGuYg=/7315x4879/filters:fill(auto,1)/GettyImages-713841743-58f7d69d5f9b581d5982ee97.jpg"),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                  Colors.black45, BlendMode.darken))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "ReinaGregory",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800),
                              ),
                              IconButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                        context: context,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                topRight: Radius.circular(10))),
                                        builder: (context) {
                                          return StatefulBuilder(builder:
                                              (BuildContext context,
                                                  StateSetter setStateModal) {
                                            return Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                CheckboxListTile(
                                                  value: spam,
                                                  onChanged: (value) {
                                                    setStateModal(() {
                                                      spam = value;
                                                    });
                                                  },
                                                  title: Text(
                                                    'It’s Spam',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontFamily:
                                                            sf_pro_display_medium,
                                                        color: black_273433),
                                                  ),
                                                  checkColor: Colors.white,
                                                  activeColor: skygreen_24d39e,
                                                  controlAffinity:
                                                      ListTileControlAffinity
                                                          .leading,
                                                  dense: true,
                                                ),
                                                CheckboxListTile(
                                                  value: reason1,
                                                  onChanged: (value) {
                                                    setStateModal(() {
                                                      reason1 = value;
                                                    });
                                                  },
                                                  title: Text(
                                                    'Reason',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontFamily:
                                                            sf_pro_display_medium,
                                                        color: black_273433),
                                                  ),
                                                  checkColor: Colors.white,
                                                  activeColor: skygreen_24d39e,
                                                  controlAffinity:
                                                      ListTileControlAffinity
                                                          .leading,
                                                  dense: true,
                                                ),
                                                CheckboxListTile(
                                                  value: reason2,
                                                  onChanged: (value) {
                                                    setStateModal(() {
                                                      reason2 = value;
                                                    });
                                                  },
                                                  title: Text(
                                                    'Reason',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontFamily:
                                                            sf_pro_display_medium,
                                                        color: black_273433),
                                                  ),
                                                  checkColor: Colors.white,
                                                  activeColor: skygreen_24d39e,
                                                  controlAffinity:
                                                      ListTileControlAffinity
                                                          .leading,
                                                  dense: true,
                                                ),
                                                Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: SizeConfig
                                                              .blockSizeHorizontal *
                                                          2),
                                                  child: MaterialButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8)),
                                                    color: skygreen_24d39e,
                                                    child: Text(
                                                      'Submit',
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontFamily:
                                                              sf_pro_display_regular,
                                                          color: Colors.white),
                                                    ),
                                                    minWidth:
                                                        SizeConfig.screenWidth,
                                                    height: SizeConfig
                                                            .blockSizeVertical *
                                                        6,
                                                  ),
                                                ),
                                              ],
                                            );
                                          });
                                        });
                                  },
                                  icon: Icon(
                                    Icons.more_horiz,
                                    color: Colors.white,
                                  ))
                            ],
                          ),
                        ],
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: SizeConfig.screenHeight * 0.21,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: SizeConfig.blockSizeVertical * 12,
                              width: SizeConfig.blockSizeHorizontal * 42,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "https://www.tripsavvy.com/thmb/xa76ixNK6kS3ZmR3wXP-qeHGuYg=/7315x4879/filters:fill(auto,1)/GettyImages-713841743-58f7d69d5f9b581d5982ee97.jpg"),
                                  )),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: SizeConfig.blockSizeVertical * 3),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "120K",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 16),
                                  ),
                                  Text("Followers",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w800)),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: SizeConfig.blockSizeHorizontal * 12,
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: SizeConfig.blockSizeVertical * 3),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "80",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    "Following",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w800),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: 20, left: SizeConfig.blockSizeVertical * 3),
                        child: Text(
                          "Reina Gregory",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: 10, left: SizeConfig.blockSizeVertical * 3),
                        child: Text(
                          "San Francisco, 24 y/o ✌️, creative mind, Love cooking for any moment, looking for a new product advertise.",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: 5, left: SizeConfig.blockSizeVertical * 3),
                        child: Text(
                          "reinagrogery.us",
                          style: TextStyle(
                              fontSize: 14,
                              color: Color(0XFF24d39e),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.person_add_alt,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text("Follow")
                                        ],
                                      ),
                                    ),
                                    style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.white),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Color(0XFF24d39e)),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                side: BorderSide(
                                                    color:
                                                        Color(0XFF24d39e))))),
                                    onPressed: () => null),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: ElevatedButton(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.message_outlined,
                                            color: Colors.black,
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                            "Message",
                                            style:
                                                TextStyle(color: Colors.black),
                                          )
                                        ],
                                      ),
                                    ),
                                    style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.white),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Color(0XFFe9ecec)),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                side: BorderSide(
                                                    color:
                                                        Color(0XFFe9ecec))))),
                                    onPressed: () => null),
                              )
                            ],
                          )),
                    ],
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * 0.05,
                    vertical: SizeConfig.blockSizeVertical),
                child: StaggeredGrid.count(
                  crossAxisCount: 4,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  children: [
                    StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 2,
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.asset(
                              fruit,
                              fit: BoxFit.cover,
                            ),
                          )),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1,
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.asset(
                              watermelon,
                              fit: BoxFit.cover,
                            ),
                          )),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1,
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.asset(
                              orange_img,
                              fit: BoxFit.cover,
                            ),
                          )),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 1,
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.asset(
                              lemon,
                              fit: BoxFit.cover,
                            ),
                          )),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 4,
                      mainAxisCellCount: 2,
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.asset(
                              girl,
                              fit: BoxFit.cover,
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
    );
  }
}
