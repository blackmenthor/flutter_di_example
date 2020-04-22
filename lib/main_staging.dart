import 'dart:async';

import 'package:flutter_di_example/app/my_app.dart';
import 'package:flutter_di_example/di/injector.dart' as Injector;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_di_example/environment_config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  var config = EnvironmentConfig(
      environment: Environment.production,
      appName: "My App Staging",
      apiUrl: "https://mywebservice.staging.com/api/v1"
  );

  Injector.inject(config);

  // The `runZoned` captures errors and allows us to report them into our BE infrastructure
  // Taken from here: https://github.com/flutter/crashy/blob/master/lib/main.dart#L107
  runZoned<Future<Null>>(() async {
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    runApp(MyApp());
  });
}