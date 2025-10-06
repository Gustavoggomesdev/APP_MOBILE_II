import 'package:flutter/material.dart';
import '../components/buttons.dart';
import '../components/inputs.dart';
import '../components/dropdowns.dart';
import '../components/checkboxes.dart';
import '../components/radios.dart';
import '../components/toggles.dart';
import '../theme/app_theme.dart';

class SampleComponentsPage extends StatefulWidget {
  const SampleComponentsPage({super.key});

  @override
  State<SampleComponentsPage> createState() => _SampleComponentsPageState();
}

class _SampleComponentsPageState extends State<SampleComponentsPage> {
  final TextEditingController textController = TextEditingController();
  String? errorText;

  String? dropdownValue;
  bool checkboxValue = false;
  int radioValue = 0;
  bool toggleValue = false;

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sample Components')),
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Buttons
            Text('Buttons', style: AppTypography.h2),
            const SizedBox(height: 8),
            AppButtons.primaryFilled(text: 'Primary Filled', onPressed: () {}),
            const SizedBox(height: 8),
            AppButtons.primaryOutlined(text: 'Primary Outlined', onPressed: () {}),
            const SizedBox(height: 8),
            AppButtons.secondaryFilled(text: 'Secondary Filled', onPressed: () {}),
            const SizedBox(height: 8),
            AppButtons.secondaryOutlined(text: 'Secondary Outlined', onPressed: () {}),

            const SizedBox(height: 20),

            // Inputs
            Text('Inputs', style: AppTypography.h2),
            const SizedBox(height: 8),
            AppInputs.textField(
              controller: textController,
              label: 'Nome',
              hint: 'Digite seu nome',
              errorText: errorText,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: AppButtons.primaryFilled(
                    text: 'Validar',
                    onPressed: () {
                      setState(() {
                        errorText = textController.text.isEmpty ? 'Campo obrigatório' : null;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: AppButtons.primaryOutlined(
                    text: 'Limpar',
                    onPressed: () {
                      setState(() {
                        textController.clear();
                        errorText = null;
                      });
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Dropdown
            Text('Dropdown', style: AppTypography.h2),
            const SizedBox(height: 8),
            AppDropdown<String>(
              value: dropdownValue,
              items: const [
                DropdownMenuItem(value: 'one', child: Text('Um')),
                DropdownMenuItem(value: 'two', child: Text('Dois')),
                DropdownMenuItem(value: 'three', child: Text('Três')),
              ],
              onChanged: (v) => setState(() => dropdownValue = v),
              label: 'Escolha uma opção',
            ),

            const SizedBox(height: 20),

            // Checkbox, Radio, Toggle
            Text('Selections', style: AppTypography.h2),
            const SizedBox(height: 8),
            // Checkbox
            AppCheckbox(
              value: checkboxValue,
              onChanged: (v) => setState(() => checkboxValue = v ?? false),
              label: 'Aceito os termos',
            ),
            const SizedBox(height: 12),

            // Radio buttons
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
            const SizedBox(height: 12),

            // Toggle
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
