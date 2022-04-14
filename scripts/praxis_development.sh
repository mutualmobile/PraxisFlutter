# Please make sure that you have your device selected in the Flutter Device Selection window before running this script

source ./core.sh
runCoreCommands

# Build development flavor and run it
echo "<---Building development flavor and running it--->"
flutter run --flavor development --target lib/main_development.dart
echo "<---Press any key to exit--->"
read -r
