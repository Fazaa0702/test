import 'package:get/get.dart';
import 'package:test/app/modules/first/bindings/first_binding.dart';
import 'package:test/app/modules/first/views/first_view.dart';
import 'package:test/app/routes/route_name.dart';

class Routes {
  static final routes = [
    GetPage(
      name: RouteName.firstView,
      page: () => const FirstView(),
      binding: FirtsBinding(),
    ),
  ];
}
