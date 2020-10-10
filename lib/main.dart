import 'package:flutter/material.dart';
import 'package:team_23/screens/home_screen.dart';
import 'package:team_23/screens/wish_form.dart';
import 'package:team_23/screens/wishlist.dart';
import './screens/user_profile_screen.dart';
import './screens/events_screen.dart';
import 'package:provider/provider.dart';
import './providers/events.dart';
import 'screens/events_screen.dart';
import './providers/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Events()),
        ChangeNotifierProvider.value(value: (Users()))
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            textTheme:
                TextTheme(headline1: TextStyle(color: Color(0xff374ABE))),
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: HomeScreen()),
    );
  }
}
