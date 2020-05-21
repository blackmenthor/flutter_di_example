import 'package:flutter/material.dart';
import 'package:flutter_di_example/di/injector.dart';
import 'package:flutter_di_example/ui/main/di/main_page_graph.dart';
import 'package:flutter_di_example/ui/main/main_page.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:injector/injector.dart';

void main() {
  const String GLOBAL_DEPENDENCY = "GLOBAL";
  const String LOCAL_DEPENDENCY = "LOCAL";

  testWidgets('Test dependencies injected properly', (WidgetTester tester) async {

    final testInjector = Injector();
    testInjector.registerDependency<String>((_) => GLOBAL_DEPENDENCY, dependencyName: GLOBAL_STRING_DEP_NAME);
    testInjector.registerDependency<String>((_) => LOCAL_DEPENDENCY, dependencyName: MainPageGraph.localStringTag);

    final testGraph = MainPageGraph(testInjector);

    await tester.pumpWidget(
        MaterialApp(
            home: MainPage(graph: testGraph,)
        )
    );

    expect(find.text(GLOBAL_DEPENDENCY), findsOneWidget);
    expect(find.text(LOCAL_DEPENDENCY), findsOneWidget);

  });

}

