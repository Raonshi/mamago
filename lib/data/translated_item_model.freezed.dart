// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'translated_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TranslateItem _$TranslateItemFromJson(Map<String, dynamic> json) {
  return _TranslateItem.fromJson(json);
}

/// @nodoc
mixin _$TranslateItem {
  String? get text => throw _privateConstructorUsedError;
  int? get index => throw _privateConstructorUsedError;
  String? get logprobs => throw _privateConstructorUsedError;
  @JsonKey(name: "finish_reason")
  String? get finishReason => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TranslateItemCopyWith<TranslateItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TranslateItemCopyWith<$Res> {
  factory $TranslateItemCopyWith(
          TranslateItem value, $Res Function(TranslateItem) then) =
      _$TranslateItemCopyWithImpl<$Res, TranslateItem>;
  @useResult
  $Res call(
      {String? text,
      int? index,
      String? logprobs,
      @JsonKey(name: "finish_reason") String? finishReason});
}

/// @nodoc
class _$TranslateItemCopyWithImpl<$Res, $Val extends TranslateItem>
    implements $TranslateItemCopyWith<$Res> {
  _$TranslateItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
    Object? index = freezed,
    Object? logprobs = freezed,
    Object? finishReason = freezed,
  }) {
    return _then(_value.copyWith(
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      logprobs: freezed == logprobs
          ? _value.logprobs
          : logprobs // ignore: cast_nullable_to_non_nullable
              as String?,
      finishReason: freezed == finishReason
          ? _value.finishReason
          : finishReason // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TranslateItemCopyWith<$Res>
    implements $TranslateItemCopyWith<$Res> {
  factory _$$_TranslateItemCopyWith(
          _$_TranslateItem value, $Res Function(_$_TranslateItem) then) =
      __$$_TranslateItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? text,
      int? index,
      String? logprobs,
      @JsonKey(name: "finish_reason") String? finishReason});
}

/// @nodoc
class __$$_TranslateItemCopyWithImpl<$Res>
    extends _$TranslateItemCopyWithImpl<$Res, _$_TranslateItem>
    implements _$$_TranslateItemCopyWith<$Res> {
  __$$_TranslateItemCopyWithImpl(
      _$_TranslateItem _value, $Res Function(_$_TranslateItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
    Object? index = freezed,
    Object? logprobs = freezed,
    Object? finishReason = freezed,
  }) {
    return _then(_$_TranslateItem(
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      logprobs: freezed == logprobs
          ? _value.logprobs
          : logprobs // ignore: cast_nullable_to_non_nullable
              as String?,
      finishReason: freezed == finishReason
          ? _value.finishReason
          : finishReason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_TranslateItem with DiagnosticableTreeMixin implements _TranslateItem {
  const _$_TranslateItem(
      {this.text,
      this.index,
      this.logprobs,
      @JsonKey(name: "finish_reason") this.finishReason});

  factory _$_TranslateItem.fromJson(Map<String, dynamic> json) =>
      _$$_TranslateItemFromJson(json);

  @override
  final String? text;
  @override
  final int? index;
  @override
  final String? logprobs;
  @override
  @JsonKey(name: "finish_reason")
  final String? finishReason;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TranslateItem(text: $text, index: $index, logprobs: $logprobs, finishReason: $finishReason)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TranslateItem'))
      ..add(DiagnosticsProperty('text', text))
      ..add(DiagnosticsProperty('index', index))
      ..add(DiagnosticsProperty('logprobs', logprobs))
      ..add(DiagnosticsProperty('finishReason', finishReason));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TranslateItem &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.logprobs, logprobs) ||
                other.logprobs == logprobs) &&
            (identical(other.finishReason, finishReason) ||
                other.finishReason == finishReason));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, text, index, logprobs, finishReason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TranslateItemCopyWith<_$_TranslateItem> get copyWith =>
      __$$_TranslateItemCopyWithImpl<_$_TranslateItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TranslateItemToJson(
      this,
    );
  }
}

abstract class _TranslateItem implements TranslateItem {
  const factory _TranslateItem(
          {final String? text,
          final int? index,
          final String? logprobs,
          @JsonKey(name: "finish_reason") final String? finishReason}) =
      _$_TranslateItem;

  factory _TranslateItem.fromJson(Map<String, dynamic> json) =
      _$_TranslateItem.fromJson;

  @override
  String? get text;
  @override
  int? get index;
  @override
  String? get logprobs;
  @override
  @JsonKey(name: "finish_reason")
  String? get finishReason;
  @override
  @JsonKey(ignore: true)
  _$$_TranslateItemCopyWith<_$_TranslateItem> get copyWith =>
      throw _privateConstructorUsedError;
}
