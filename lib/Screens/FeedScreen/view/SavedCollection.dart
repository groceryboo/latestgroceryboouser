import 'package:flutter/material.dart';
import 'package:groceryboouser/Styles/my_icons.dart';
import 'package:groceryboouser/Styles/my_strings.dart';

import '../../../Layouts/ToolbarWithHeaderAction.dart';
import '../../../Utils/SizeConfig.dart';

class SavedCollection extends StatefulWidget {
  const SavedCollection({Key key}) : super(key: key);

  @override
  _SavedCollectionState createState() => _SavedCollectionState();
}

class _SavedCollectionState extends State<SavedCollection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(children: [
      Container(
          margin: EdgeInsets.fromLTRB(SizeConfig.screenWidth * 0.05, 0,
              SizeConfig.screenWidth * 0.05, SizeConfig.screenHeight * 0.025),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            ToolbarWithHeaderAction(saved, plus, () {}),
            SizedBox(
              height: SizeConfig.screenHeight * 0.025,
            ),
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              shrinkWrap: true,
              children: List.generate(
                20,
                (index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(2, 2),
                            blurRadius: 12,
                            color: Color.fromRGBO(0, 0, 0, 0.16),
                          ),
                        ],
                        image: DecorationImage(
                          image: NetworkImage('img.png'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ]))
    ])));
  }
}
