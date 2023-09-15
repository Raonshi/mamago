import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mamago/common/enums.dart';
import 'package:mamago/common/tools.dart';
import 'package:mamago/data/translated_item_model.dart';
import 'package:mamago/provider/translate/translate_state.dart';
import 'package:mamago/repository.dart';

final translateProvider =
    StateNotifierProvider<TranslateStateNotifier, TranslateState>((ref) => TranslateStateNotifier());

class TranslateStateNotifier extends StateNotifier<TranslateState> {
  TranslateStateNotifier() : super(const TranslateState());

  final GptRepository _repository = GptRepository();

  Timer? debounce;

  void setText(String value) {
    debounce = debouncer(debounce, () async {
      state = state.copyWith(nativeText: value, detecting: true);
      String detectedText = await _detectNativeLanguage();
      state = state.copyWith(detectedLanguage: detectedText, detecting: false);
    });
  }

  void setLanguage(ConvertingLanguage? language) {
    state = state.copyWith(language: language ?? state.language);
  }

  void setToneAndManner(ToneAndManner? toneAndManner) {
    state = state.copyWith(toneAndManner: toneAndManner ?? state.toneAndManner);
  }

  Future<void> translate() async {
    Timer(const Duration(milliseconds: 1800), () {
      state = state.copyWith(visibleLoadingText: true);
    });
    state = state.copyWith(converting: true);
    if ((state.nativeText ?? "").isEmpty) return;
    List<TranslateItem> result = await _repository.translate(state).then((value) {
      state = state.copyWith(visibleLoadingText: false);
      return value;
    });
    state = state.copyWith(convertedText: result, converting: false);
  }

  Future<String> _detectNativeLanguage() async {
    String text = (state.nativeText ?? "").replaceAll(" ", "");
    if (text.isEmpty) return "NotFound";
    return await _repository.detectLanguage(state.nativeText!);
  }
}
