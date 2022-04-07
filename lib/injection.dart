import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:praxis_flutter/injection.config.dart';

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
void configureAppInjection(String env) => $initGetIt(GetIt.instance, environment: env);