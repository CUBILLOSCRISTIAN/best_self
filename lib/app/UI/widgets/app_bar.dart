import 'dart:ui';

import 'package:flutter/material.dart';

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
        IconButton.outlined(
          onPressed: () {},
          icon: const Icon(Icons.add),
        )
      ],
    );
  }