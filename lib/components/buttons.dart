import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AppButtons {
  static const double _buttonHeight = 48;

  // --- BOTÕES EXISTENTES ---

  static Widget primaryFilled({required String text, required VoidCallback onPressed}) {
    return SizedBox(
      height: _buttonHeight,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 16),
        ),
        child: Text(text, style: AppTypography.para.copyWith(color: AppColors.background)),
      ),
    );
  }

  static Widget primaryOutlined({required String text, required VoidCallback onPressed}) {
    return SizedBox(
      height: _buttonHeight,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppColors.primary),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 16),
        ),
        child: Text(text, style: AppTypography.para.copyWith(color: AppColors.primary)),
      ),
    );
  }

  static Widget secondaryFilled({required String text, required VoidCallback onPressed}) {
    return SizedBox(
      height: _buttonHeight,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.secondary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 16),
        ),
        child: Text(text, style: AppTypography.para.copyWith(color: AppColors.background)),
      ),
    );
  }

  static Widget secondaryOutlined({required String text, required VoidCallback onPressed}) {
    return SizedBox(
      height: _buttonHeight,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppColors.secondary),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 16),
        ),
        child: Text(text, style: AppTypography.para.copyWith(color: AppColors.secondary)),
      ),
    );
  }

  // --- NOVOS BOTÕES ---

  static Widget primaryDisabled({required String text}) {
    return SizedBox(
      height: _buttonHeight,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFE7F8FE), // azul claro
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 16),
        ),
        child: Text(text, style: AppTypography.para.copyWith(color: const Color(0xFFC4CDD4))),
      ),
    );
  }

  static Widget secondaryDisabled({required String text}) {
    return SizedBox(
      height: _buttonHeight,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFEF5E6), // amarelo claro
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 16),
        ),
        child: Text(text, style: AppTypography.para.copyWith(color: const Color(0xFFC4CDD4))),
      ),
    );
  }

  static Widget primaryWithIcon({required String text, required VoidCallback onPressed, required IconData icon}) {
    return SizedBox(
      height: _buttonHeight,
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, color: Colors.white),
        label: Text(text, style: AppTypography.para.copyWith(color: Colors.white)),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    );
  }

  static Widget secondaryWithIcon({required String text, required VoidCallback onPressed, required IconData icon}) {
    return SizedBox(
      height: _buttonHeight,
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, color: Colors.white),
        label: Text(text, style: AppTypography.para.copyWith(color: Colors.white)),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.secondary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    );
  }
}
