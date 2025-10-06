import 'package:flutter/material.dart';
import '../components/tab_bar_delegate.dart';
import '../theme/app_theme.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({super.key});

  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> implements TabBarDelegate {
  int selectedTab = 0;

  @override
  void onTabSelected(int index) {
    setState(() {
      selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tab Bar')),
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            AppTabBar(tabs: const ['Home', 'Search', 'Profile'], delegate: this),
            const SizedBox(height: 16),
            Text('Tab selecionada: $selectedTab', style: AppTypography.para),
          ],
        ),
      ),
    );
  }
}
