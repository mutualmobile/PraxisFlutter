# Please make sure that you have your device selected in the Flutter Device Selection window before running this script

source ./core.sh
runCoreCommands

# Build staging flavor and run it
echo "<---Building staging flavor and running it--->"
flutter run --flavor staging --target lib/main_staging.dart
echo "<---Press any key to exit--->"
read -r