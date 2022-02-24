import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocode/geocode.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:groceryboouser/Layouts/ElevatedGreenButton.dart';
import 'package:groceryboouser/Layouts/ToolbarBackOnly.dart';
import 'package:groceryboouser/Model/SigninModel.dart';
import 'package:groceryboouser/Screens/Dashboard/view/BottomNavigation.dart';
import 'package:groceryboouser/Screens/Location/view/saveAddressView.dart';
import 'package:groceryboouser/Utils/common_widget.dart';
import 'package:groceryboouser/Utils/preference_utils.dart';
import 'package:groceryboouser/Utils/share_predata.dart';
import 'package:groceryboouser/Utils/text_utilities.dart';
import 'package:location/location.dart';
import '../../../Styles/my_colors.dart';
import '../../../Styles/my_height.dart';
import '../../../Styles/my_icons.dart';
import '../../../Styles/my_strings.dart';
import '../../../Utilities/Constant.dart';
import '../../../Utils/internet_connection.dart';

// class AddCurrentLocation extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MyHomePage(),
//     );
//   }
// }

class AddCurrentLocation extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<AddCurrentLocation> {
  LatLng _initialcameraposition = LatLng(20.5937, 78.9629);
  GoogleMapController _controller;
  LocationData _currentPosition;
  Location _location = Location();

  String _address = "";

  void _onMapCreated(GoogleMapController _cntlr) {
    _controller = _cntlr;
    _location.onLocationChanged.listen((l) {
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude, l.longitude), zoom: 18),
        ),
      );
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLoc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition:
              CameraPosition(target: _initialcameraposition),
              mapType: MapType.normal,
              onMapCreated: _onMapCreated,
              myLocationEnabled: true,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 24,
                    ),
                    BackLayout(),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: new BoxDecoration(
                        color: Colors.white,
                        borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(30.0),
                            topRight: const Radius.circular(30.0))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Opacity(
                            opacity: 0.4000000059604645,
                            child: Container(
                                width: 48,
                                height: 4,
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                    color: const Color(0xff96a6a3))),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 17, left: 24, right: 28.3, bottom: 17),
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
                                    width: 260,
                                    child: Text(_address,
                                        style: TextStyle(
                                            color: black_273433,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: sf_pro_display_medium,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 16),
                                        textAlign: TextAlign.left),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 26,
                              ),
                              InkWell(
                                onTap: () {
                                  saveAddress(context);
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: HeightData.sixty,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: grey_e9ecec,
                                    ),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                  ),
                                  child: Text(add_to_save_places,
                                      style: TextStyle(
                                        color: skygreen_24d39e,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: sf_pro_display_bold,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16.0,
                                      ),
                                      textAlign: TextAlign.center),
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              CommonElevatedButton("Continue", Colors.white,
                                  skygreen_24d39e,(){
                                saveAddress(context);
                              }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  getLoc() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    // checking internet
    checkNet(context).then((value) async {
      // returning when no connection
      if (!value) return;
    });

    // Showing loader
    onLoading(context, "Loading..");

    _currentPosition = await _location.getLocation();

    //Removing Loader
    Navigator.pop(context);

    _initialcameraposition =
        LatLng(_currentPosition.latitude, _currentPosition.longitude);
    _location.onLocationChanged.listen((LocationData currentLocation) {
      print(
          "LatLng ${currentLocation.latitude} : ${currentLocation.longitude} " +
              DateTime.now().toString());

      if (mounted)
        setState(() {
          _currentPosition = currentLocation;
          _initialcameraposition =
              LatLng(_currentPosition.latitude, _currentPosition.longitude);

          SharePreData.strCurrentLatitude = "${currentLocation.longitude}";
          SharePreData.strCurrentLongitude = "${currentLocation.longitude}";

          GeoCode geoCode = GeoCode();
          geoCode
              .reverseGeocoding(
              latitude: _currentPosition.latitude,
              longitude: _currentPosition.longitude)
              .then((value) =>
          // print("Geocode" + value.streetAddress.toString())

          setState(() {
            if (value.streetNumber == null) {
              _address =
              "${value.streetAddress} ${value.postal} ${value.city}";
              SharePreData.strCurrentLocationAddress = _address;
            } else {
              _address =
              "${value.streetNumber} ${value.streetAddress} ${value.postal} ${value.city}";
              SharePreData.strCurrentLocationAddress = _address;
            }
          }));
        });
    });
  }
}

saveAddress(BuildContext context) async {
  if (SharePreData.strCurrentLatitude
      .toString()
      .isEmpty) {
    snackBarRapid(
        context, "Location is not fetched");
    return;
  }
  if (SharePreData.strCurrentLongitude
      .toString()
      .isEmpty) {
    snackBarRapid(
        context, "Location is not fetched");
    return;
  }
  if (SharePreData.strCurrentLocationAddress
      .toString()
      .isEmpty) {
    snackBarRapid(
        context, "Location is not fetched");
    return;
  }
  imagePath.toString() != "File: ''";

  var preferences = MySharedPref();
  await preferences.clear(SharePreData.key_SaveAddressDatumModel);

  Get.off(() => SaveAddress());

}