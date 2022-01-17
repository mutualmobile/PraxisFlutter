import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:praxis_flutter/application/platform_app.dart';
import 'package:praxis_flutter/di/main_module.dart';
import 'package:praxis_flutter/firebase_options.dart'; // not committed to git!

final locator = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoRouter.setUrlPathStrategy(UrlPathStrategy.path);
  setupFirebaseServices();
  setupDI();
  runApp(const PraxisApp());
}

void setupFirebaseServices() async {
  FirebaseApp firebaseApp = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final FirebaseFirestore firestore =
      FirebaseFirestore.instanceFor(app: firebaseApp);
}
