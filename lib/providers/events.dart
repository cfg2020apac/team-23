import 'package:flutter/material.dart';
import './event.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Events with ChangeNotifier {
  List<Event> _events = [];

  Future<void> fetchandSetEvents() async {
    var url = "https://team23blossom.firebaseio.com/eventFeed.json";
    final loadedEvents = await http.get(url);
    print(loadedEvents.body);
  }
}
