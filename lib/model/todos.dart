import 'package:flutter/cupertino.dart';

class Todo {
  String title;
  String id;
  String description;
  bool isCompleted;

  Todo({
    required this.title,
    this.description = '',
    this.id = '',
    this.isCompleted = false,
  });
}
