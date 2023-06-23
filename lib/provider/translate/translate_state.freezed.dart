// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'translate_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TranslateState {
  ConvertingLanguage get language => throw _privateConstructorUsedError;
  String? get nativeText => throw _privateConstructorUsedError;
  String? get convertedText => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TranslateStateCopyWith<TranslateState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TranslateStateCopyWith<$Res> {
  factory $TranslateStateCopyWith(
          TranslateState value, $Res Function(TranslateState) then) =
      _$TranslateStateCopyWithImpl<$Res, TranslateState>;
  @useResult
  $Res call(
      {ConvertingLanguage language, String? nativeText, String? convertedText});
}

/// @nodoc
class _$TranslateStateCopyWithImpl<$Res, $Val extends TranslateState>
    implements $TranslateStateCopyWith<$Res> {
  _$TranslateStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? language = null,
    Object? nativeText = freezed,
    Object? convertedText = freezed,
  }) {
    return _then(_value.copyWith(
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as ConvertingLanguage,
      nativeText: freezed == nativeText
          ? _value.nativeText
          : nativeText // ignore: cast_nullable_to_non_nullable
              as String?,
      convertedText: freezed == convertedText
          ? _value.convertedText
          : convertedText // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TranslateStateCopyWith<$Res>
    implements $TranslateStateCopyWith<$Res> {
  factory _$$_TranslateStateCopyWith(
          _$_TranslateState value, $Res Function(_$_TranslateState) then) =
      __$$_TranslateStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ConvertingLanguage language, String? nativeText, String? convertedText});
}

/// @nodoc
class __$$_TranslateStateCopyWithImpl<$Res>
    extends _$TranslateStateCopyWithImpl<$Res, _$_TranslateState>
    implements _$$_TranslateStateCopyWith<$Res> {
  __$$_TranslateStateCopyWithImpl(
      _$_TranslateState _value, $Res Function(_$_TranslateState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? language = null,
    Object? nativeText = freezed,
    Object? convertedText = freezed,
  }) {
    return _then(_$_TranslateState(
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as ConvertingLanguage,
      nativeText: freezed == nativeText
          ? _value.nativeText
          : nativeText // ignore: cast_nullable_to_non_nullable
              as String?,
      convertedText: freezed == convertedText
          ? _value.convertedText
          : convertedText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_TranslateState
    with DiagnosticableTreeMixin
    implements _TranslateState {
  const _$_TranslateState(
      {this.language = ConvertingLanguage.korean,
      this.nativeText,
      this.convertedText});

  @override
  @JsonKey()
  final ConvertingLanguage language;
  @override
  final String? nativeText;
  @override
  final String? convertedText;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TranslateState(language: $language, nativeText: $nativeText, convertedText: $convertedText)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TranslateState'))
      ..add(DiagnosticsProperty('language', language))
      ..add(DiagnosticsProperty('nativeText', nativeText))
      ..add(DiagnosticsProperty('convertedText', convertedText));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TranslateState &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.nativeText, nativeText) ||
                other.nativeText == nativeText) &&
            (identical(other.convertedText, convertedText) ||
                other.convertedText == convertedText));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, language, nativeText, convertedText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TranslateStateCopyWith<_$_TranslateState> get copyWith =>
      __$$_TranslateStateCopyWithImpl<_$_TranslateState>(this, _$identity);
}

abstract class _TranslateState implements TranslateState {
  const factory _TranslateState(
      {final ConvertingLanguage language,
      final String? nativeText,
      final String? convertedText}) = _$_TranslateState;

  @override
  ConvertingLanguage get language;
  @override
  String? get nativeText;
  @override
  String? get convertedText;
  @override
  @JsonKey(ignore: true)
  _$$_TranslateStateCopyWith<_$_TranslateState> get copyWith =>
      throw _privateConstructorUsedError;
}
