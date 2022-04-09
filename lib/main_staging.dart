import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:praxis_flutter/application/platform_app.dart';
import 'package:praxis_flutter/firebase_options.dart'; // not committed to git!
import 'package:praxis_flutter/infrastructure/notifications/firebase_messaging.dart';
import 'package:praxis_flutter/injection.dart';

const staging = "staging";

void main() async {
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  configureAppInjection(staging);

  GoRouter.setUrlPathStrategy(UrlPathStrategy.path);

  runApp(const PraxisApp());

  GetIt.instance.get<PraxisFirebaseMessaging>().setupMessaging();
}