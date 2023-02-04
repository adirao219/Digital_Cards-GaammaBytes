import 'package:digitalcards_gaammabytes/core/app_export.dart';
import 'package:digitalcards_gaammabytes/core/utils/osm_map.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_iconbutton.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_title.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcards_gaammabytes/widgets/custom_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_cropper/image_cropper.dart';

import 'dart:io';
import '../../widgets/custom_text_form_field.dart';

class LocationSelectionScreen extends StatefulWidget {
  const LocationSelectionScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LocationSelectionScreen createState() => _LocationSelectionScreen();
}

class _LocationSelectionScreen extends State<LocationSelectionScreen> {
  LatLong? currentLatLong;
  LatLong? finalLatLong;

  @override
  void initState() {
    getCurrentLocation();
    super.initState();
  }

  getCurrentLocation() async {
    try {
      var checkpermission = await _handleLocationPermission();
      if (checkpermission) {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        setState(() {
          currentLatLong =
              finalLatLong = LatLong(position.latitude, position.longitude);
        });
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
                height: getVerticalSize(108.00),
                centerTitle: true,
                title: Container(
                    height: getVerticalSize(96.00),
                    width: size.width,
                    child: Stack(alignment: Alignment.bottomCenter, children: [
                      AppbarImage(
                          height: getVerticalSize(94.00),
                          width: getHorizontalSize(375.00),
                          imagePath: ImageConstant.imgVectorDeepOrangeA100,
                          margin: getMargin(bottom: 2)),
                      AppbarTitle(
                          text: "lbl_select_location".tr.toUpperCase(),
                          margin:
                              getMargin(left: 0, top: 58, right: 0, bottom: 9)),
                      AppbarIconbutton(
                          svgPath: ImageConstant.imgArrowleft,
                          margin: getMargin(left: 25, top: 44, right: 298),
                          onTap: onTapArrowleft20)
                    ])),
                styleType: Style.bgStyle_21),
            body:currentLatLong!=null? OpenStreetMap(
                center: LatLong(currentLatLong!.latitude,currentLatLong!.longitude),
                buttonColor: Colors.deepOrange,
                buttonText: '',
                onPicked: (pickedData) {
                  finalLatLong = LatLong(pickedData.latLong.latitude,
                      pickedData.latLong.longitude);
                }):Container(),
            bottomNavigationBar: InkWell(
                onTap: onTapArrowleft20,
                child: Padding(
                    padding: getPadding(left: 25, right: 24, bottom: 58),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomButton(
                            prefixWidget: Icon(Icons.done,color: Colors.white,size: 20,),
                              height: 40, width: 120, text: "  "+"lbl_ok".tr)
                        ])))));
  }

  onTapArrowleft20() {
    Get.back(result: {"latLong": finalLatLong});
  }
}
