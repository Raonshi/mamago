import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mamago/common/enums.dart';
import 'package:mamago/provider/translate/translate_state.dart';

final translateProvider = StateNotifierProvider((ref) => TranslateStateNotifier());

class TranslateStateNotifier extends StateNotifier<TranslateState> {
  TranslateStateNotifier() : super(const TranslateState());

  void setText(String value, ConvertingLanguage language) {
    state = state.copyWith(nativeText: value);
  }

  void translate() {

  }
}
