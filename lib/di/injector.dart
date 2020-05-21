import 'package:injector/injector.dart';

inject() {
  final Injector injector = Injector.appInstance;

  injector.registerSingleton<String>((Injector injector) => "This is a Global Dependency",
      dependencyName: GLOBAL_STRING_DEP_NAME);
}

const String GLOBAL_STRING_DEP_NAME = "Global_String";