import 'package:flutter/material.dart';
import 'package:flutter_di_example/app/di/my_app_graph.dart';
import 'package:flutter_di_example/di/injectable_widget.dart';
import 'package:flutter_di_example/environment_config.dart';
import 'package:flutter_di_example/ui/main/main_page.dart';

// ignore: must_be_immutable
class MyApp extends StatefulWidget with InjectableWidget {
  final MyAppGraph _graph;

  //injected
  EnvironmentConfig config;

  @override
  MyAppGraph graph() => _graph;

  MyApp([graph]) : this._graph = graph ?? MyAppGraph() {
    setup();
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: widget.config.appName,
      home: Scaffold(
        body: MainPage(
          appName: widget.config.appName,
        ),
      ),
    );
  }
}
