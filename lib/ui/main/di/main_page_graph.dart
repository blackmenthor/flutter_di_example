import 'package:flutter_di_example/di/injectable_widget.dart';
import 'package:flutter_di_example/environment_config.dart';
import 'package:flutter_di_example/ui/main/main_page.dart';
import 'package:injector/injector.dart';

class MainPageGraph extends Graph<MainPage> {

  MainPageGraph([Injector injector]) : super(injector);

  @override
  void inject(MainPage subject) {
    subject.localString = getDependency<String>(dependencyName: MainPageGraph.localStringTag);
  }

  // Inside this method, we register all the `MainPage` dependencies:
  @override
  void register() {
    registerDependency<String>(
            (Injector injector) {
              final environment = injector.getDependency<EnvironmentConfig>();
              return environment.environment == Environment.production
                  ? "This is an injected string in Production"
                  : "This is an injected String in Staging";
            },
            dependencyName: MainPageGraph.localStringTag
    );
  }

  static final String localStringTag = "localString";
}
