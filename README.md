# food-court-weather

#Description
Weather App

# Repo structure(Architecture)
This repository makes use of stacked and it's architecture, which is an MVVM pattern.

# Running the Flutter app

    Install and setup Flutter https://flutter.dev/docs/get-started/install
    Clone the repo and run git checkout dev
    Run flutter pub get from the root of the project to fetch all dependencies
    Run flutter run to start the app

# Code Generation

The app uses code generation to generate boilerplate code. This is done using the build_runner package. To generate the code run flutter pub run build_runner build from the root of the project. This will generate the code and place it in the lib/core/app.dart file. This file is not to be edited manually.

json_serializable takes an annotated data class and creates a fromJson and toJson function used to automatically convert between a dart class and it's corresponding json equivalent.

freezed is used to create immutable data classes. It also creates a copyWith function that can be used to create a copy of the class with some of the properties changed.

# Logging

The app uses the logger package to log messages. The logger is configured already with stacked architecture and can be used by injecting the logger into the view model. The logger is located in the lib/core/app_logger.dart file.

The use of the logger is optional. It is recommended to use the logger for debugging purposes only. The logger should not be used to display messages to the user. For that, use the snackbar_service package.

# Commits Guidlines

All PRs must be according to the recommended naming convention. (https://www.conventionalcommits.org/en/v1.0.0/)
