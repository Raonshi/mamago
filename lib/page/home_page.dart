import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
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
                              child: DropdownButton<int>(
                                value: 0,
                                isExpanded: true,
                                underline: const Offstage(),
                                items: List.generate(
                                  10,
                                  (index) => DropdownMenuItem(
                                    value: index,
                                    child: const Text("Korean"),
                                  ),
                                ),
                                onChanged: (value) {},
                              ),
                            ),
                          ),
                        ],
                      ),
                      TextFormField(
                        maxLines: null,
                        minLines: 15,
                        decoration: const InputDecoration(border: InputBorder.none),
                        readOnly: !provider.isLeft,
                      ),
                    ],
                  ),
                ),
              ),
              RotatedBox(
                quarterTurns: provider.isLeft ? 12 : 6,
                child: InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    ref.read(homeProvider.notifier).switchConvertingDirection();
                  },
                  child: const Icon(Icons.double_arrow_rounded, size: 32.0),
                ),
              ),
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
                              child: DropdownButton<int>(
                                value: 0,
                                isExpanded: true,
                                underline: const Offstage(),
                                items: List.generate(
                                  10,
                                  (index) => DropdownMenuItem(
                                    value: index,
                                    child: const Text("Korean"),
                                  ),
                                ),
                                onChanged: (value) {},
                              ),
                            ),
                          ),
                        ],
                      ),
                      TextFormField(
                        maxLines: null,
                        minLines: 15,
                        decoration: const InputDecoration(border: InputBorder.none),
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
                      child: Text(
                        "Go",
                        style: TextStyle(
                          fontSize: 22.0,
                        ),
                      ),
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
