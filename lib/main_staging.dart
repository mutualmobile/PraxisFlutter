import 'package:praxis_flutter/application/platform_app.dart';
import 'package:praxis_flutter/bootstrap.dart';

const staging = "staging";

void main() async {
  bootstrap(() => const PraxisApp(), staging);
}
