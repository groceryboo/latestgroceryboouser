import 'package:flutter/material.dart';

class MyPages extends StatefulWidget {
  @override
  _MyPagesState createState() => _MyPagesState();
}

class _MyPagesState extends State<MyPages> with SingleTickerProviderStateMixin {
  Animation<double> _progressAnimation;
  AnimationController _progressAnimcontroller;

  @override
  void initState() {
    super.initState();

    _progressAnimcontroller = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );

    _progressAnimation = Tween<double>(begin: beginWidth, end: endWidth)
        .animate(_progressAnimcontroller);

    _setProgressAnim(0, 1);
  }

  double growStepWidth, beginWidth, endWidth = 50.0;
  int totalPages = 4;

  _setProgressAnim(double maxWidth, int curPageIndex) {
    setState(() {
      growStepWidth = maxWidth / totalPages;
      beginWidth = (growStepWidth * (curPageIndex - 1));
      endWidth = (growStepWidth * curPageIndex);

      _progressAnimation = Tween<double>(begin: beginWidth, end: endWidth)
          .animate(_progressAnimcontroller);
    });

  }

  @override
  Widget build(BuildContext context) {
    var mediaQD = MediaQuery.of(context);
    var maxWidth = mediaQD.size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          color: Colors.transparent,
          child: Row(
            children: <Widget>[
              AnimatedProgressBar(
                animation: _progressAnimation,
              ),
              Expanded(
                child: Container(
                  height: 6.0,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.cyanAccent),
                ),
              )
            ],
          ),
        ),
      ),
      body: PageView(
        onPageChanged: (i) {
          //index i starts from 0!
          _progressAnimcontroller.forward();
          _progressAnimcontroller.reset();//reset the animation first
          _setProgressAnim(maxWidth, i + 1);
        },
        children: <Widget>[
          Container(
            color: Colors.greenAccent,
            child: Center(
              child: Text("Page 1"),
            ),
          ),
          Container(
            color: Colors.blueAccent,
            child: Center(
              child: Text("Page 2"),
            ),
          ),
          Container(
            color: Colors.amberAccent,
            child: Center(
              child: Text("Page 3"),
            ),
          ),
          Container(
            color: Colors.purpleAccent,
            child: Center(
              child: Text("Page 4"),
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedProgressBar extends AnimatedWidget {
  // AnimatedProgressBar({Key? key, required Animation<double> animation})
  //     : super(key: key, listenable: animation);
  //
  // Widget build(BuildContext context) {
  //   Animation<double> animation = listenable;
  //   return Container(
  //     height: 6.0,
  //     width: animation.value,
  //     decoration: BoxDecoration(color: Colors.white),
  //   );
  // }

  const AnimatedProgressBar({
    Key key,
    Animation<double> animation, // Now required and cannot be null
  }) : super(
    key: key,
    listenable: animation, // No need to cast anymore
  );

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>; // Still need to cast here
    return Container(
      height: 6.0,
      width: animation.value,
      decoration: const BoxDecoration(color: Colors.white),
    );
  }

}