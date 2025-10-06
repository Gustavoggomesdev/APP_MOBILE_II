import 'package:flutter/material.dart';
import '../components/checkboxes.dart';
import '../components/radios.dart';
import '../components/toggles.dart';
import '../theme/app_theme.dart';

class SelectionPage extends StatefulWidget {
  const SelectionPage({super.key});

  @override
  State<SelectionPage> createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  bool checkboxValue = false;
  int radioValue = 0;
  bool toggleValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Selections')),
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Checkbox', style: AppTypography.h3),
            AppCheckbox(
              value: checkboxValue,
              onChanged: (v) => setState(() => checkboxValue = v ?? false),
              label: 'Aceito os termos',
            ),
            const SizedBox(height: 20),
            Text('Radio', style: AppTypography.h3),
            Wrap(
              spacing: 16,
              children: [
                AppRadio<int>(
                  value: 0,
                  groupValue: radioValue,
                  onChanged: (v) => setState(() => radioValue = v ?? 0),
                  label: 'Opção A',
                ),
                AppRadio<int>(
                  value: 1,
                  groupValue: radioValue,
                  onChanged: (v) => setState(() => radioValue = v ?? 0),
                  label: 'Opção B',
                ),
                AppRadio<int>(
                  value: 2,
                  groupValue: radioValue,
                  onChanged: (v) => setState(() => radioValue = v ?? 0),
                  label: 'Opção C',
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text('Toggle', style: AppTypography.h3),
            AppToggle(
              value: toggleValue,
              onChanged: (v) => setState(() => toggleValue = v),
              label: 'Receber notificações',
            ),
          ],
        ),
      ),
    );
  }
}
