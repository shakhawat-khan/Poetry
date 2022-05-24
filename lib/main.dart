import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:overlay_support/overlay_support.dart';

import 'home/home.dart';

void main() {
  runApp(OverlaySupport(
    child: MaterialApp(
      title: 'route',
      initialRoute: '/',
      routes: {'/': (context) => Home()},
      theme: ThemeData(brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
    ),
  ));
}
