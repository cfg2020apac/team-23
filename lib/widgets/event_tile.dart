import 'package:flutter/material.dart';
import 'package:team_23/providers/event.dart';
import 'package:intl/intl.dart';

class EventTile extends StatelessWidget {
  final Event event;
  EventTile(this.event);

  @override
  Widget build(BuildContext context) {
    print('EventTile' + event.id);
    print(DateFormat('yyyy-MM-dd – kk:mm').format(event.dateEvent));
    print(event.dateEvent);
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: Image.network(event.thumbUrl),
          title: Text(event.title),
          subtitle: Text(DateFormat('dd/MM kk:mm').format(event.dateEvent)),
        ),
      ),
    );
  }
}
