import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:praxis_flutter/application/widgets/abstract_plaform_widget.dart';
import 'package:praxis_flutter/routing/routes.dart';

class PraxisApp extends AbstractPlatformWidget<CupertinoApp, MaterialApp> {
  /// Platform dependent app widget (CupertinoApp for iOS, MaterialApp for android)
  const PraxisApp({
    Key? key,
  }) : super(key: key);

  static const String title = 'Praxis';

  @override
  CupertinoApp buildCupertino(BuildContext context) {
    return CupertinoApp.router(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: const CupertinoThemeData(brightness: Brightness.dark),
      routeInformationParser: praxisRoutes.routeInformationParser,
      routerDelegate: praxisRoutes.routerDelegate,
    );
  }

  @override
  MaterialApp buildMaterial(BuildContext context) {
    var lightTheme =
        FlexColorScheme.light(scheme: FlexScheme.blueWhale).toTheme;
    var darkTheme = FlexColorScheme.dark(scheme: FlexScheme.blueWhale).toTheme;
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: lightTheme.copyWith(
          textTheme: GoogleFonts.latoTextTheme(lightTheme.textTheme)),
      darkTheme: darkTheme.copyWith(
          textTheme: GoogleFonts.latoTextTheme(lightTheme.textTheme)),
      themeMode: ThemeMode.system,
      routeInformationParser: praxisRoutes.routeInformationParser,
      routerDelegate: praxisRoutes.routerDelegate,
    );
  }
}
