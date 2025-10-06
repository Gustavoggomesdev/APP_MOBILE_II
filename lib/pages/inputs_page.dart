import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class InputsPage extends StatefulWidget {
  const InputsPage({super.key});

  @override
  State<InputsPage> createState() => _InputsPageState();
}

class _InputsPageState extends State<InputsPage> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  String dropdownValue = 'Dropdown inativo';
  bool isDropdownOpen = false;
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  final List<String> options = ['Opção 1', 'Opção 2', 'Opção 3'];
  final GlobalKey _dropdownKey = GlobalKey();

  void toggleDropdown() {
    if (isDropdownOpen) {
      _overlayEntry?.remove();
      _overlayEntry = null;
      isDropdownOpen = false;
    } else {
      _overlayEntry = _createOverlay();
      Overlay.of(context).insert(_overlayEntry!);
      isDropdownOpen = true;
    }
    setState(() {});
  }

  OverlayEntry _createOverlay() {
    RenderBox renderBox = _dropdownKey.currentContext!.findRenderObject() as RenderBox;
    Size size = renderBox.size;
    Offset offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        top: offset.dy + size.height + 4,
        width: size.width,
        child: Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.background,
              border: Border.all(color: AppColors.text.withOpacity(0.3)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: options.map(
                (e) => InkWell(
                  onTap: () {
                    setState(() {
                      dropdownValue = e;
                    });
                    toggleDropdown();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    alignment: Alignment.centerLeft,
                    child: Text(e, style: AppTypography.para),
                  ),
                ),
              ).toList(),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _overlayEntry?.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inputs & Dropdowns')),
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Text('Input Field', style: AppTypography.h2),
            const SizedBox(height: 8),
            TextField(
              controller: _controller1,
              style: AppTypography.para.copyWith(color: AppColors.text),
              decoration: InputDecoration(
                hintText: 'Digite algo',
                hintStyle: AppTypography.para.copyWith(color: const Color(0xFFC4CDD4)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Color(0xFFC4CDD4)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColors.primary),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColors.error, width: 2),
                ),
              ),
            ),

            const SizedBox(height: 20),
            Text('Input Field com Erro', style: AppTypography.h2),
            const SizedBox(height: 8),
            TextField(
              controller: _controller2,
              style: AppTypography.para.copyWith(color: AppColors.text),
              decoration: InputDecoration(
                hintText: 'Erro',
                hintStyle: AppTypography.para.copyWith(color: const Color(0xFFC4CDD4)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Color(0xFFC4CDD4)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColors.primary),
                ),
                errorText: 'Campo obrigatório',
                errorStyle: AppTypography.para.copyWith(
                  color: AppColors.error,
                  fontWeight: FontWeight.w700,
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColors.error, width: 2),
                ),
              ),
            ),

            const SizedBox(height: 20),
            Text('Dropdown Ativo', style: AppTypography.h2),
            const SizedBox(height: 8),
            CompositedTransformTarget(
              link: _layerLink,
              child: GestureDetector(
                key: _dropdownKey,
                onTap: toggleDropdown,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xFFC4CDD4)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(dropdownValue, style: AppTypography.para),
                      Icon(isDropdownOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down, color: AppColors.text),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
            Text('Dropdown Disabled', style: AppTypography.h2),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFFC4CDD4)),
                color: const Color(0xFFC4CDD4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Dropdown desativado', style: AppTypography.para),
                  const Icon(Icons.arrow_drop_down, color: Colors.white),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
