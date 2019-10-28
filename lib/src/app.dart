import 'package:coffee_talk_ibp/src/views/fav.dart';
import 'package:coffee_talk_ibp/src/views/home.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => MyHomePage(title: 'Coffee Talk i-BP'),
        '/favorites': (context) => FavPage()
      },
    );
  }
}
