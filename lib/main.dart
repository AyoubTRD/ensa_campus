import 'package:ensa_campus/di/di.dart';
import 'package:ensa_campus/features/onboarding/presentation/pages/onboarding_steps_page.dart';
import 'package:ensa_campus/firebase_options.dart';
import 'package:ensa_campus/shared/auth/auth_splash_screen.dart';
import 'package:ensa_campus/shared/widgets/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Initialize supabase
  await Supabase.initialize(
    url: 'https://dxdpieypadwosxirxzna.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImR4ZHBpZXlwYWR3b3N4aXJ4em5hIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDc1ODg5NTMsImV4cCI6MjAyMzE2NDk1M30.dSluhwcuoHtlp63HSEXiYUW2x-IULxWLB2Bs2ngzD2M',
  );

  setupDI();
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: Colors.brown,
        textTheme: GoogleFonts.poppinsTextTheme(),
        inputDecorationTheme: InputDecorationTheme(
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
      ),
      home: AuthSplashScreen(),
    );
  }
}
