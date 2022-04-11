import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';
import 'package:praxis_flutter/bloc/app_bloc_observer.dart';
import 'package:praxis_flutter/firebase_options.dart';
import 'package:praxis_flutter/infrastructure/notifications/firebase_messaging.dart';
import 'package:praxis_flutter/injection.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder, String env) async {
  flutterLogError();

  WidgetsFlutterBinding.ensureInitialized();

  GoRouter.setUrlPathStrategy(UrlPathStrategy.path);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  configureAppInjection(env);

  await runZonedGuarded(
    () async {
      await BlocOverrides.runZoned(
        () async => runApp(await builder()),
        blocObserver: AppBlocObserver(),
      );
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );

  GetIt.instance.get<PraxisFirebaseMessaging>().setupMessaging();
}

void flutterLogError() {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Logger.root.level = Level.INFO; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
}
