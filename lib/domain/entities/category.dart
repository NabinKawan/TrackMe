import 'package:flutter/material.dart';
import 'package:track_me/routes.dart';

class Category {
  final Color color;
  final String name;
  final Routes route;

  const Category({
    required this.name,
    required this.color,
    required this.route,
  });
}
