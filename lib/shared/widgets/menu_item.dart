import 'package:flutter/material.dart';

class MenuItem {
  final String id;
  final IconData icon;
  final String link;
  final String labelText;
  final VoidCallback? onClick;

  MenuItem({
    required this.id,
    required this.icon,
    required this.link,
    required this.labelText,
    this.onClick ,
  });
}
