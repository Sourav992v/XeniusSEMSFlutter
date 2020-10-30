// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_resource.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MessageResource> _$messageResourceSerializer =
    new _$MessageResourceSerializer();

class _$MessageResourceSerializer
    implements StructuredSerializer<MessageResource> {
  @override
  final Iterable<Type> types = const [MessageResource, _$MessageResource];
  @override
  final String wireName = 'MessageResource';

  @override
  Iterable<Object> serialize(Serializers serializers, MessageResource object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.Date != null) {
      result
        ..add('Date')
        ..add(serializers.serialize(object.Date,
            specifiedType: const FullType(String)));
    }
    if (object.source != null) {
      result
        ..add('source')
        ..add(serializers.serialize(object.source,
            specifiedType: const FullType(String)));
    }
    if (object.start_time != null) {
      result
        ..add('start_time')
        ..add(serializers.serialize(object.start_time,
            specifiedType: const FullType(String)));
    }
    if (object.end_time != null) {
      result
        ..add('end_time')
        ..add(serializers.serialize(object.end_time,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  MessageResource deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MessageResourceBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'Date':
          result.Date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'source':
          result.source = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'start_time':
          result.start_time = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'end_time':
          result.end_time = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$MessageResource extends MessageResource {
  @override
  final String Date;
  @override
  final String source;
  @override
  final String start_time;
  @override
  final String end_time;

  factory _$MessageResource([void Function(MessageResourceBuilder) updates]) =>
      (new MessageResourceBuilder()..update(updates)).build();

  _$MessageResource._({this.Date, this.source, this.start_time, this.end_time})
      : super._();

  @override
  MessageResource rebuild(void Function(MessageResourceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MessageResourceBuilder toBuilder() =>
      new MessageResourceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MessageResource &&
        Date == other.Date &&
        source == other.source &&
        start_time == other.start_time &&
        end_time == other.end_time;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, Date.hashCode), source.hashCode), start_time.hashCode),
        end_time.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MessageResource')
          ..add('Date', Date)
          ..add('source', source)
          ..add('start_time', start_time)
          ..add('end_time', end_time))
        .toString();
  }
}

class MessageResourceBuilder
    implements Builder<MessageResource, MessageResourceBuilder> {
  _$MessageResource _$v;

  String _Date;
  String get Date => _$this._Date;
  set Date(String Date) => _$this._Date = Date;

  String _source;
  String get source => _$this._source;
  set source(String source) => _$this._source = source;

  String _start_time;
  String get start_time => _$this._start_time;
  set start_time(String start_time) => _$this._start_time = start_time;

  String _end_time;
  String get end_time => _$this._end_time;
  set end_time(String end_time) => _$this._end_time = end_time;

  MessageResourceBuilder();

  MessageResourceBuilder get _$this {
    if (_$v != null) {
      _Date = _$v.Date;
      _source = _$v.source;
      _start_time = _$v.start_time;
      _end_time = _$v.end_time;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MessageResource other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MessageResource;
  }

  @override
  void update(void Function(MessageResourceBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MessageResource build() {
    final _$result = _$v ??
        new _$MessageResource._(
            Date: Date,
            source: source,
            start_time: start_time,
            end_time: end_time);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
