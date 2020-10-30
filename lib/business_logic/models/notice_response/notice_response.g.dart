// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NoticeResponse> _$noticeResponseSerializer =
    new _$NoticeResponseSerializer();

class _$NoticeResponseSerializer
    implements StructuredSerializer<NoticeResponse> {
  @override
  final Iterable<Type> types = const [NoticeResponse, _$NoticeResponse];
  @override
  final String wireName = 'NoticeResponse';

  @override
  Iterable<Object> serialize(Serializers serializers, NoticeResponse object,
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
    if (object.count != null) {
      result
        ..add('count')
        ..add(serializers.serialize(object.count,
            specifiedType: const FullType(int)));
    }
    if (object.resource != null) {
      result
        ..add('resource')
        ..add(serializers.serialize(object.resource,
            specifiedType: const FullType(
                BuiltList, const [const FullType(NoticeResource)])));
    }
    return result;
  }

  @override
  NoticeResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NoticeResponseBuilder();

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
        case 'count':
          result.count = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'resource':
          result.resource.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(NoticeResource)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$NoticeResponse extends NoticeResponse {
  @override
  final int rc;
  @override
  final String message;
  @override
  final int count;
  @override
  final BuiltList<NoticeResource> resource;

  factory _$NoticeResponse([void Function(NoticeResponseBuilder) updates]) =>
      (new NoticeResponseBuilder()..update(updates)).build();

  _$NoticeResponse._({this.rc, this.message, this.count, this.resource})
      : super._();

  @override
  NoticeResponse rebuild(void Function(NoticeResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NoticeResponseBuilder toBuilder() =>
      new NoticeResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NoticeResponse &&
        rc == other.rc &&
        message == other.message &&
        count == other.count &&
        resource == other.resource;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, rc.hashCode), message.hashCode), count.hashCode),
        resource.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NoticeResponse')
          ..add('rc', rc)
          ..add('message', message)
          ..add('count', count)
          ..add('resource', resource))
        .toString();
  }
}

class NoticeResponseBuilder
    implements Builder<NoticeResponse, NoticeResponseBuilder> {
  _$NoticeResponse _$v;

  int _rc;
  int get rc => _$this._rc;
  set rc(int rc) => _$this._rc = rc;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  int _count;
  int get count => _$this._count;
  set count(int count) => _$this._count = count;

  ListBuilder<NoticeResource> _resource;
  ListBuilder<NoticeResource> get resource =>
      _$this._resource ??= new ListBuilder<NoticeResource>();
  set resource(ListBuilder<NoticeResource> resource) =>
      _$this._resource = resource;

  NoticeResponseBuilder();

  NoticeResponseBuilder get _$this {
    if (_$v != null) {
      _rc = _$v.rc;
      _message = _$v.message;
      _count = _$v.count;
      _resource = _$v.resource?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NoticeResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NoticeResponse;
  }

  @override
  void update(void Function(NoticeResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$NoticeResponse build() {
    _$NoticeResponse _$result;
    try {
      _$result = _$v ??
          new _$NoticeResponse._(
              rc: rc,
              message: message,
              count: count,
              resource: _resource?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'resource';
        _resource?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'NoticeResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
