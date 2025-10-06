import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class TypographyPage extends StatelessWidget {
  const TypographyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Typography')),
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('H1 - ExtraBold 32', style: AppTypography.h1),
            Text('H2 - Bold 24', style: AppTypography.h2),
            Text('H3 - Semibold 18', style: AppTypography.h3),
            Text('Paragraph - Semibold 14', style: AppTypography.para),
            Text('Small - Semibold 14', style: AppTypography.small),
          ],
        ),
      ),
    );
  }
}
