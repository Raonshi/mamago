import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mamago/provider/translate/translate_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.state, required this.child});

  final GoRouterState state;
  final Widget child;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int navIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      appBar: AppBar(
        title: const Text("MaMaGO"),
      ),
      body: (context) => widget.child,
      destinations: const [
        NavigationDestination(icon: Icon(Icons.text_fields_rounded), label: "Translation"),
        NavigationDestination(icon: Icon(Icons.settings_rounded), label: "Setting"),
      ],
      selectedIndex: navIndex,
      onSelectedIndexChange: (idx) {
        setState(() {
          navIndex = idx;
        });
        switch (navIndex) {
          case 0:
            context.go("/translation");
            break;
          case 1:
            context.go("/setting");
            break;
          default:
        }
      },
    );
  }
}
