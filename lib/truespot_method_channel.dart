import 'dart:async';

import 'package:flutter/services.dart';

class TruespotMethodChannel {
  static const MethodChannel _channel = MethodChannel('truespot');

  static Future<dynamic> configure(String tenantId, String clientSecret, bool isDebugMode) async {
    return await _channel.invokeMethod(
      'configure',
      {'tenantId': tenantId, 'clientSecret': clientSecret, 'isDebugMode': isDebugMode},
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

  static Future<void> observeBeaconRanged() async {
    await _channel.invokeMethod('observeBeaconRanged');
  }

  static Future<void> getTrackingDevices() async {
    await _channel.invokeMethod('getTrackingDevices');
  }

  static Future<void> pair() async {
    await _channel.invokeMethod('pair');
  }

  static Future<void> unpair() async {
    await _channel.invokeMethod('unpair');
  }
}
