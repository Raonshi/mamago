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

  void setText(String value) {
    state = state.copyWith(nativeText: value);
  }

  void setLanguage(ConvertingLanguage? language) {
    state = state.copyWith(language: language ?? state.language);
  }

  void setToneAndManner(ToneAndManner? toneAndManner) {
    state = state.copyWith(toneAndManner: toneAndManner ?? state.toneAndManner);
  }

  Future<void> translate() async {
    if ((state.nativeText ?? "").isEmpty) return;
    List<TranslateItem> result = await _repository.requestTranslate(state);
    state = state.copyWith(convertedText: result);
    lgr.d(state);
    await Future.delayed(const Duration(milliseconds: 300));
  }
}
