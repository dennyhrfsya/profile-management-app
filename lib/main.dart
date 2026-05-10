import 'package:flutter/material.dart';
import 'package:profile_management_app/presentation/auth/pages/onboarding_page.dart'; // Import file baru

void main() {
  runApp(const ProfileManagementApp());
}

class ProfileManagementApp extends StatelessWidget {
  const ProfileManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const OnboardingPage(),
    );
  }
}
