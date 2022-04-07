import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:praxis_flutter/application/platform_app.dart';
import 'package:praxis_flutter/firebase_options.dart'; // not committed to git!
import 'package:praxis_flutter/infrastructure/notifications/firebase_messaging.dart';
import 'package:praxis_data/injection/data_di_config.dart';
import 'package:praxis_flutter/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  configureDataInjection(Environment.prod);
  configureAppInjection(Environment.prod);

  GoRouter.setUrlPathStrategy(UrlPathStrategy.path);

  getIt.get<PraxisFirebaseMessaging>().setupMessaging();
  runApp(const PraxisApp());
}