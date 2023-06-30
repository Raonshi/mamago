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
  ToneAndManner get toneAndManner => throw _privateConstructorUsedError;
  String? get nativeText => throw _privateConstructorUsedError;
  List<TranslateItem> get convertedText => throw _privateConstructorUsedError;
  String get detectedLanguage => throw _privateConstructorUsedError;
  bool get detecting => throw _privateConstructorUsedError;
  bool get converting => throw _privateConstructorUsedError;

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
      {ConvertingLanguage language,
      ToneAndManner toneAndManner,
      String? nativeText,
      List<TranslateItem> convertedText,
      String detectedLanguage,
      bool detecting,
      bool converting});
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
    Object? toneAndManner = null,
    Object? nativeText = freezed,
    Object? convertedText = null,
    Object? detectedLanguage = null,
    Object? detecting = null,
    Object? converting = null,
  }) {
    return _then(_value.copyWith(
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as ConvertingLanguage,
      toneAndManner: null == toneAndManner
          ? _value.toneAndManner
          : toneAndManner // ignore: cast_nullable_to_non_nullable
              as ToneAndManner,
      nativeText: freezed == nativeText
          ? _value.nativeText
          : nativeText // ignore: cast_nullable_to_non_nullable
              as String?,
      convertedText: null == convertedText
          ? _value.convertedText
          : convertedText // ignore: cast_nullable_to_non_nullable
              as List<TranslateItem>,
      detectedLanguage: null == detectedLanguage
          ? _value.detectedLanguage
          : detectedLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      detecting: null == detecting
          ? _value.detecting
          : detecting // ignore: cast_nullable_to_non_nullable
              as bool,
      converting: null == converting
          ? _value.converting
          : converting // ignore: cast_nullable_to_non_nullable
              as bool,
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
      {ConvertingLanguage language,
      ToneAndManner toneAndManner,
      String? nativeText,
      List<TranslateItem> convertedText,
      String detectedLanguage,
      bool detecting,
      bool converting});
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
    Object? toneAndManner = null,
    Object? nativeText = freezed,
    Object? convertedText = null,
    Object? detectedLanguage = null,
    Object? detecting = null,
    Object? converting = null,
  }) {
    return _then(_$_TranslateState(
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as ConvertingLanguage,
      toneAndManner: null == toneAndManner
          ? _value.toneAndManner
          : toneAndManner // ignore: cast_nullable_to_non_nullable
              as ToneAndManner,
      nativeText: freezed == nativeText
          ? _value.nativeText
          : nativeText // ignore: cast_nullable_to_non_nullable
              as String?,
      convertedText: null == convertedText
          ? _value._convertedText
          : convertedText // ignore: cast_nullable_to_non_nullable
              as List<TranslateItem>,
      detectedLanguage: null == detectedLanguage
          ? _value.detectedLanguage
          : detectedLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      detecting: null == detecting
          ? _value.detecting
          : detecting // ignore: cast_nullable_to_non_nullable
              as bool,
      converting: null == converting
          ? _value.converting
          : converting // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_TranslateState
    with DiagnosticableTreeMixin
    implements _TranslateState {
  const _$_TranslateState(
      {this.language = ConvertingLanguage.korean,
      this.toneAndManner = ToneAndManner.business,
      this.nativeText,
      final List<TranslateItem> convertedText = const [],
      this.detectedLanguage = "",
      this.detecting = false,
      this.converting = false})
      : _convertedText = convertedText;

  @override
  @JsonKey()
  final ConvertingLanguage language;
  @override
  @JsonKey()
  final ToneAndManner toneAndManner;
  @override
  final String? nativeText;
  final List<TranslateItem> _convertedText;
  @override
  @JsonKey()
  List<TranslateItem> get convertedText {
    if (_convertedText is EqualUnmodifiableListView) return _convertedText;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_convertedText);
  }

  @override
  @JsonKey()
  final String detectedLanguage;
  @override
  @JsonKey()
  final bool detecting;
  @override
  @JsonKey()
  final bool converting;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TranslateState(language: $language, toneAndManner: $toneAndManner, nativeText: $nativeText, convertedText: $convertedText, detectedLanguage: $detectedLanguage, detecting: $detecting, converting: $converting)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TranslateState'))
      ..add(DiagnosticsProperty('language', language))
      ..add(DiagnosticsProperty('toneAndManner', toneAndManner))
      ..add(DiagnosticsProperty('nativeText', nativeText))
      ..add(DiagnosticsProperty('convertedText', convertedText))
      ..add(DiagnosticsProperty('detectedLanguage', detectedLanguage))
      ..add(DiagnosticsProperty('detecting', detecting))
      ..add(DiagnosticsProperty('converting', converting));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TranslateState &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.toneAndManner, toneAndManner) ||
                other.toneAndManner == toneAndManner) &&
            (identical(other.nativeText, nativeText) ||
                other.nativeText == nativeText) &&
            const DeepCollectionEquality()
                .equals(other._convertedText, _convertedText) &&
            (identical(other.detectedLanguage, detectedLanguage) ||
                other.detectedLanguage == detectedLanguage) &&
            (identical(other.detecting, detecting) ||
                other.detecting == detecting) &&
            (identical(other.converting, converting) ||
                other.converting == converting));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      language,
      toneAndManner,
      nativeText,
      const DeepCollectionEquality().hash(_convertedText),
      detectedLanguage,
      detecting,
      converting);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TranslateStateCopyWith<_$_TranslateState> get copyWith =>
      __$$_TranslateStateCopyWithImpl<_$_TranslateState>(this, _$identity);
}

abstract class _TranslateState implements TranslateState {
  const factory _TranslateState(
      {final ConvertingLanguage language,
      final ToneAndManner toneAndManner,
      final String? nativeText,
      final List<TranslateItem> convertedText,
      final String detectedLanguage,
      final bool detecting,
      final bool converting}) = _$_TranslateState;

  @override
  ConvertingLanguage get language;
  @override
  ToneAndManner get toneAndManner;
  @override
  String? get nativeText;
  @override
  List<TranslateItem> get convertedText;
  @override
  String get detectedLanguage;
  @override
  bool get detecting;
  @override
  bool get converting;
  @override
  @JsonKey(ignore: true)
  _$$_TranslateStateCopyWith<_$_TranslateState> get copyWith =>
      throw _privateConstructorUsedError;
}
