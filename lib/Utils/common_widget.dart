import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

/*--------------------------------------------Constance--------------------------------------------------*/

File imagePath = File("");

centerProgress() {
  return const Center(child: CircularProgressIndicator());
}

void onLoading(BuildContext context, String msg) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(msg),
              ),
            ],
          ),
        ),
      );
    },
  );
}

imageLoad(url, height, width) {
  return Padding(
    padding: EdgeInsets.all(2),
    child: url == null
        ? Container(
            child: const Icon(
              Icons.image,
              size: 71.3,
            ),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ))
        : CachedNetworkImage(
            imageUrl: url,
            imageBuilder: (context, imageProvider) {
              return Container(
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ));
            },
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(value: downloadProgress.progress),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
  );
}

radiusImageLoad(url, height, width, radius) {
  return Container(
    margin: EdgeInsets.only(left: 5, right: 5),
    height: 380,
    decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 10.0,
              spreadRadius: 0.5),
        ],
        borderRadius: BorderRadius.all(Radius.circular(radius))),
    // padding: const EdgeInsets.all(5.0),
    child: url == null
        ? Icon(
            Icons.image,
            size: 71.3,
          )
        : CachedNetworkImage(
            imageUrl: url,
            imageBuilder: (context, imageProvider) {
              return Container(
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(radius)),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ));
            },
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(value: downloadProgress.progress),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
  );
}

Future<Uint8List> getBytesFromAsset(String path, int width) async {
  ByteData data = await rootBundle.load(path);
  ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
      targetWidth: width);
  ui.FrameInfo fi = await codec.getNextFrame();
  return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
      .buffer
      .asUint8List();
}

bool emailValidator(String email) {
  return RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(email);
}

int randomNumberGenrate() {
  var rng = new Random();
  for (var i = 0; i < 10; i++) {
    int num = rng.nextInt(10000);
    if (num.toString().length != 4) {
      return 8846;
    } else {
      return num;
    }
  }
  return 7989;
}

Future showImagePicker(context) {
  // imagePath = null;
  Future<void> future = showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0))),
          child: Wrap(
            children: <Widget>[
              ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Gallery'),
                  onTap: () {
                    _getFile(ImageSource.gallery)
                        .then((value) => Navigator.of(context).pop());
                  }),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  _getFile(ImageSource.camera)
                      .then((value) => Navigator.of(context).pop());
                },
              ),
            ],
          ),
        ),
      );
    },
  );
  return future;
}

Future _getFile(ImageSource source) async {
  PickedFile pickedFile = await ImagePicker().getImage(
    source: source,
  );
  print("Image Path " + pickedFile.path);

  if (pickedFile != null) {
    return imagePath = File(pickedFile.path);
  } else {
    return "";
  }
}

String hrDiff(String time) {
  var date = new DateTime.fromMillisecondsSinceEpoch(int.parse(time) * 1000);
  var hr = DateTime.now().difference(date).inHours;
  int minHr = 24 - hr;
  var finalHr = minHr.toString().replaceAll("-", "");
  if (int.parse(finalHr) <= 24) {
    return finalHr;
  } else {
    return "";
  }
}

String timeDiff(String time1, String time2) {
  var getTime1 = new DateTime.fromMillisecondsSinceEpoch(int.parse(time1));
  var getTime2 = DateTime.fromMillisecondsSinceEpoch(int.parse(time2));
  var diffHr = getTime1.difference(getTime2).inHours;
  var diffMin = getTime1.difference(getTime2).inMinutes;
  var diffSec = getTime1.difference(getTime2).inSeconds;
  // print("akash diffTime $diff");
  var finalHr = diffHr.toString().replaceAll("-", "");
  var finalMin = diffMin.toString().replaceAll("-", "");
  var finalSec = diffSec.toString().replaceAll("-", "");

  // return "$finalHr Hr : $finalMin Min : $finalSec Sec";
  return "$finalMin";
}

String getDateTime(String pattern, String timestamp) {
  var format = DateFormat(pattern);
  var date = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp));
  return format.format(date);
}

double calculateDistance(
    double currentLat, double currentLng, double lat2, double lng2) {
  double radEarth = 6.3781 * (pow(10.0, 6.0)); //distance return in meters
  double phi1 = currentLat * (pi / 180);
  double phi2 = lat2 * (pi / 180);

  double delta1 = (lat2 - currentLat) * (pi / 180);
  double delta2 = (lng2 - currentLng) * (pi / 180);

  double cal1 = sin(delta1 / 2) * sin(delta1 / 2) +
      (cos(phi1) * cos(phi2) * sin(delta2 / 2) * sin(delta2 / 2));

  double cal2 = 2 * atan2((sqrt(cal1)), (sqrt(1 - cal1)));
  double distance = radEarth * cal2;

  return (distance);
}

closeKeyboard(BuildContext context) {
  FocusScope.of(context).requestFocus(FocusNode());
}

String validateMobile(String value) {
  String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regExp = new RegExp(pattern);
  if (value.length == 0) {
    return 'Please enter mobile number';
  } else if (!regExp.hasMatch(value)) {
    return 'Please enter valid mobile number';
  }
  return null;
}

void printData(String str, String val) {
  print(str + " :::  " + val);
}

Future<void> launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

Future<File> getImageFileFromAssets(String path) async {
  final byteData = await rootBundle.load('$path');
  final buffer = byteData.buffer;
  Directory tempDir = await getTemporaryDirectory();
  String tempPath = tempDir.path;
  var filePath =
      tempPath + '/file_01.tmp'; // file_01.tmp is dump file, can be anything
  return File(filePath)
      .writeAsBytes(buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
}
