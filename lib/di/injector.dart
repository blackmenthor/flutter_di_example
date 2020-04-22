import 'package:flutter_di_example/environment_config.dart';
import 'package:injector/injector.dart';

inject(EnvironmentConfig config) {
  final Injector injector = Injector.appInstance;

  injector.registerSingleton<EnvironmentConfig>((_) => config);
}