# Please make sure that you have your device selected in the Flutter Device Selection window before running this script

# Go to root dir from the current scripts dir
echo "<---Going to root directory--->"
cd ..

# Use pub get to fix pubspec.lock error
flutter pub get

# Generate config files for the presentation layer
echo "<---Generating config files for the presentation layer--->"
flutter packages pub run build_runner build --delete-conflicting-outputs

# Go to data layer (package)
echo "<---Going to data layer--->"
cd praxis_data || return

# Use pub get to fix pubspec.lock error
flutter pub get

# Generate config files for the data layer
echo "<---Generating config files for the data layer--->"
flutter packages pub run build_runner build --delete-conflicting-outputs

#Go back to root dir
echo "<---Going back to root dir--->"
cd ..

# Generate translation files
echo "<---Generating translation files--->"
flutter gen-l10n --template-arb-file=arb/app_en.arb

# Build staging flavor and run it
echo "<---Building staging flavor and running it--->"
flutter run --flavor staging --target lib/main_staging.dart
echo "<---Press any key to exit--->"
read -r