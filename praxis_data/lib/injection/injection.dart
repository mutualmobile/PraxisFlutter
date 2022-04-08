import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:praxis_data/injection/injection.config.dart';

@InjectableInit(
  initializerName: r'$initDataGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
void configureDataInjection(String env) => $initDataGetIt(GetIt.instance, environment: env);
