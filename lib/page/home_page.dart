import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mamago/common/enums.dart';
import 'package:mamago/provider/home/home_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key, required this.state});

  final GoRouterState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(homeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("MaMaGO"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              // Right Text Box
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.0, color: Colors.green),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Visibility(
                              maintainInteractivity: false,
                              maintainSize: true,
                              maintainAnimation: true,
                              maintainState: true,
                              visible: !provider.isLeft,
                              child: DropdownButton<ConvertingLanguage>(
                                value: provider.language,
                                isExpanded: true,
                                underline: const Offstage(),
                                items: ConvertingLanguage.values
                                    .map((e) => DropdownMenuItem(value: e, child: Text(e.text)))
                                    .toList(),
                                onChanged: ref.read(homeProvider.notifier).selectConvertingLanguage,
                              ),
                            ),
                          ),
                        ],
                      ),
                      TextFormField(
                        maxLines: null,
                        minLines: 15,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: provider.isLeft
                              ? "Enter your native sentences"
                              : "Translated sentence will be displayed here",
                        ),
                        readOnly: !provider.isLeft,
                      ),
                    ],
                  ),
                ),
              ),

              // Switcher
              RotatedBox(
                quarterTurns: provider.isLeft ? 12 : 6,
                child: InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    ref.read(homeProvider.notifier).switchConvertingDirection();
                    FocusScope.of(context).unfocus();
                  },
                  child: const Icon(Icons.double_arrow_rounded, size: 32.0),
                ),
              ),

              // Left Text Box
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.0, color: Colors.green),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Visibility(
                              maintainInteractivity: false,
                              maintainSize: true,
                              maintainAnimation: true,
                              maintainState: true,
                              visible: provider.isLeft,
                              child: DropdownButton<ConvertingLanguage>(
                                value: provider.language,
                                isExpanded: true,
                                underline: const Offstage(),
                                items: ConvertingLanguage.values
                                    .map((e) => DropdownMenuItem(value: e, child: Text(e.text)))
                                    .toList(),
                                onChanged: ref.read(homeProvider.notifier).selectConvertingLanguage,
                              ),
                            ),
                          ),
                        ],
                      ),
                      TextFormField(
                        maxLines: null,
                        minLines: 15,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: !provider.isLeft
                              ? "Enter your native sentences"
                              : "Translated sentence will be displayed here",
                        ),
                        readOnly: provider.isLeft,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text("Go", style: TextStyle(fontSize: 22.0)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
