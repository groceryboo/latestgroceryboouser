import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var getBusinessValue;

class ActionSheet {
  Widget actionSheet(BuildContext context,
      { Function onCamera,
         Function onGallery,

         String text}) {
    return CupertinoActionSheet(
      title: Text(
        text,
        style: secondaryTextStyle(),
      ),
      actions: [
         Column(
          children: [
            CupertinoActionSheetAction(
              onPressed: () {
                onCamera();
                finish(context);
              },
              child: Text('Camera', style: primaryTextStyle(size: 18)),
              isDefaultAction: true,
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                onGallery();
                finish(context);
              },
              child: Text('Gallery', style: primaryTextStyle(size: 18)),
              isDefaultAction: true,
            )
          ],
        )
      ],
      cancelButton: CupertinoActionSheetAction(
          onPressed: () {
            finish(context);
          },
          child: Text(
            'Cancel',
            style: primaryTextStyle(color: Colors.grey, size: 18),
          )),
    );
  }
}
secondaryTextStyle({int size = 16, Color color = Colors.blue}) {
  return TextStyle(
    fontSize: size.toDouble(),
    color: color,
  );
}
boldTextStyle({int size = 18, Color color = Colors.grey}) {
  return TextStyle(
    fontSize: size.toDouble(),
    color: color,
    fontWeight: FontWeight.bold,
  );
}

//
primaryTextStyle({int size = 18, Color color = Colors.grey}) {
  return TextStyle(
    fontSize: size.toDouble(),
    color: color,
  );
}
finish(context) {
  Navigator.pop(context);
}
