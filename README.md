# Praxis Flutter Playground

Minimal Flutter project targeting the following platforms

## Platforms

* Android ✅ DONE
* iOS ✅ DONE
* Web ✅ DONE


### Screenshots

<img src="art/art2.png" alt="drawing" style="width:200px;"/>

<img src="art/art1.png" alt="drawing" style="width:200px;"/>

<img src="art/art3.png" alt="drawing" style="width:200px;"/>

<img src="art/art4.png" alt="drawing" style="width:200px;"/>

## Getting Started 🚀

This project contains 3 flavors:

- development
- staging
- production

For your convenience, a single script has been written inside the 'scripts' package (buildPraxisFlutter.sh).

To run it, simply use the following 2 commands :
1. `cd scripts`
2. On Windows:
`buildPraxisFlutter.sh`
On Mac/Linux:
`bash buildPraxisFlutter.sh`
and Press Enter/Return

Also, please make sure that you have your device selected in the Flutter Device Selection window before running the script(s).

```sh
To generate code for injectable

```sh
$ flutter packages pub run build_runner build --delete-conflicting-outputs

---

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart

---

## Running Tests 🧪

To run all unit and widget tests use the following command:

```sh
$ flutter test --coverage --test-randomize-ordering-seed random
```

To view the generated coverage report you can use [lcov](https://github.com/linux-test-project/lcov).

```sh
# Generate Coverage Report
$ genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
$ open coverage/index.html
```

---

## Working with Translations 🌐

This project relies on [flutter_localizations][flutter_localizations_link] and follows the [official internationalization guide for Flutter][internationalization_link].

### Adding Strings

1. To add a new localizable string, open the `app_en.arb` file at `lib/l10n/arb/app_en.arb`.

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

2. Then add a new key/value and description

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    },
    "helloWorld": "Hello World",
    "@helloWorld": {
        "description": "Hello World Text"
    }
}
```

3. Run the command to update translation

```sh
# Generate Translations.
$ flutter gen-l10n --template-arb-file=arb/app_en.arb
```

4. Use the new string after running 

```dart
import 'package:flutter_praxis/l10n/l10n.dart';

@override
Widget build(BuildContext context) {
  final l10n = context.l10n;
  return Text(l10n.helloWorld);
}
```

### Adding Supported Locales

Update the `CFBundleLocalizations` array in the `Info.plist` at `ios/Runner/Info.plist` to include the new locale.

```xml
    ...

    <key>CFBundleLocalizations</key>
	<array>
		<string>en</string>
		<string>es</string>
	</array>

    ...
```

### Adding Translations

1. For each supported locale, add a new ARB file in `lib/l10n/arb`.

```
├── l10n
│   ├── arb
│   │   ├── app_en.arb
│   │   └── app_es.arb
```

2. Add the translated strings to each `.arb` file:

`app_en.arb`

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

`app_es.arb`

```arb
{
    "@@locale": "es",
    "counterAppBarTitle": "Contador",
    "@counterAppBarTitle": {
        "description": "Texto mostrado en la AppBar de la página del contador"
    }
}
```

[coverage_badge]: coverage_badge.svg
[flutter_localizations_link]: https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html
[internationalization_link]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization


