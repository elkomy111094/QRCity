import 'dart:collection';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:qr_city/Constants/colors.dart';
import 'package:qr_city/Helper/routing_functions.dart';
import 'package:qr_city/Views/Widgets/store_Item.dart';
import 'package:sizer/sizer.dart';

class NearestStoresScreen extends StatefulWidget {
  const NearestStoresScreen({Key? key}) : super(key: key);

  @override
  State<NearestStoresScreen> createState() => _NearestStoresScreenState();
}

class _NearestStoresScreenState extends State<NearestStoresScreen> {
  int selectedCategory = 0;

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

  @override
  void initState() {
    getlocation().then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Container(
            height: double.infinity,
            width: double.infinity,
            child: Stack(
              children: [
                Container(
                  height: 60.h,
                  width: double.infinity,
                  child: GoogleMap(
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
                      });
                    },
                    onMapCreated: (mapController) {
                      setState(() {
                        myMapController = mapController;
                        getlocation().then((value) {
                          myMapController?.animateCamera(
                              CameraUpdate.newCameraPosition(CameraPosition(
                                      target: LatLng(lat!, long!), zoom: 17)
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
                    /* myLocationButtonEnabled: true,*/
                    /*myLocationEnabled: true,*/
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
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 45.h,
                    decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black87,
                              blurRadius: 5,
                              spreadRadius: 1)
                        ],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(3.h),
                            topRight: Radius.circular(3.h))),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5.h,
                        ),
                        buildCategoriesHorizontalList(),
                        SizedBox(
                          height: 2.h,
                        ),
                        buildCategorySomeItemsHorizontalList(),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 1.h,
                  left: 2.w,
                  right: 2.w,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                        child: GestureDetector(
                          onTap: () {
                            pop(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: kDarkBlue,
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(1),
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Padding(
                                  padding: EdgeInsets.all(.5.h),
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: kDarkBlue,
                                    size: 15.sp,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Expanded(
                        child: Container(
                          height: 6.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(2.h),
                            border: Border.all(color: Colors.grey, width: 1),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 3.w),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset("assets/icons/mylocation.svg",
                                    width: 2.h, height: 2.h, color: kLightBlue),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text(
                                  "جده 3422 السعوديه",
                                  style: TextStyle(
                                    color: kBlue,
                                    fontSize: 12.sp,
                                    fontFamily: "Taga",
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildCategoriesHorizontalList() {
    List<Map<String, dynamic>> catList = [
      {
        "name": "مطاعم",
        "image": "assets/icons/rest.svg",
        "count": "211",
      },
      {
        "name": "مقاهي",
        "image": "assets/icons/coffe.svg",
        "count": "250",
      },
      {
        "name": "أسر منتجه",
        "image": "assets/icons/family.svg",
        "count": "75",
      },
      {
        "name": "ماركت",
        "image": "assets/icons/market.svg",
        "count": "305",
      },
      {
        "name": "شقق فندقيه",
        "image": "assets/icons/hotel.svg",
        "count": "124",
      },
      {
        "name": "منتزهات",
        "image": "assets/icons/park.svg",
        "count": "17",
      }
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: SizedBox(
        height: 12.h,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    selectedCategory = index;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: selectedCategory == index ? kBlue : kLightWhite,
                    borderRadius: BorderRadius.circular(1.h),
                  ),
                  width: 30.w,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          catList[index]["image"],
                          width: 4.h,
                          color: selectedCategory == index
                              ? Color(0xffffffff)
                              : kBlue,
                          height: 4.h,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          catList[index]["name"].toString(),
                          style: TextStyle(
                              color: selectedCategory == index
                                  ? Color(0xffffffff)
                                  : kDarkBlue,
                              fontSize: 12.sp,
                              fontFamily: "Taga"),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          catList[index]["count"].toString(),
                          style: TextStyle(
                              color: selectedCategory == index
                                  ? Color(0xffffffff)
                                  : kDarkBlue,
                              fontSize: 12.sp,
                              fontFamily: "Taga"),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, _) {
              return SizedBox(
                width: 5.w,
              );
            },
            itemCount: catList.length),
      ),
    );
  }

  buildCategorySomeItemsHorizontalList() {
    return SizedBox(
        height: 25.h,
        width: double.infinity,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, innerIndex) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
              child: FittedBox(
                child: StoreItem(
                  isFavorite: false,
                  currentContext: context,
                  name: "ماكدونالدز",
                  desc: "أفضل مطعم يقدم البرجر طازج",
                  busineesID: 1,
                ),
              ),
            );
          },
          separatorBuilder: (context, _) {
            return SizedBox(
              width: 1.w,
            );
          },
          itemCount: 5,
        ));
  }
}
