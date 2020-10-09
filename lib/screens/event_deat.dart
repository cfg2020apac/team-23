import 'package:flutter/material.dart';
import 'package:team_23/providers/event.dart';
import 'package:team_23/providers/eventDeats.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EventDeat extends StatelessWidget {
  final Event event;
  Future<eventDeats> deats;

  EventDeat({Key key, @required this.event}) : super(key: key);

  Future<eventDeats> fetchEventDeats() async {
    final response = await http.get(
        "https://team23blossom.firebaseio.com/eventDetails/" + event.id +
            ".json");

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return eventDeats.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    deats = fetchEventDeats();

    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Color(0xffffffff)),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(event.title),
          backgroundColor: Color(0xff67b0d9),
        ),
        body: Center(
          child: FutureBuilder<eventDeats>(
            future: deats,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView(
                  padding: const EdgeInsets.all(12),
                  children: <Widget>[
                    Text(snapshot.data.desc),
                    Text('Entry B'),

                  ],
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}