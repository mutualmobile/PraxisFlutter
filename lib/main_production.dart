import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:praxis_flutter/application/platform_app.dart';
import 'package:praxis_flutter/bootstrap.dart';
import 'package:praxis_flutter/infrastructure/notifications/firebase_messaging.dart';

void main() async {
  bootstrap(() => const PraxisApp(),Environment.prod);
}