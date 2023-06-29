// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'translated_item_model.freezed.dart';
part 'translated_item_model.g.dart';

@freezed
class TranslateItem with _$TranslateItem {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory TranslateItem({
    String? text,
  }) = _TranslateItem;

  factory TranslateItem.fromJson(Map<String, Object?> json) => _$TranslateItemFromJson(json);
}
