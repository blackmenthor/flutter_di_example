import 'package:flutter/material.dart';
import 'package:flutter_di_example/di/injectable_widget.dart';
import 'package:flutter_di_example/ui/main/di/main_page_graph.dart';

// ignore: must_be_immutable
class MainPage extends StatelessWidget with InjectableWidget {
  final MainPageGraph _graph;
  final String appName;

  MainPage({
    @required
    this.appName,
    MainPageGraph graph
  }) : this._graph = graph ?? MainPageGraph() {
    setup();
  }

  //injected
  String localString;

  @override
  MainPageGraph graph() => _graph;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            appName
        ),
      ),
      body: Center(
        child: Text(
          localString
        ),
      ),
    );
  }
}
