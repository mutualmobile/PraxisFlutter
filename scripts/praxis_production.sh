# Please make sure that you have your device selected in the Flutter Device Selection window before running this script

source ./core.sh
runCoreCommands

# Build production flavor and run it
echo "<---Building production flavor and running it--->"
flutter run --flavor production --target lib/main_production.dart
echo "<---Press any key to exit--->"
read -r