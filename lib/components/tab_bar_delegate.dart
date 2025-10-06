import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// 2 - Classe abstrata que define a assinatura do método usado para tratar eventos.
abstract class TabBarDelegate {
  void onTabSelected(int index);
}

/// Componente de TabBar que recebe um delegate opcional.
/// Observe: aqui chamamos delegate.onTabSelected sempre que o índice muda.
class AppTabBar extends StatefulWidget {
  final List<String> tabs;
  final TabBarDelegate? delegate;
  final int initialIndex;

  const AppTabBar({
    Key? key,
    required this.tabs,
    this.delegate,
    this.initialIndex = 0,
  }) : super(key: key);

  @override
  State<AppTabBar> createState() => _AppTabBarState();
}

class _AppTabBarState extends State<AppTabBar> with SingleTickerProviderStateMixin {
  late final TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: widget.tabs.length, vsync: this, initialIndex: widget.initialIndex);
    _controller.addListener(() {
      // Notifica delegate quando o índice finaliza a mudança
      if (!_controller.indexIsChanging) {
        widget.delegate?.onTabSelected(_controller.index);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [AppShadows.secondary],
          ),
          child: TabBar(
            controller: _controller,
            tabs: widget.tabs.map((t) => Tab(text: t)).toList(),
            labelColor: AppColors.primary,
            unselectedLabelColor: AppColors.text,
            indicatorColor: AppColors.primary,
          ),
        ),
        // TabBarView apenas para demonstrar o conteúdo; você pode remover se quiser controle externo.
        SizedBox(
          height: 140,
          child: TabBarView(
            controller: _controller,
            children: widget.tabs.map((t) => Center(child: Text(t, style: AppTypography.h3))).toList(),
          ),
        ),
      ],
    );
  }
}
