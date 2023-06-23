// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:mamago/common/enums.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'translate_state.freezed.dart';

@freezed
class TranslateState with _$TranslateState {
  const factory TranslateState({
    @Default(ConvertingLanguage.korean) ConvertingLanguage language,
    String? nativeText,
    String? convertedText,
  }) = _TranslateState;

}