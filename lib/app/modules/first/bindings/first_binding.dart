import 'package:get/get.dart';

import '../controllers/first_controller.dart';

class FirtsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FirstController());
  }
}
