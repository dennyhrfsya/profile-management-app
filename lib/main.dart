import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profile_management_app/presentation/auth/pages/onboarding_page.dart';

void main() {
  runApp(const ProfileManagementApp());
}

class ProfileManagementApp extends StatelessWidget {
  const ProfileManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
      ),
      debugShowCheckedModeBanner: false,
      home: const OnboardingPage(),
    );
  }
}
