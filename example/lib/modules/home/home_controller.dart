import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:truespot/truespot_method_channel.dart';

class HomeController extends GetxController {
  final tenantId = "61f1a540b93b7b4a0ccb2ea1";
  final clientSecret = "x8KKW+fIrgikKASLL0CxzqmxAbG9iz6ZUe32bRq+6UYszf8PuWQoa9jQaTY+gLla";
  final isDebugMode = true;

  @override
  void onInit() async {
    super.onInit();
    var response = await TruespotMethodChannel.configure(tenantId, clientSecret, isDebugMode);

    if (kDebugMode) {
      print(response);
    }
  }

  Future<void> requestLocationPermission() async {
    await TruespotMethodChannel.requestLocationPermission();
    return ;
  }

  Future<void> startScanning() async {
    await TruespotMethodChannel.startScanning();
    return ;
  }

  Future<void> stopScanning() async {
    await TruespotMethodChannel.stopScanning();
    return ;
  }

  Future<void> launchTruedarMode() async {
    await TruespotMethodChannel.launchTruedarMode();
    return ;
  }

  Future<void> observeBeaconRanged() async {
    await TruespotMethodChannel.observeBeaconRanged();
    return ;
  }

  Future<void> getTrackingDevices() async {
    await TruespotMethodChannel.getTrackingDevices();
    return ;
  }

  Future<void> pair() async {
    await TruespotMethodChannel.pair();
    return ;
  }

  Future<void> unpair() async {
    await TruespotMethodChannel.unpair();
    return ;
  }
}