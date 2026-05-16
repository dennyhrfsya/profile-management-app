class AppValidators {
  /// Fungsi utama untuk menggabungkan banyak validator
  static String? multiple(
    List<String? Function(String?)> validators,
    String? value,
  ) {
    for (var validator in validators) {
      final result = validator(value);
      if (result != null) return result;
    }
    return null;
  }

  /// Validasi tidak boleh kosong
  static String? validateEmpty(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName tidak boleh kosong';
    }
    return null;
  }

  /// Validasi format email
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) return null;
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Format email tidak valid';
    }
    return null;
  }

  /// Validasi panjang password
  static String? validatePassword(String? value, {int minLength = 6}) {
    if (value == null || value.trim().isEmpty) return null;
    if (value.length < minLength) {
      return 'Password minimal harus $minLength karakter';
    }
    return null;
  }
}
