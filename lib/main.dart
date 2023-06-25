import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mamago/repository.dart';
import 'package:mamago/routes.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  Repository().requestTranslate("안녕하세요. 만나서 반갑습니다.");
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "MaMaGO",
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
