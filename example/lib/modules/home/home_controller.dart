import 'package:get/get.dart';
import 'package:truespot/truespot.dart';

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

  Future<void> getTrackingDevices() async {
    await Truespot.getTrackingDevices();
    return ;
  }

  Future<void> pair() async {
    await Truespot.pair();
    return ;
  }
}