import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstController extends GetxController {
  var name = '';
  var textInput = ''.obs;
  var textInputController = TextEditingController();
  var nameController = TextEditingController();
  var isPalindrome = false.obs;

  void palindromeChecker(String text) {
    String cleanedText = text.replaceAll(RegExp(r'\s+'), '').toLowerCase();
    String reversedText = cleanedText.split('').reversed.join('');
    if (cleanedText == reversedText) {
      isPalindrome.value = true;
    } else {
      isPalindrome.value = false;
    }
  }
}
