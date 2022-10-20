# Create an array of all the available flavours
declare -a praxisFlavours=(development staging production)

# Size of array
praxisFlavoursLength=${#praxisFlavours[@]}

# Ask the user to select a flavour first
echo "Select one of the flavours to build 🔥:"
select flavour in "${praxisFlavours[@]}"; do
  if [ "$REPLY" -gt "$praxisFlavoursLength" ] || [ "$REPLY" -lt 1 ]; then
    echo "<---Please select a valid option (1-$praxisFlavoursLength)--->"
  else
    echo "<---'$flavour' flavour selected for building PraxisFlutter ✅--->"
    break
  fi
done

# Go to root dir from the current scripts dir
echo "<---Going to root directory--->"
cd ..

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

# Use pub get to fix pubspec.lock error
flutter pub get

# Generate config files for the presentation layer
echo "<---Generating config files for the presentation layer--->"
flutter packages pub run build_runner build --delete-conflicting-outputs

# Generate translation files
echo "<---Generating translation files--->"
flutter gen-l10n --template-arb-file=arb/app_en.arb

# Build user-selected flavor and run it
echo "<---Building $flavour flavor and running it--->"
flutter run --flavor "$flavour" --target lib/main_"$flavour".dart
echo "<---Press any key to exit--->"
read -r
