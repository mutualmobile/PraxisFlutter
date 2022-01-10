import 'package:flutter/widgets.dart';
import 'package:praxis_flutter/application/widgets/platform_scaffold.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PraxisScaffold(body: Center(child: Text("Home")));
  }
}
