import 'package:flutter/material.dart';
import 'package:profile_management_app/core/core.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // 1. Tambahkan Form Key untuk validasi
  final _formKey = GlobalKey<FormState>();

  // 2. Tambahkan Controller untuk mengambil data input
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    // Jangan lupa dispose agar tidak memory leak
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          // Sesuaikan Padding: Horizontal 120, Vertical 24
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 120),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Field Email
                AppTextField(
                  controller: _emailController,
                  label: 'Email Address',
                  hintText: "Enter your email",
                  prefixIconPath: AppAssets.iconEmail,
                  validator: (value) => AppValidators.multiple([
                    (v) => AppValidators.validateEmpty(v, "Email"),
                    (v) => AppValidators.validateEmail(v),
                  ], value),
                ),
                const SizedBox(height: 8),

                // Field Password
                AppTextField(
                  controller: _passwordController,
                  label: 'Password',
                  hintText: "Enter your password",
                  isPassword: true,
                  prefixIconPath: AppAssets.iconLock,
                  validator: (value) => AppValidators.multiple([
                    (v) => AppValidators.validateEmpty(v, "Password"),
                    (v) => AppValidators.validatePassword(
                      v,
                      minLength: 8,
                    ), // Anda bisa atur panjangnya di sini
                  ], value),
                ),
                const SizedBox(height: 32),

                // Tombol Login
                PrimaryButton(
                  label: "Login",
                  onPressed: () {
                    // 4. Eksekusi validasi saat tombol ditekan
                    if (_formKey.currentState!.validate()) {
                      // Jika valid, di sini kamu bisa lanjut ke integrasi API Laravel
                      print("Email: ${_emailController.text}");
                      print("Password: ${_passwordController.text}");

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Login...')),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
