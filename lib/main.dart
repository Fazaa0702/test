import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:test/app/routes/route_name.dart';

import 'app/routes/routes.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: RouteName.firstView,
      getPages: Routes.routes,
    ),
  );
}
