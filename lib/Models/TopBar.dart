import 'package:flutter/material.dart';

AppBar topBar(String title, {double prefSize=5}) {
  return AppBar(
    title: new Text(
      title,
      style: TextStyle(
        fontSize: 25,
      ),
    ),
    backgroundColor: Colors.grey[900],
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(10),
      ),
    ),
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(prefSize),
      child: Container(),
    ),
  );
}
