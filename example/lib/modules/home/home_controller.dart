import 'dart:convert';

import 'package:get/get.dart';
import 'package:truespot/truespot.dart';
import 'package:truespot_example/tsdevice.mode.dart';

class HomeController extends GetxController {


  Future<void> configure(String appId, bool isDebugMode) async {
    await Truespot.configure(appId, isDebugMode);
    return ;
  }

  Future<void> requestLocationPermission() async {
    await Truespot.requestLocationPermission();
    return ;
  }

  Future<void> startScanning() async {
    await Truespot.startScanning();
    return ;
  }

  Future<void> stopScanning() async {
    await Truespot.stopScanning();
    return ;
  }

  Future<void> launchTruedarMode() async {
    await Truespot.launchTruedarMode();
    return ;
  }

  Future<List<TsDevice>> getTrackingDevices() async {
    dynamic response = await Truespot.getTrackingDevices();
    List<TsDevice> list = tsDeviceFromJson(response);
    return list;
  }

  Future<String> pair(String assetIdentifier, String assetType, String tagId) async {
    String response = await Truespot.pair(assetIdentifier,assetType, tagId);
    return response;
  }
}