import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/settings_controller.dart';

class SettingsScreen extends GetView<SettingsController> {
  const SettingsScreen({Key? key}) : super(key: key);

  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: const SafeArea(
        child: Text("Settings")
      )
    );
  }
}