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
  Future<List<Event>> events;
  Future<void> didChangeDependencies() {
    events = Provider.of<Events>(context).fetchandSetEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: RefreshIndicator (
            child: FutureBuilder<List<Event>>(
              future: events,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return EventTile(event: snapshot.data[index]);
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return CircularProgressIndicator();
              },
            ),
            onRefresh: didChangeDependencies,
          ),
        )
    );
  }
}