import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../data/user_model.dart';

class ThirdController extends GetxController {
  var users = <User>[].obs;
  var isLoading = true.obs;
  var page = 1.obs;

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  void fetchUsers() async {
    var response = await http.get(Uri.parse(
        'https://reqres.in/api/users?page=${page.value}&per_page=10'));
    if (response.statusCode == 200) {
      isLoading.value = false;
      var jsonData = json.decode(response.body);
      var userList = (jsonData['data'] as List)
          .map((user) => User.fromJson(user))
          .toList();
      if (userList.isNotEmpty) {
        users.addAll(userList);
      }
    }
  }

  void loadMore() {
    page.value++;
    fetchUsers();
  }

  void refreshList() {
    users.clear();
    page.value = 1;
    fetchUsers();
  }
}
