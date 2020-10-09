import 'package:flutter/material.dart';

class Event with ChangeNotifier {
  final String id;
  final DateTime date;
  final String imageUrl;
  final int age;
  final String eventType;

  Event(this.id, this.date, this.imageUrl, this.age, this.eventType);
}
