import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jomeat/ui/presentations/home/controller/home_controller.dart';
import 'package:jomeat/ui/widgets/home_item_widget.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  Future<void> _refreshData() async {
    return controller.onRefresh();
  }

  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: SafeArea(
      child:RefreshIndicator(
          onRefresh: _refreshData,
          child: Obx(() => GridView.builder(
            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1/1.4,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
            ),
            padding: const EdgeInsets.all(8.0),
            itemCount: controller.data.length,
            itemBuilder: (BuildContext context, int index) {
              return HomeItem(controller.data[index]);
            },
          )),
        )
      ),
    );
  }
}