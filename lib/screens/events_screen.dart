import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_23/providers/event.dart';
import 'package:team_23/providers/events.dart';
import 'package:team_23/widgets/event_tile.dart';

class EventsScreen extends StatefulWidget {
  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  @override
  Widget build(BuildContext context) {
    Provider.of<Events>(context).fetchandSetEvents();
    List<Event> events = Provider.of<Events>(context).events;
    return Container(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
          itemCount: events.length,
          itemBuilder: (ctx, index) => Center(
                child: EventTile(events[index]),
              )),
    );
  }
}
