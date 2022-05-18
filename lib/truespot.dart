import 'dart:async';

import 'package:flutter/services.dart';

class Truespot {
  static const MethodChannel _channel = MethodChannel('truespot');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<void> configure(String appId, bool isDebugMode) async {
    await _channel.invokeMethod(
      'configure',
      {'appId': appId, 'isDebbugMode': isDebugMode},
    );
  }

  static Future<void> requestLocationPermission() async {
    await _channel.invokeMethod('requestLocationPermission');
  }

  static Future<void> startScanning() async {
    await _channel.invokeMethod('startScanning');
  }

  static Future<void> stopScanning() async {
    await _channel.invokeMethod('stopScanning');
  }

  static Future<void> launchTruedarMode() async {
    await _channel.invokeMethod('launchTruedarMode');
  }

  static Future<void> getTrackingDevices() async {
    await _channel.invokeMethod('getTrackingDevices');
  }

  static Future<void> pair() async {
    await _channel.invokeMethod('pair');
  }
}
