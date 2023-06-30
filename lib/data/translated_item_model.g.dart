// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translated_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TranslateItem _$$_TranslateItemFromJson(Map<String, dynamic> json) =>
    _$_TranslateItem(
      text: json['text'] as String?,
      index: json['index'] as int?,
      logprobs: json['logprobs'] as String?,
      finishReason: json['finish_reason'] as String?,
    );

Map<String, dynamic> _$$_TranslateItemToJson(_$_TranslateItem instance) =>
    <String, dynamic>{
      'text': instance.text,
      'index': instance.index,
      'logprobs': instance.logprobs,
      'finish_reason': instance.finishReason,
    };
