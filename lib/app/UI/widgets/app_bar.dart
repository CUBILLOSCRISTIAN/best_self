import 'dart:ui';

import 'package:best_self/app/UI/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar appBarHome(Color color) {
    return AppBar(
      backgroundColor: color,
      leading: const Padding(
        padding: EdgeInsets.all(5.0),
        child: CircleAvatar(
          backgroundImage: NetworkImage(
              "https://avatars.githubusercontent.com/u/583231?v=4"),
        ),
      ),
      title: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hello,",
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
          Text(
            "John Doe",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
      centerTitle: false,
      actions: [
        Obx(() => Text(
              '${Get.find<UserController>().coinsEarned.value}',
              style: const TextStyle(fontSize: 20, color: Colors.white),
            )),
        
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.monetization_on, color: Colors.white),
        ),
      ],
    );
  }