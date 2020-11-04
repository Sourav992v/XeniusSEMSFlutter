// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ForgotPasswordResponse> _$forgotPasswordResponseSerializer =
    new _$ForgotPasswordResponseSerializer();

class _$ForgotPasswordResponseSerializer
    implements StructuredSerializer<ForgotPasswordResponse> {
  @override
  final Iterable<Type> types = const [
    ForgotPasswordResponse,
    _$ForgotPasswordResponse
  ];
  @override
  final String wireName = 'ForgotPasswordResponse';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ForgotPasswordResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.rc != null) {
      result
        ..add('rc')
        ..add(serializers.serialize(object.rc,
            specifiedType: const FullType(int)));
    }
    if (object.message != null) {
      result
        ..add('message')
        ..add(serializers.serialize(object.message,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  ForgotPasswordResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ForgotPasswordResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'rc':
          result.rc = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ForgotPasswordResponse extends ForgotPasswordResponse {
  @override
  final int rc;
  @override
  final String message;

  factory _$ForgotPasswordResponse(
          [void Function(ForgotPasswordResponseBuilder) updates]) =>
      (new ForgotPasswordResponseBuilder()..update(updates)).build();

  _$ForgotPasswordResponse._({this.rc, this.message}) : super._();

  @override
  ForgotPasswordResponse rebuild(
          void Function(ForgotPasswordResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ForgotPasswordResponseBuilder toBuilder() =>
      new ForgotPasswordResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ForgotPasswordResponse &&
        rc == other.rc &&
        message == other.message;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, rc.hashCode), message.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ForgotPasswordResponse')
          ..add('rc', rc)
          ..add('message', message))
        .toString();
  }
}

class ForgotPasswordResponseBuilder
    implements Builder<ForgotPasswordResponse, ForgotPasswordResponseBuilder> {
  _$ForgotPasswordResponse _$v;

  int _rc;
  int get rc => _$this._rc;
  set rc(int rc) => _$this._rc = rc;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  ForgotPasswordResponseBuilder();

  ForgotPasswordResponseBuilder get _$this {
    if (_$v != null) {
      _rc = _$v.rc;
      _message = _$v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ForgotPasswordResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ForgotPasswordResponse;
  }

  @override
  void update(void Function(ForgotPasswordResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ForgotPasswordResponse build() {
    final _$result =
        _$v ?? new _$ForgotPasswordResponse._(rc: rc, message: message);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
