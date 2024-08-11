import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/app/modules/second/views/second_view.dart';
import 'package:test/app/modules/third/controller/third_controller.dart';

import '../../../data/user_model.dart';

class ThirdView extends StatelessWidget {
  ThirdView({
    super.key,
  });

  final controller = Get.put(ThirdController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.light),
      home: Scaffold(
          appBar: CupertinoNavigationBar(
            automaticallyImplyLeading: true,
            middle: const Text('Third Screen'),
            leading: CupertinoNavigationBarBackButton(
              onPressed: () {
                Get.back();
              },
            ),
          ),
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(16),
            child: Obx(() => controller.isLoading.value
                ? const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Color(0xFF47B347),
                      ),
                    ),
                  )
                : controller.users.isEmpty
                    ? const Center(
                        child: Column(
                          children: [
                            Text('No data available'),
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: controller.users.length + 1,
                        itemBuilder: (context, index) {
                          if (index == controller.users.length) {
                            controller.loadMore();
                            return const Center(
                                child: CircularProgressIndicator());
                          } else {
                            User user = controller.users[index];
                            return ListTile(
                              leading: CircleAvatar(
                                  backgroundImage: NetworkImage(user.avatar)),
                              title: Text('${user.firstName} ${user.lastName}'),
                              subtitle: Text(user.email),
                              onTap: () {
                                Get.off(() => SecondView(
                                      selectedUser: user.firstName,
                                    ));
                              },
                            );
                          }
                        })),
          ))),
    );
  }
}
