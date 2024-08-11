import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/app/modules/first/controllers/first_controller.dart';
import 'package:test/app/modules/second/views/second_view.dart';

class FirstView extends GetView<FirstController> {
  const FirstView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            height: Get.height,
            width: Get.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.fill),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: Image.asset('assets/images/ic_photo.png'),
                  ),
                  TextFormField(
                    onChanged: (value) async {
                      controller.name = value;
                    },
                    enableSuggestions: false,
                    controller: controller.nameController,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins'),
                    maxLines: 1,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 15),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  TextFormField(
                    enableSuggestions: false,
                    controller: controller.textInputController,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins'),
                    maxLines: 1,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Text',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 15),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  Obx(() => (controller.isPalindrome.value == true)
                      ? Text('${controller.textInput} is Palindrom')
                      : Text('${controller.textInput} is not Palindrom')),
                  Padding(padding: EdgeInsets.all(10)),
                  SizedBox(
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        if (controller.textInputController.text.isNotEmpty) {
                          controller.palindromeChecker(
                              controller.textInputController.text);
                          print('test ${controller.isPalindrome}');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: const Color(0xFF2B637B),
                          fixedSize: Size(Get.width, 40)),
                      child: const Text('Check',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                          )),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  SizedBox(
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () async {
                        Get.to(() => SecondView(
                              name: controller.nameController.text,
                            ));
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: const Color(0xFF2B637B),
                          fixedSize: Size(Get.width, 40)),
                      child: const Text('Next',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                          )),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
