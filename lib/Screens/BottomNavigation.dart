import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:groceryboouser/Screens/FeedScreen/view/Feed.dart';
import 'package:groceryboouser/Screens/Market.dart';
import 'package:groceryboouser/Screens/ProfileInfo/view/MyProfileView.dart';
import 'package:groceryboouser/Styles/my_colors.dart';
import 'package:groceryboouser/Styles/my_icons.dart';

import 'Homepage/view/HomepageView.dart';


class BottomNavigation extends StatefulWidget {

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {

  int _currentIndex = 0;
  final tabs =  [
    new Container(
      child: Homepage(),
    ),
    new Container(
      child: Homepage(),
    ),
    new Container(
      child: Market(),
    ),
    new Container(

      child: Feed(),
    ),
    new Container(
      child: MyProfile(),
    ),

  ];

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor:  Colors.white, // navigation bar color
      statusBarColor:  Colors.white, // status bar color
      statusBarIconBrightness: Brightness.dark, // status bar icons' color
      systemNavigationBarIconBrightness:
      Brightness.light, //navigation bar icons' color
    ));

    return Scaffold(

      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: skygreen_24d39e,
        unselectedItemColor: grey_96a6a3,
        currentIndex: _currentIndex,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        elevation: 5,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(grey_home_icon,width: 20,height: 20,),
              activeIcon: SvgPicture.asset(green_home_icon,width: 20,height: 20),
              label: "Home",
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(grey_discovery_icon,width: 20,height: 20,),
              activeIcon: SvgPicture.asset(green_discovery_icon,width: 20,height: 20),
              label: "Explore",

          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(grey_category_icon,width: 20,height: 20,),
              activeIcon: SvgPicture.asset(green_category_icon,width: 20,height: 20),
              label: "Market",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(grey_category_icon,width: 20,height: 20,),
            activeIcon: SvgPicture.asset(green_category_icon,width: 20,height: 20),
            label: "Feed",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(grey_profile_icon,width: 20,height: 20,),
            activeIcon: SvgPicture.asset(green_profile_icon,width: 20,height: 20),
            label: "Profile",

          ),
        ],
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),

    );
  }
}
