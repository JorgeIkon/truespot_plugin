import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:truespot/truespot.dart';
import 'package:truespot_example/models/tsdevice.mode.dart';

class HomeController extends GetxController {

  final TextEditingController vinController = TextEditingController();
  final TextEditingController tagIdentifierController = TextEditingController();

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

  Future<void> launchTruedarMode(String jsonDevice) async {
    dynamic response = await Truespot.getTrackingDevices();
    List<TsDevice> list = tsDeviceFromJson(response);
    TsDevice device = list.firstWhere((element) => element.tagIdentifier == '0000-12YJE');
    await Truespot.launchTruedarMode(tsDeviceToJsonString(device));
    return ;
  }

  Future<List<TsDevice>> getTrackingDevices() async {
    dynamic response = await Truespot.getTrackingDevices();
    List<TsDevice> list = tsDeviceFromJson(response);
    
    return list;
  }

  Future<String> pair() async {
    // "WV2YB0253GG02054", "Key", "0000-12YJE"
    print('VIN: ${vinController.text}, tagIdentifier: ${tagIdentifierController.text}');
    // String response = await Truespot.pair(vinController.text,"Key", tagIdentifierController.text);
    return 'VIN: ${vinController.text}, tagIdentifier: ${tagIdentifierController.text}';
  }
}