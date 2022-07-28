import 'package:flutter/material.dart';
import 'home_controller.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: const Text('TrueSpot'),
        ),
        body: Column(
          children: [
            ListTile(
              title: const Text('Request Location Permission'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: ()=> controller.requestLocationPermission(),
            ),
            ListTile(
              title: const Text('Start Scanning'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: ()=> controller.startScanning(),
            ),
            ListTile(
              title: const Text('Stop Scanning'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: ()=> controller.stopScanning(),
            ),
            ListTile(
              title: const Text('Launch truedar mode'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: ()=> controller.launchTruedarMode(),
            ),
            ListTile(
              title: const Text('Observe Beacon Ranged'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: ()=> controller.observeBeaconRanged(),
            ),
            ListTile(
              title: const Text('Get tracking devices'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: ()=> controller.getTrackingDevices(),
            ),
            ListTile(
              title: const Text('Pair'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: ()=> controller.pair(),
            ),
            ListTile(
              title: const Text('Unpair'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: ()=> controller.pair(),
            ),
          ],
        ),
      ),
    );
  }
}
