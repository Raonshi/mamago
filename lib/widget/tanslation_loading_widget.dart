import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:mamago/provider/translate/translate_provider.dart';

class TranslationLoadingWidget extends ConsumerWidget {
  const TranslationLoadingWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Lottie.asset('asset/lotties/converting.json'),
          ),
          ref.watch(translateProvider).visibleLoadingText ? const Text("It take a while...") : const Offstage(),
        ],
      ),
    );
  }
}
