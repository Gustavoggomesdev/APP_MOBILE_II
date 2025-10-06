import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'buttons_page.dart';
import 'tabbar_page.dart';
import 'inputs_page.dart';
import 'selection_page.dart';
import 'typography_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de seções atualizada
    final sections = [
      {'title': 'Buttons', 'page': const ButtonsPage()},
      {'title': 'Tab Bar', 'page': const TabBarPage()},
      {'title': 'Inputs & Dropdown', 'page': const InputsPage()}, // <- alterado
      {'title': 'Selections', 'page': const SelectionPage()},
      {'title': 'Typography', 'page': const TypographyPage()},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Design System Sample')),
      backgroundColor: AppColors.background,
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: sections.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final section = sections[index];
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => section['page'] as Widget),
              );
            },
            child: Text(
              section['title'] as String,
              style: AppTypography.para.copyWith(color: AppColors.background),
            ),
          );
        },
      ),
    );
  }
}
