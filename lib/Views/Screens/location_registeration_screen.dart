import 'dart:collection';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:qr_city/Constants/colors.dart';
import 'package:qr_city/Helper/routing_functions.dart';
import 'package:qr_city/Views/Screens/complete_registeration_screen.dart';
import 'package:qr_city/Views/Screens/home_screen.dart';
import 'package:qr_city/Views/Widgets/custom_text_icon_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class LocationRegisterationScreen extends StatefulWidget {
  @override
  _LocationRegisterationScreenState createState() =>
      _LocationRegisterationScreenState();
}

class _LocationRegisterationScreenState
    extends State<LocationRegisterationScreen> {
  int tabbed = 0;
  double? long = 54.0996582;
  double? lat = 23.9561599;
  String url = '';
  double zoomVal = 5;
  var markers = HashSet<Marker>();
  bool markerTapped = false;
  var cameraPosition;
  int markerLatestId = 1;

  GoogleMapController? myMapController;
  Future getlocation() async {
    LocationPermission per = await Geolocator.checkPermission();
    if (per == LocationPermission.denied ||
        per == LocationPermission.deniedForever) {
      print("permission denied");
      LocationPermission per1 = await Geolocator.requestPermission();
    } else {
      Position currentLoc = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      String position = currentLoc.latitude.toString() +
          "," +
          currentLoc.longitude.toString();

      print(position);

      setState(() {
        long = currentLoc.longitude;
        lat = currentLoc.latitude;
        zoomVal = 20;
        cameraPosition = CameraPosition(
          target: LatLng(lat!, long!),
          zoom: 20,
        );
        myMapController?.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(target: LatLng(lat!, long!), zoom: 17)
            //17 is new zoom level
            ));
        url =
            "https://www.google.com/maps/dir/?api=1&origin=$position&destination=$lat,$long&waypoints";
      });
    }
  }

  Future ChangeCurrentLoc(LatLng MyPosition) async {
    LocationPermission per = await Geolocator.checkPermission();
    if (per == LocationPermission.denied ||
        per == LocationPermission.deniedForever) {
      print("permission denied");
      LocationPermission per1 = await Geolocator.requestPermission();
    } else {
      LatLng currentLoc = MyPosition;
      String position = currentLoc.latitude.toString() +
          "," +
          currentLoc.longitude.toString();

      setState(() {
        long = currentLoc.longitude;
        lat = currentLoc.latitude;
        url =
            "https://www.google.com/maps/dir/?api=1&origin=$position&destination=$lat,$long&waypoints";

        log(lat.toString());
        log(long.toString());
      });
    }
  }

  Future<void> saveMyLocationData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setDouble("lat", lat!);
    pref.setDouble("long", long!);
  }

  @override
  void initState() {
    getlocation().then((value) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    myMapController!.dispose();
  }

  void modalBottomSheetMenu(LatLng choosenPosition) {
    showModalBottomSheet(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(5.h), topLeft: Radius.circular(5.h)),
        ),
        context: context,
        builder: (builder) {
          return Padding(
            padding: EdgeInsets.all(1.h),
            child: Container(
              height: 35.h,
              color:
                  Colors.transparent, //could change this to Color(0xFF737373),
              //so you don't have to change MaterialApp canvasColor
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(3.h),
                  child: Column(
                    children: [
                      Container(
                        height: 5,
                        width: 15.w,
                        decoration: BoxDecoration(
                          color: kLightWhite,
                          borderRadius: BorderRadius.circular(5.h),
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Container(
                        height: 15.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: kLightWhite,
                          borderRadius: BorderRadius.circular(1.h),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "تم إختيار الموقع بنجاح",
                                style: TextStyle(
                                    color: kDarkBlue,
                                    fontFamily: "Taga",
                                    fontSize: 15.sp),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                "${choosenPosition.longitude} & ${choosenPosition.latitude}",
                                style: TextStyle(
                                    color: kLightBlue,
                                    fontFamily: "Taga",
                                    fontSize: 12.sp),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      CustomTextIconButton(
                          icon: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 2.h,
                            child: Center(
                              child: SvgPicture.asset(
                                "assets/icons/mylocation.svg",
                                color: Colors.white,
                              ),
                            ),
                          ),
                          buttonColor: kDarkBlue.withOpacity(.85),
                          textColor: Colors.white,
                          textSize: 14.sp,
                          onPressed: () async {
                            saveMyLocationData().then((value) {
                              navigateToScreen(
                                  ctx: context, nextScreen: CompleteRegisterationScreen());
                            });
                          },
                          buttonVerticalPaddingVal: 0,
                          buttonHorizontalPaddingval: 0,
                          roundedBorder: 10,
                          text: "متابعه")
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: GoogleMap(
            onTap: (position) async {
              await ChangeCurrentLoc(position).then((value) {
                markers.clear();
                markers.add(
                  Marker(
                    markerId: MarkerId(markerLatestId.toString()),
                    position: position,
                    infoWindow: InfoWindow(
                      title: "الموقع الحالي",
                    ),
                  ),
                );
                modalBottomSheetMenu(position);
              });
            },
            onMapCreated: (mapController) {
              setState(() {
                myMapController = mapController;
                getlocation().then((value) {
                  myMapController?.animateCamera(CameraUpdate.newCameraPosition(
                      CameraPosition(target: LatLng(lat!, long!), zoom: 17)
                      //17 is new zoom level
                      ));
                  markers.add(
                    Marker(
                      markerId: MarkerId("100"),
                      position: LatLng(lat!, long!),
                      infoWindow: InfoWindow(
                        title: "الموقع الحالي",
                      ),
                    ),
                  );
                });
              });
            },
            markers: markers,
            mapType: MapType.normal,
            mapToolbarEnabled: false,
            tiltGesturesEnabled: false,
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            zoomControlsEnabled: false,
            onCameraMove: (position) {
              setState(() {
                zoomVal = 15;
              });
            },
            initialCameraPosition: cameraPosition == null
                ? CameraPosition(
                    target: lat == null && long == null
                        ? LatLng(markers.first.position.latitude,
                            markers.first.position.longitude)
                        : LatLng(lat!, long!),
                    zoom: 0,
                  )
                : cameraPosition,
          ),
        ),
      ),
    );
  }
}
