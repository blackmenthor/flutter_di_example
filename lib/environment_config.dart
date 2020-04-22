import 'package:flutter/material.dart';

enum Environment {
  production,
  staging,
}

class EnvironmentConfig {
  const EnvironmentConfig({
    @required this.appName,
    @required this.environment,
    @required this.apiUrl,

  });

  final String appName;
  final Environment environment;
  final String apiUrl;

}