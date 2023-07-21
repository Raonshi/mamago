import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mamago/common/theme.dart';
import 'package:mamago/provider/setting/setting_provider.dart';
import 'package:mamago/routes.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingState = ref.watch(settingProvider);
    return MaterialApp.router(
      title: "MaMaGO",
      theme: lightTheme,
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
      themeMode: settingState.themeMode,
      routerConfig: router,
    );
  }
}
