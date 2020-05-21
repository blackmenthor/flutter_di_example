import 'package:flutter_di_example/di/injectable_widget.dart';
import 'package:flutter_di_example/di/injector.dart';
import 'package:flutter_di_example/ui/main/main_page.dart';
import 'package:injector/injector.dart';

class MainPageGraph extends Graph<MainPage> {

  MainPageGraph([Injector injector]) : super(injector);

  @override
  void inject(MainPage subject) {
    subject.globalString = getDependency<String>(dependencyName: GLOBAL_STRING_DEP_NAME);
    subject.localString = getDependency<String>(dependencyName: MainPageGraph.localStringTag);
  }

  // Inside this method, we register all the `MainPage` dependencies:
  @override
  void register() {
    registerDependency<String>(
            (Injector injector) {
              return "This is an injected Local Dependencies";
            },
            dependencyName: MainPageGraph.localStringTag
    );
  }

  static final String localStringTag = "localString";
}
