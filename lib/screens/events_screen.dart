import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_23/providers/events.dart';

class EventsScreen extends StatefulWidget {
  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  void didChangeDependencies() {
    Provider.of<Events>(context).fetchandSetEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Container(
          child: Text('Print'),
        ),
      ),
    );
  }
}
