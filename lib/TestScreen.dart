import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class TestScreen extends StatefulWidget {
  const TestScreen({Key key}) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
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
      appBar: AppBar(
        title: const Text('KindaCode.com'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            // Linear Gradient Border
            Container(
              width: 220,
              height: 120,
              alignment: Alignment.center,
              decoration: BoxDecoration(

                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                    Colors.purple.shade900,
                    Colors.purple.shade100,
                  ])),
              child: Container(
                width: 200,
                height: 100,
                color: Colors.white,
                alignment: Alignment.center,
                child: const Text('Linear Gradient'),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            // Sweep Gradient Border
            Container(

              width: 60,
              height: 60,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                  gradient: SweepGradient(
                colors: [
                  Color(0xff2ad0ca),
                  Color(0xffe1f664),
                  Color(0xfffeb0fe),
                  Color(0xffabb3fc),
                  Color(0xff5df7a4),
                  Color(0xff58c4f6),
                ],
                tileMode: TileMode.mirror,
              )),
              child: SizedBox(
                  height: 54,
                  width: 54,
                  child: CircularProfileAvatar(
                    '',
                    child: Image.asset('assets/images/girl.png'),
                  ),
                ),
            ),
          ],
        ),
      ),
    ));
  }
}
