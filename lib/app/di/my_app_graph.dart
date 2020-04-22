import 'package:flutter_di_example/app/my_app.dart';
import 'package:flutter_di_example/di/injectable_widget.dart';
import 'package:flutter_di_example/environment_config.dart';
import 'package:injector/injector.dart';

class MyAppGraph extends Graph<MyApp> {

  MyAppGraph([Injector injector]) : super(injector);

  @override
  void inject(MyApp subject) {
    subject.config = getDependency<EnvironmentConfig>();
  }

  // Inside this method, we register all the `MyApp` dependencies:
  @override
  void register() {
  }
}
