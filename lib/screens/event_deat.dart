import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:team_23/providers/event.dart';
import 'package:team_23/providers/eventDeats.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class EventDeat extends StatelessWidget {
  final Event event;
  Future<eventDeats> deats;
  static const double pad = 10.0;

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
                YoutubePlayerController _controller = YoutubePlayerController(
                  initialVideoId: snapshot.data.videoUrl,
                  flags: YoutubePlayerFlags(
                    autoPlay: true,
                    mute: true,
                  ),
                );
                //if YouTube doesn't work on IOS see setup in https://pub.dev/packages/flutter_youtube

                return ListView(
                  padding: const EdgeInsets.all(12),
                  children: <Widget>[
                    Container(
                        margin: const EdgeInsets.all(pad),
                        child: Image.network(event.thumbUrl)),
                    Container(
                        margin: const EdgeInsets.all(pad),
                        child: YoutubePlayer(controller: _controller)),
                    Container(
                        margin: const EdgeInsets.all(pad),
                        child: Text("For ages " + event.ageMin.toString() + " - "  + event.ageMax.toString())),
                    Container(
                        margin: const EdgeInsets.all(pad),
                        child: Text("Category: " + event.tag)),
                    Container(
                        margin: const EdgeInsets.all(pad),
                        child: Text("Date: " + DateFormat('dd/MM kk:mm').format(event.dateEvent))),
                    Container(
                        margin: const EdgeInsets.all(pad),
                        child: Text("Sign up deadline: " + DateFormat('dd/MM kk:mm').format(event.dateDeadline))),
                    Container(
                        margin: const EdgeInsets.all(pad),
                        child: Linkify (
                            onOpen: (link) async {
                              if (await canLaunch(link.url)) {
                                await launch(link.url);
                              } else {
                                throw 'Could not launch $link';
                              }
                            },
                          text: snapshot.data.desc
                        ))
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