import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AppInputs {
  static Widget textField({
    required TextEditingController controller,
    String? label,
    String? hint,
    String? errorText,
  }) {
    return TextField(
      controller: controller,
      style: AppTypography.para,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        errorText: errorText,
        errorStyle: AppTypography.para.copyWith(color: AppColors.error, fontWeight: FontWeight.w700),
        filled: true,
        fillColor: const Color(0xFFC4CDD4),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.text),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFC4CDD4)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.primary),
        ),
      ),
    );
  }
}
