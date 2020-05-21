import 'dart:async';

import 'package:flutter_di_example/app/my_app.dart';
import 'package:flutter_di_example/di/injector.dart' as Injector;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Injector.inject();

  // The `runZoned` captures errors and allows us to report them into our BE infrastructure
  // Taken from here: https://github.com/flutter/crashy/blob/master/lib/main.dart#L107
  runZoned<Future<Null>>(() async {
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    runApp(MyApp());
  });
}