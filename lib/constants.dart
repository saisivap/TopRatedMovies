import 'package:flutter/material.dart';

List<BoxShadow> lightmodeShadow = [
  BoxShadow(
      offset: Offset(15, 15),
      color: Colors.blueGrey.shade300,
      spreadRadius: -5,
      blurRadius: 10),
  BoxShadow(
      offset: Offset(-5, -5),
      color: Colors.white,
      spreadRadius: -5,
      blurRadius: 10)
];
List<BoxShadow> darkmodeShadow = [
  BoxShadow(
      offset: Offset(15, 15),
      color: Colors.black.withOpacity(0.4),
      spreadRadius: -5,
      blurRadius: 10),
  BoxShadow(
      offset: Offset(-5, -5),
      color: Colors.black.withOpacity(0.2),
      spreadRadius: -5,
      blurRadius: 10)
];
Color whiteShadow = Color(0XFFFFFFFF).withOpacity(0.1);
Color greyShadow = Color(0XFF526E8C).withOpacity(0.2);
List<BoxShadow> drawerDarkModeShadow = [
  BoxShadow(
      offset: Offset(15, 15),
      // color: Colors.blueGrey.withOpacity(0.2),
      color: Colors.black.withOpacity(0.4),
      blurRadius: 10,
      spreadRadius: -5),
  BoxShadow(
      offset: Offset(-15, -15),
      // color: Colors.white.withOpacity(0.9),
      color: Colors.grey.shade400.withOpacity(0.1),
      blurRadius: 10,
      spreadRadius: -5)
];

List<BoxShadow> drawerLightModeshadow = [
  BoxShadow(
      offset: Offset(15, 15),
      // color: Colors.blueGrey.withOpacity(0.2),
      color: greyShadow,
      blurRadius: 10,
      spreadRadius: -5),
  BoxShadow(
      offset: Offset(-10, -10),
      // color: Colors.white.withOpacity(0.9),
      color: whiteShadow,
      blurRadius: 10,
      spreadRadius: -5)
];
