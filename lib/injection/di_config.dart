import 'package:injectable/injectable.dart';
import 'package:praxis_data/injection/data_di_config.dart';
import 'package:praxis_flutter/injection/di_config.config.dart';

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
void configureAppDependencies() => $initGetIt(getIt);