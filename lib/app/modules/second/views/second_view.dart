import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/app/modules/second/controllers/second_controller.dart';
import 'package:test/app/modules/third/controller/third_controller.dart';
import 'package:test/app/modules/third/view/third_view.dart';
import 'package:test/app/routes/route_name.dart';

class SecondView extends GetView<SecondController> {
  final String? name;
  final String? selectedUser;
  SecondView({
    super.key,
    this.name,
    this.selectedUser,
  });

  final userController = Get.put(ThirdController());

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: const CupertinoThemeData(brightness: Brightness.light),
      home: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            automaticallyImplyLeading: true,
            middle: const Text('Second Screen'),
            leading: CupertinoNavigationBarBackButton(
              onPressed: () {
                Get.offAllNamed(RouteName.firstView);
              },
            ),
          ),
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Welcome',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                ),
                Text(
                  '$name',
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 18),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'Selected User Name: $selectedUser',
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .textStyle
                          .copyWith(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => ThirdView());
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: const Color(0xFF2B637B),
                        fixedSize: Size(Get.width, 40)),
                    child: Text('Choose a User',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        )),
                  ),
                ),
              ],
            ),
          ))),
    );
  }
}
