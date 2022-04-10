import 'package:get_it/get_it.dart';
import 'package:praxis_flutter/application/platform_app.dart';
import 'package:praxis_flutter/bootstrap.dart';
import 'package:praxis_flutter/infrastructure/notifications/firebase_messaging.dart';

const staging = "staging";

void main() async {
  bootstrap(() => const PraxisApp(), staging);

}
