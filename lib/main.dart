import 'package:ensa_campus/features/onboarding/presentation/pages/onboarding_steps_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: Colors.brown,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: OnboardingStepsPageWidget(),
    );
  }
}
