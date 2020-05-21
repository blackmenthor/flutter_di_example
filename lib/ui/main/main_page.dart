import 'package:flutter/material.dart';
import 'package:flutter_di_example/di/injectable_widget.dart';
import 'package:flutter_di_example/ui/main/di/main_page_graph.dart';

// ignore: must_be_immutable
class MainPage extends StatelessWidget with InjectableWidget {
  final MainPageGraph _graph;

  MainPage({
    MainPageGraph graph
  }) : this._graph = graph ?? MainPageGraph() {
    setup();
  }

  //injected
  String globalString;

  //injected
  String localString;

  @override
  MainPageGraph graph() => _graph;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Simple DI App"
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
                globalString,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.red
                ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Center(
              child: Text(
                localString,
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.blueAccent
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
