import 'dart:async';
import 'package:flutter/material.dart';
import 'package:profile_management_app/presentation/auth/pages/login_page.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  void initState() {
    super.initState();

    // Timer otomatis selama 3 detik
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF193441),
      body: SafeArea(
        child: Padding(
          // Padding Horizontal: 24, Vertical: 10
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
          child: Center(
            // Align Center
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Align Center vertikal
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Align Center horizontal
              children: [
                // Tempat Logo (Gunakan Placeholder jika file belum ada)
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    // Agar gambar tidak keluar dari radius kotak
                    borderRadius: BorderRadius.circular(20),
                    child: Padding(
                      padding: const EdgeInsets.all(
                        12.0,
                      ), // Beri sedikit jarak agar logo tidak mepet ke pinggir kotak
                      child: Image.asset(
                        'assets/app_logo.png',
                        fit: BoxFit
                            .contain, // Memastikan logo tetap proporsional di dalam kotak
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
