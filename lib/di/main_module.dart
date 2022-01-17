import 'package:praxis_flutter/di/controller_module.dart';
import 'package:praxis_flutter/di/mapper_module.dart';
import 'package:praxis_flutter/di/repository_module.dart';

void setupDI() {
  setupMappers();
  setupRepositories();
  setupControllers();
}