import 'package:flutter/material.dart';
import '../components/buttons.dart';
import '../theme/app_theme.dart';
import 'package:flutter/material.dart';

class ButtonsPage extends StatelessWidget {
  const ButtonsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buttons')),
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- SEÇÃO BOTÕES EXISTENTES ---
            Text('Primary / Secondary', style: AppTypography.h2),
            const SizedBox(height: 8),
            AppButtons.primaryFilled(text: 'Primary Filled', onPressed: () {}),
            const SizedBox(height: 8),
            AppButtons.primaryOutlined(text: 'Primary Outlined', onPressed: () {}),
            const SizedBox(height: 8),
            AppButtons.secondaryFilled(text: 'Secondary Filled', onPressed: () {}),
            const SizedBox(height: 8),
            AppButtons.secondaryOutlined(text: 'Secondary Outlined', onPressed: () {}),

            const SizedBox(height: 20),

            // --- SEÇÃO NOVOS BOTÕES ---
            Text('Disabled', style: AppTypography.h2),
            const SizedBox(height: 8),
            AppButtons.primaryDisabled(text: 'Primary Disabled'),
            const SizedBox(height: 8),
            AppButtons.secondaryDisabled(text: 'Secondary Disabled'),

            const SizedBox(height: 20),

            Text('With Icon', style: AppTypography.h2),
            const SizedBox(height: 8),
            AppButtons.primaryWithIcon(
              text: 'Primary Icon',
              onPressed: () {},
              icon: Icons.arrow_forward,
            ),
            const SizedBox(height: 8),
            AppButtons.secondaryWithIcon(
              text: 'Secondary Icon',
              onPressed: () {},
              icon: Icons.arrow_forward,
            ),
          ],
        ),
      ),
    );
  }
}
