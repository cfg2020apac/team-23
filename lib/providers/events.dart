import 'package:flutter/material.dart';
import './event.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Events with ChangeNotifier {
  List<Event> _events = [];

  Future<void> fetchandSetEvents() async {
    var url = "https://team23blossom.firebaseio.com/events.json";
    final data = await http.get(url);
    print(data.body);

    final loadedEvents = json.decode(data.body) as Map<String, dynamic>;
    List<Event> temp = [];
    loadedEvents.forEach((eventId, eventData) {
      temp.add(Event(
        eventId,
        eventData['title'],
        eventData['ageMin'],
        eventData['ageMax'],
        new DateTime.fromMillisecondsSinceEpoch(eventData['datePost']),
        new DateTime.fromMillisecondsSinceEpoch(eventData['dateDeadline']),
        new DateTime.fromMillisecondsSinceEpoch(eventData['dateEvent']),
        eventData['tag'],
        eventData['thumbUrl'],
        eventData['users'],
        eventData['usersMax'],
      ));
    });
    _events = temp;
    notifyListeners();
  }

  List<Event> get events {
    return [... _events];
  }

  int getLength() {
    return _events.length;
  }
}
