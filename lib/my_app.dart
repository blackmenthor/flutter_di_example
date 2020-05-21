import 'package:flutter/material.dart';
import 'package:flutter_di_example/ui/main/main_page.dart';

// ignore: must_be_immutable
class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Simple DI App",
      home: Scaffold(
        body: MainPage(),
      ),
    );
  }
}
