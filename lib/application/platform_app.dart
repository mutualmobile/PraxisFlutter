import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:praxis_flutter/presentation/core/app_localizations.dart';
import 'package:praxis_flutter/presentation/core/widgets/abstract_plaform_widget.dart';
import 'package:praxis_flutter/routing/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class PraxisApp extends AbstractPlatformWidget<CupertinoApp, MaterialApp> {
  /// Platform dependent app widget (CupertinoApp for iOS, MaterialApp for android)
  final String title;

  const PraxisApp({Key? key, this.title = 'Praxis'}) : super(key: key);

  @override
  CupertinoApp buildCupertino(BuildContext context) {
    return CupertinoApp.router(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: const CupertinoThemeData(brightness: Brightness.dark),
      routeInformationParser: praxisRoutes.routeInformationParser,
      routerDelegate: praxisRoutes.routerDelegate,
      supportedLocales: const [
        Locale('en', 'US'),
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        //* Check if the device current locale is supported
        for (final supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode &&
              supportedLocale.countryCode == locale?.countryCode) {
            return supportedLocale;
          }
        }
        //* If the device current local isn't supported, use the first one
        //* from the list
        return supportedLocales.first;
      },
    );
  }

  @override
  MaterialApp buildMaterial(BuildContext context) {
    var lightTheme = FlexColorScheme.light(scheme: FlexScheme.amber).toTheme;
    var darkTheme = FlexColorScheme.dark(scheme: FlexScheme.amber).toTheme;
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      supportedLocales: const [
        Locale('en', 'US'),
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        //* Check if the device current locale is supported
        for (final supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode &&
              supportedLocale.countryCode == locale?.countryCode) {
            return supportedLocale;
          }
        }
        //* If the device current local isn't supported, use the first one
        //* from the list
        return supportedLocales.first;
      },
      title: title,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      routeInformationParser: praxisRoutes.routeInformationParser,
      routerDelegate: praxisRoutes.routerDelegate,
    );
  }
}
