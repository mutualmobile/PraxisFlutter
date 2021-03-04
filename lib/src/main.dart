import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:clean_architecture/clean_architecture.dart';
import 'package:praxis/src/app/screens/splash/splash_page.dart';
import 'package:praxis/src/data/exceptions/APIException.dart';
import 'package:praxis/src/utils/praxis_router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final PraxisRouter praxisRouter;
  MyApp() : praxisRouter = PraxisRouter() {
    initLogger();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    CleanArchitecture.debugModeOn();
    return MaterialApp(
      title: 'Praxis',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashPage(),
      onGenerateRoute: praxisRouter.getRoute,
      navigatorObservers: [praxisRouter.routeObserver],
    );
  }

  void initLogger() {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      dynamic e = record.error;
      String m = e is APIException ? e.message : e.toString();
      print(
          '${record.loggerName}: ${record.level.name}: ${record.message} ${m != 'null' ? m : ''}');
    });
    Logger.root.info("Logger initialized.");
  }
}
