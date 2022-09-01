import 'package:flutter/material.dart';
import 'package:truespot_example/widgets/generic_text_field.dart';
import 'home_controller.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => GestureDetector(
        onTap: () => Get.focusScope?.unfocus(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('TrueSpot'),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  title: const Text('Start Scanning'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () => controller.startScanning(),
                ),
                ListTile(
                  title: const Text('Stop Scanning'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () => controller.stopScanning(),
                ),
                ListTile(
                  title: const Text('Launch truedar mode'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () => controller.launchTruedarMode(""),
                ),
                ListTile(
                  title: const Text('Get tracking devices'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () => controller.getTrackingDevices(),
                ),
                ListTile(
                  title: const Text('Pair'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () => Get.bottomSheet(
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
                      padding: const EdgeInsets.all(20),
                      child: GestureDetector(
                        onTap: () => Get.focusScope?.unfocus(),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GenericTextField(
                                title: 'VIN',
                                hint: 'Enter VIN',
                                controller: controller.vinController,
                              ),
                              const SizedBox(height: 15),
                              GenericTextField(
                                title: 'Tag Identifier',
                                hint: 'Enter Tag Identifier',
                                controller: controller.tagIdentifierController,
                              ),
                              const SizedBox(height: 15),
                              MaterialButton(
                                child: const Text('Pair device'),
                                color: Colors.green,
                                minWidth: Get.width,
                                onPressed: () =>
                                    controller.pair(),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
