import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mamago/common/enums.dart';
import 'package:mamago/common/tools.dart';
import 'package:mamago/data/translated_item_model.dart';
import 'package:mamago/provider/translate/translate_provider.dart';
import 'package:mamago/provider/translate/translate_state.dart';
import 'package:mamago/widget/translate_item_widget.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key, required this.state});

  final GoRouterState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TranslateState translateState = ref.watch(translateProvider);
    Timer? debounce;

    return Scaffold(
      appBar: AppBar(
        title: const Text("MaMaGO"),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.0, color: Colors.green),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    maxLines: 15,
                    minLines: 15,
                    maxLength: 2000,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter your native sentences",
                    ),
                    keyboardType: TextInputType.multiline,
                    onChanged: (value) {
                      debounce = debouncer(debounce, () {
                        ref.read(translateProvider.notifier).setText(value);
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    children: [
                      DropdownButton<ConvertingLanguage>(
                        value: translateState.language,
                        underline: const Offstage(),
                        items: ConvertingLanguage.values
                            .map((e) => DropdownMenuItem(value: e, child: Text(e.text)))
                            .toList(),
                        onChanged: ref.read(translateProvider.notifier).setLanguage,
                      ),
                      const SizedBox(width: 24.0),
                      DropdownButton<ToneAndManner>(
                        value: translateState.toneAndManner,
                        underline: const Offstage(),
                        items:
                            ToneAndManner.values.map((e) => DropdownMenuItem(value: e, child: Text(e.text))).toList(),
                        onChanged: ref.read(translateProvider.notifier).setToneAndManner,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ElevatedButton(
                          onPressed: () async {
                            await ref.read(translateProvider.notifier).translate();
                            Future.delayed(const Duration(milliseconds: 300));
                          },
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
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                // children: translateState.convertedText
                //     .map(
                //       (e) => Container(
                //         decoration: BoxDecoration(
                //           boxShadow: [
                //             BoxShadow(offset: Offset(0.0, 0.1), blurRadius: 3.0, spreadRadius: 10.0),
                //           ],
                //         ),
                //         child: Row(
                //           children: [
                //             Text(e.text ?? ""),
                //           ],
                //         ),
                //       ),
                //     )
                //     .toList(),
                children: [
                  TranslateItemWidget(item: TranslateItem(text: "Lorem Ipsum...")),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
