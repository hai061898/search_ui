import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchbox/controllers/home_controller.dart';

import 'models/data_models.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade900,
        title: Container(
          height: 38,
          child: TextField(
            onChanged: (s) => controller.onseach(s),
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade600,
                contentPadding: EdgeInsets.all(0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none,
                ),
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey.shade500),
                hintText: "Search users",
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey.shade500,
                )),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(right: 20, left: 20),
        color: Colors.grey.shade900,
        child: Obx(
          () => controller.findsearch.length > 0
              ? ListView.builder(
                  itemCount: controller.findsearch.length,
                  itemBuilder: (context, index) {
                    return ContainerUser(user: controller.findsearch[index]);
                  })
              : Center(
                  child: Text(
                  "No users found",
                  style: TextStyle(color: Colors.white),
                )),
        ),
      ),
    );
  }
}

class ContainerUser extends StatelessWidget {
  const ContainerUser({Key? key, required this.user}) : super(key: key);
  final User user;
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(user.image),
                ),
              ),
              SizedBox(width: 10),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(user.name,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500)),
                SizedBox(
                  height: 5,
                ),
                Text(user.username, style: TextStyle(color: Colors.grey[500])),
              ])
            ],
          ),
          ButtonFollow(controller: controller),         
        ],
      ),
    );
  }
}

class ButtonFollow extends StatelessWidget {
  const ButtonFollow({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        
        controller.isFollower();
      },
      child: Obx(
        () => AnimatedContainer(
            height: 35,
            width: 110,
            duration: Duration(milliseconds: 300),
            decoration: BoxDecoration(
                color: controller.isFollow.value 
                    ? Colors.blue[700]
                    : Color(0xffffff),
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: controller.isFollow.value
                      ? Colors.transparent
                      : Colors.grey.shade700,
                )),
            child: Center(
                child: Text(
                    controller.isFollow.value ? 'Unfollow' : 'Follow',
                    style: TextStyle(
                        color: controller.isFollow.value
                            ? Colors.white
                            : Colors.white)))),
      ),
    );
  }
}
