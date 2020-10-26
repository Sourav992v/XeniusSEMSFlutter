// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_applicable_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CurrentApplicableResponse> _$currentApplicableResponseSerializer =
    new _$CurrentApplicableResponseSerializer();

class _$CurrentApplicableResponseSerializer
    implements StructuredSerializer<CurrentApplicableResponse> {
  @override
  final Iterable<Type> types = const [
    CurrentApplicableResponse,
    _$CurrentApplicableResponse
  ];
  @override
  final String wireName = 'CurrentApplicableResponse';

  @override
  Iterable<Object> serialize(
      Serializers serializers, CurrentApplicableResponse object,
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
    if (object.resource != null) {
      result
        ..add('resource')
        ..add(serializers.serialize(object.resource,
            specifiedType: const FullType(
                BuiltList, const [const FullType(CurrentApplicableResource)])));
    }
    return result;
  }

  @override
  CurrentApplicableResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CurrentApplicableResponseBuilder();

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
        case 'resource':
          result.resource.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(CurrentApplicableResource)
              ])) as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$CurrentApplicableResponse extends CurrentApplicableResponse {
  @override
  final int rc;
  @override
  final String message;
  @override
  final BuiltList<CurrentApplicableResource> resource;

  factory _$CurrentApplicableResponse(
          [void Function(CurrentApplicableResponseBuilder) updates]) =>
      (new CurrentApplicableResponseBuilder()..update(updates)).build();

  _$CurrentApplicableResponse._({this.rc, this.message, this.resource})
      : super._();

  @override
  CurrentApplicableResponse rebuild(
          void Function(CurrentApplicableResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CurrentApplicableResponseBuilder toBuilder() =>
      new CurrentApplicableResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CurrentApplicableResponse &&
        rc == other.rc &&
        message == other.message &&
        resource == other.resource;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, rc.hashCode), message.hashCode), resource.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CurrentApplicableResponse')
          ..add('rc', rc)
          ..add('message', message)
          ..add('resource', resource))
        .toString();
  }
}

class CurrentApplicableResponseBuilder
    implements
        Builder<CurrentApplicableResponse, CurrentApplicableResponseBuilder> {
  _$CurrentApplicableResponse _$v;

  int _rc;
  int get rc => _$this._rc;
  set rc(int rc) => _$this._rc = rc;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  ListBuilder<CurrentApplicableResource> _resource;
  ListBuilder<CurrentApplicableResource> get resource =>
      _$this._resource ??= new ListBuilder<CurrentApplicableResource>();
  set resource(ListBuilder<CurrentApplicableResource> resource) =>
      _$this._resource = resource;

  CurrentApplicableResponseBuilder();

  CurrentApplicableResponseBuilder get _$this {
    if (_$v != null) {
      _rc = _$v.rc;
      _message = _$v.message;
      _resource = _$v.resource?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CurrentApplicableResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CurrentApplicableResponse;
  }

  @override
  void update(void Function(CurrentApplicableResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CurrentApplicableResponse build() {
    _$CurrentApplicableResponse _$result;
    try {
      _$result = _$v ??
          new _$CurrentApplicableResponse._(
              rc: rc, message: message, resource: _resource?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'resource';
        _resource?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'CurrentApplicableResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
