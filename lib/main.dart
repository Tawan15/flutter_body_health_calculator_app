import 'package:flutter/material.dart';
import 'package:flutter_body_health_calculator_app/views/splash_screen_ui_.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(

    FlutterBodyHealthCalulatorApp()
  );
}

class FlutterBodyHealthCalulatorApp extends StatefulWidget {
  const FlutterBodyHealthCalulatorApp({super.key});

  @override
  State<FlutterBodyHealthCalulatorApp> createState() => _FlutterBodyHealthCalulatorAppState();
}

class _FlutterBodyHealthCalulatorAppState extends State<FlutterBodyHealthCalulatorApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenUi(),
      theme: ThemeData(
        textTheme: GoogleFonts.kanitTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}