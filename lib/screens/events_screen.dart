import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_23/providers/event.dart';
import 'package:team_23/providers/events.dart';
import 'package:team_23/screens/EventTile.dart';

class EventsScreen extends StatefulWidget {
  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  List<Event> events;
  // void didChangeDependencies() {
  //   Provider.of<Events>(context).fetchandSetEvents();
  //   events = Provider.of<Events>(context).events;
  // }

  @override
  Widget build(BuildContext context) {
    Provider.of<Events>(context).fetchandSetEvents();
    events = Provider.of<Events>(context).events;

    return Scaffold(
        body: Container(
            child: ListView.builder(
                itemCount: events.length,
                itemBuilder: (context, index) {
                  return EventTile(event: events[index]);
                },
              ))
        );
  }
}