import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:praxis_flutter/application/platform_app.dart';
import 'package:praxis_flutter/firebase_options.dart'; // not committed to git!
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  GoRouter.setUrlPathStrategy(UrlPathStrategy.path);
  initialization();
  runApp(const PraxisApp());
}


void initialization() async {
  // do initialization tasks here
  setupFirebaseServices();
  await Future.delayed(const Duration(seconds: 2));
  FlutterNativeSplash.remove();
}


void setupFirebaseServices() async {
  FirebaseApp firebaseApp = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final FirebaseFirestore firestore =
      FirebaseFirestore.instanceFor(app: firebaseApp);
}
