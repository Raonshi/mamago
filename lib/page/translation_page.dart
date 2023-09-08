import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:mamago/common/enums.dart';
import 'package:mamago/provider/translate/translate_provider.dart';
import 'package:mamago/provider/translate/translate_state.dart';
import 'package:mamago/routes.dart';
import 'package:mamago/widget/tanslation_loading_widget.dart';
import 'package:mamago/widget/translate_item_widget.dart';

class TranslationPage extends ConsumerWidget {
  const TranslationPage({super.key, required this.state});

  final GoRouterState state;

  TextStyle get _detectedTextStyle => const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TranslateState translateState = ref.watch(translateProvider);

    return LoaderOverlay(
      overlayWidget: const TranslationLoadingWidget(),
      useDefaultLoading: false,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    border: Border.all(width: 1.0, color: Colors.green),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    maxLines: 15,
                    minLines: 15,
                    maxLength: 300,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter your native sentences",
                    ),
                    keyboardType: TextInputType.multiline,
                    onChanged: (value) {
                      ref.read(translateProvider.notifier).setText(value);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24.0),
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            child: DropdownButton<ConvertingLanguage>(
                              value: translateState.language,
                              underline: const Offstage(),
                              items: ConvertingLanguage.values
                                  .map((e) => DropdownMenuItem(value: e, child: Text(e.text)))
                                  .toList(),
                              onChanged: ref.read(translateProvider.notifier).setLanguage,
                            ),
                          ),
                          const SizedBox(width: 24.0),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24.0),
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            child: DropdownButton<ToneAndManner>(
                              value: translateState.toneAndManner,
                              underline: const Offstage(),
                              items: ToneAndManner.values
                                  .map((e) => DropdownMenuItem(value: e, child: Text(e.text)))
                                  .toList(),
                              onChanged: ref.read(translateProvider.notifier).setToneAndManner,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (translateState.detecting) const CircularProgressIndicator.adaptive(),
                          Text(translateState.detectedLanguage, style: _detectedTextStyle),
                        ],
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
                            if (!_checkIsCovnertable(translateState)) return;

                            rootContext.loaderOverlay.show();
                            await ref.read(translateProvider.notifier).translate().then((value) {
                              rootContext.loaderOverlay.hide();
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _checkIsCovnertable(translateState)
                                ? Theme.of(context).colorScheme.secondary
                                : Theme.of(context).disabledColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              "Go",
                              style: TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w700,
                                  color: Theme.of(context).colorScheme.onSecondary),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: translateState.convertedText.map(
                  (e) {
                    if (translateState.convertedText.indexOf(e) < translateState.convertedText.length - 1) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: TranslateItemWidget(item: e),
                      );
                    }
                    return TranslateItemWidget(item: e);
                  },
                ).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }

  bool _checkIsCovnertable(TranslateState state) {
    return !state.converting &&
        !state.detecting &&
        (state.nativeText ?? "").replaceAll(" ", "").isNotEmpty &&
        state.detectedLanguage != "NotFound" &&
        state.detectedLanguage.replaceAll(" ", "").toLowerCase() !=
            state.language.text.replaceAll(" ", "").toLowerCase();
  }
}
