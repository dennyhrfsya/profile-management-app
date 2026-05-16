import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:profile_management_app/core/core.dart';

class AppTextField extends StatefulWidget {
  final String label;
  final String hintText;
  final String? prefixIconPath;
  final bool isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const AppTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.prefixIconPath,
    this.isPassword = false,
    this.controller,
    this.validator,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  // Variabel untuk mengontrol sembunyi/tampil teks
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    // Default: jika bukan field password, jangan sembunyikan teks
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label Input
        Text(
          widget.label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.textColor,
          ),
        ),
        const SizedBox(height: 8),

        // Text Field
        TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          obscureText: _obscureText,
          style: TextStyle(color: AppColors.textColor, fontSize: 14),
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(color: AppColors.textPlaceHolderColor),
            prefixIcon: widget.prefixIconPath != null
                ? Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(
                      widget.prefixIconPath!,
                      colorFilter: const ColorFilter.mode(
                        AppColors.iconColor,
                        BlendMode.srcIn,
                      ),
                      width: 24,
                      height: 24,
                      fit: BoxFit.contain,
                    ),
                  )
                : null,
            filled: true,
            // Suffix Icon (Kanan) - Untuk Toggle Password
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    icon: SvgPicture.asset(
                      _obscureText
                          ? AppAssets
                                .iconEyeHide // Icon mata tertutup dari Figma
                          : AppAssets
                                .iconEyeShow, // Icon mata terbuka dari Figma
                      colorFilter: const ColorFilter.mode(
                        AppColors.primary,
                        BlendMode.srcIn,
                      ),
                      height: 24,
                      width: 24,
                    ),
                  )
                : null,
            fillColor: AppColors.white,
            // Konfigurasi Border (Corner Radius 12 & Stroke Inside Primary)
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),

            // Gaya teks error
            errorStyle: const TextStyle(color: AppColors.red, fontSize: 12),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: AppColors.borderColor,
                width: 1,
              ),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: AppColors.borderColor,
                width: 2,
              ),
            ),

            // Border saat terjadi error (Merah Tipis)
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.red, width: 1),
            ),

            // Border saat error dan user sedang mengetik (Merah Tebal)
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.red, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}
