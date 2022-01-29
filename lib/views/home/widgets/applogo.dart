import 'package:flutter/material.dart';

Widget appLogo() {
  return Container(
    margin: EdgeInsets.only(
      top: 32.0,
      bottom: 32.0,
    ),
    child: Image(
      image: AssetImage('assets/images/logo.png'),
    ),
  );
}
