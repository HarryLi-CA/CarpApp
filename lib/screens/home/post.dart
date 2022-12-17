import 'package:flutter/material.dart';

class Post {
  final String name;
  final String username;
  final String destination;
  final String driverorpass;
  final String capacity;
  final String description;

  //bool expand;

  Post(
    this.name,
    this.username,
    this.destination,
    this.driverorpass,
    this.capacity,
    this.description,
  );

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(json['name'], json['username'], json['destination'],
        json['driverorpass'], json['capacity'], json['description']);
  }
}
