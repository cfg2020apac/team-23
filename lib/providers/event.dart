import 'package:flutter/material.dart';

class Event with ChangeNotifier {
  final String id;
  final String title;
  final int ageMin;
  final int ageMax;
  final DateTime datePost; //TODO: convert back to datetime
  final DateTime dateDeadline;
  final DateTime dateEvent;
  final String tag;
  final String thumbUrl;
  final int users;
  final int usersMax;

  Event(this.id, this.title, this.ageMin, this.ageMax, this.datePost,
      this.dateDeadline, this.dateEvent, this.tag, this.thumbUrl,
      this.users, this.usersMax);
}
