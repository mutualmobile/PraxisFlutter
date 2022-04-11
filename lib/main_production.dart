import 'package:injectable/injectable.dart';
import 'package:praxis_flutter/application/platform_app.dart';
import 'package:praxis_flutter/bootstrap.dart';

void main() async {
  bootstrap(() => const PraxisApp(),Environment.prod);
}