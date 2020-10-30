// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_resource.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NoticeResource> _$noticeResourceSerializer =
    new _$NoticeResourceSerializer();

class _$NoticeResourceSerializer
    implements StructuredSerializer<NoticeResource> {
  @override
  final Iterable<Type> types = const [NoticeResource, _$NoticeResource];
  @override
  final String wireName = 'NoticeResource';

  @override
  Iterable<Object> serialize(Serializers serializers, NoticeResource object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.message != null) {
      result
        ..add('message')
        ..add(serializers.serialize(object.message,
            specifiedType: const FullType(String)));
    }
    if (object.message_url != null) {
      result
        ..add('message_url')
        ..add(serializers.serialize(object.message_url,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  NoticeResource deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NoticeResourceBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'message_url':
          result.message_url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$NoticeResource extends NoticeResource {
  @override
  final String message;
  @override
  final String message_url;

  factory _$NoticeResource([void Function(NoticeResourceBuilder) updates]) =>
      (new NoticeResourceBuilder()..update(updates)).build();

  _$NoticeResource._({this.message, this.message_url}) : super._();

  @override
  NoticeResource rebuild(void Function(NoticeResourceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NoticeResourceBuilder toBuilder() =>
      new NoticeResourceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NoticeResource &&
        message == other.message &&
        message_url == other.message_url;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, message.hashCode), message_url.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NoticeResource')
          ..add('message', message)
          ..add('message_url', message_url))
        .toString();
  }
}

class NoticeResourceBuilder
    implements Builder<NoticeResource, NoticeResourceBuilder> {
  _$NoticeResource _$v;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  String _message_url;
  String get message_url => _$this._message_url;
  set message_url(String message_url) => _$this._message_url = message_url;

  NoticeResourceBuilder();

  NoticeResourceBuilder get _$this {
    if (_$v != null) {
      _message = _$v.message;
      _message_url = _$v.message_url;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NoticeResource other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NoticeResource;
  }

  @override
  void update(void Function(NoticeResourceBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$NoticeResource build() {
    final _$result = _$v ??
        new _$NoticeResource._(message: message, message_url: message_url);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
