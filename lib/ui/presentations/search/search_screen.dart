import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/search_controller.dart';

class SearchScreen extends GetView<SearchController> {
  const SearchScreen({Key? key}) : super(key: key);

  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
      ),
      body: const SafeArea(
          child: Text("Search")
      )
    );
  }
}