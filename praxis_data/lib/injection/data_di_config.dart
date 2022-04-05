import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'data_di_config.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initDataGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
void configureDataDependencies() => $initDataGetIt(getIt);