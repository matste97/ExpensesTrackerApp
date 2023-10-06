import 'package:flutter/material.dart';
import 'package:expensestrackerapp/widgets/expenses.dart';

// Define a ColorScheme for the light theme with a primary color.
var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

// Define a ColorScheme for the dark theme with a primary color.
var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 99, 125),
);

// The main function is the entry point of the Flutter app.
void main() {
  // Run the app using the MaterialApp widget.
  runApp(
    MaterialApp(
      // Define the dark theme configuration.
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true, // Enable Material 3 design.
        colorScheme: kDarkColorScheme, // Set the color scheme.
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
            foregroundColor: kDarkColorScheme.onPrimaryContainer,
          ),
        ),
      ),
      // Define the light theme configuration.
      theme: ThemeData().copyWith(
        useMaterial3: true, // Enable Material 3 design.
        colorScheme: kColorScheme, // Set the color scheme.
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: kColorScheme.onSecondaryContainer,
                fontSize: 16,
              ),
            ),
      ),
      // Set the initial theme mode (ThemeMode.system is the default).
      // themeMode: ThemeMode.system,
      // Define the home screen widget, which is the 'Expenses' widget.
      home: const Expenses(),
    ),
  );
}
