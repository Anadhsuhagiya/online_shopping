import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/Category.dart';
import 'package:online_shopping/Registration.dart';
import 'package:online_shopping/cart.dart';
import 'package:online_shopping/customerService.dart';
import 'package:online_shopping/login.dart';
import 'package:online_shopping/search.dart';
import 'package:online_shopping/sell.dart';
import 'package:online_shopping/wishlist.dart';

import 'Home.dart';
import 'forgot.dart';

void main() {
  runApp(GetMaterialApp(
    scrollBehavior: MyCustomScrollBehavior(),
    debugShowCheckedModeBanner: false,
    home: login(),
  ));
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
