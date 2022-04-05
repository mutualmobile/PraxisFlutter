import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:praxis_flutter/application/platform_app.dart';
import 'package:praxis_flutter/firebase_options.dart'; // not committed to git!
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:praxis_flutter/injection/di_config.dart';
import 'package:praxis_data/injection/data_di_config.dart';

void main() async {
  configureAppDependencies();
  configureDataDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  GoRouter.setUrlPathStrategy(UrlPathStrategy.path);
  setupFirebaseServices();
  runApp(const PraxisApp());
}

void setupFirebaseServices() async {
  FirebaseApp firebaseApp = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final FirebaseFirestore firestore =
      FirebaseFirestore.instanceFor(app: firebaseApp);
}
