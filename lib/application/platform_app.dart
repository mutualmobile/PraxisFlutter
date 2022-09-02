import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:praxis_flutter/presentation/core/widgets/abstract_plaform_widget.dart';
import 'package:praxis_flutter/routing/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:praxis_flutter/l10n/l10n.dart';

class PraxisApp extends AbstractPlatformWidget<CupertinoApp, MaterialApp> {
  /// Platform dependent app widget (CupertinoApp for iOS, MaterialApp for android)
  final String title;

  const PraxisApp({Key? key, this.title = 'Praxis'}) : super(key: key);

  @override
  CupertinoApp buildCupertino(BuildContext context) {
    return CupertinoApp.router(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: const CupertinoThemeData(),
      routeInformationParser: praxisRoutes.routeInformationParser,
      routerDelegate: praxisRoutes.routerDelegate,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }

  @override
  MaterialApp buildMaterial(BuildContext context) {
    var lightTheme = FlexColorScheme.light(scheme: FlexScheme.blueWhale).toTheme;
    var darkTheme = FlexColorScheme.dark(scheme: FlexScheme.blueWhale).toTheme;
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      title: title,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      routeInformationParser: praxisRoutes.routeInformationParser,
      routerDelegate: praxisRoutes.routerDelegate,
    );
  }
}
