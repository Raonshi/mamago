import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mamago/provider/setting/setting_provider.dart';
import 'package:mamago/provider/setting/setting_state.dart';
import 'package:mamago/routes.dart';
import 'package:mamago/widget/theme_switch_dialog.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({super.key, required this.state});

  final GoRouterState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SettingState state = ref.watch(settingProvider);

    return Column(
      children: [
        ListTile(
          onTap: () {
            showDialog(
              context: rootContext,
              builder: (subContext) => ThemeSwitchDialog(
                initialThemeMode: state.themeMode,
                onChangeThemeMode: (value) {
                  ref.read(settingProvider.notifier).setThemeMode(value);
                },
              ),
            );
          },
          title: const Text("Theme Switch"),
          subtitle: const Text("current theme is light mode"),
        ),
      ],
    );
  }
}
