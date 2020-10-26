// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_applicable_resource.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CurrentApplicableResource> _$currentApplicableResourceSerializer =
    new _$CurrentApplicableResourceSerializer();

class _$CurrentApplicableResourceSerializer
    implements StructuredSerializer<CurrentApplicableResource> {
  @override
  final Iterable<Type> types = const [
    CurrentApplicableResource,
    _$CurrentApplicableResource
  ];
  @override
  final String wireName = 'CurrentApplicableResource';

  @override
  Iterable<Object> serialize(
      Serializers serializers, CurrentApplicableResource object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.heading != null) {
      result
        ..add('heading')
        ..add(serializers.serialize(object.heading,
            specifiedType: const FullType(String)));
    }
    if (object.content != null) {
      result
        ..add('content')
        ..add(serializers.serialize(object.content,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  CurrentApplicableResource deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CurrentApplicableResourceBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'heading':
          result.heading = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'content':
          result.content = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$CurrentApplicableResource extends CurrentApplicableResource {
  @override
  final String heading;
  @override
  final String content;

  factory _$CurrentApplicableResource(
          [void Function(CurrentApplicableResourceBuilder) updates]) =>
      (new CurrentApplicableResourceBuilder()..update(updates)).build();

  _$CurrentApplicableResource._({this.heading, this.content}) : super._();

  @override
  CurrentApplicableResource rebuild(
          void Function(CurrentApplicableResourceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CurrentApplicableResourceBuilder toBuilder() =>
      new CurrentApplicableResourceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CurrentApplicableResource &&
        heading == other.heading &&
        content == other.content;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, heading.hashCode), content.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CurrentApplicableResource')
          ..add('heading', heading)
          ..add('content', content))
        .toString();
  }
}

class CurrentApplicableResourceBuilder
    implements
        Builder<CurrentApplicableResource, CurrentApplicableResourceBuilder> {
  _$CurrentApplicableResource _$v;

  String _heading;
  String get heading => _$this._heading;
  set heading(String heading) => _$this._heading = heading;

  String _content;
  String get content => _$this._content;
  set content(String content) => _$this._content = content;

  CurrentApplicableResourceBuilder();

  CurrentApplicableResourceBuilder get _$this {
    if (_$v != null) {
      _heading = _$v.heading;
      _content = _$v.content;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CurrentApplicableResource other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CurrentApplicableResource;
  }

  @override
  void update(void Function(CurrentApplicableResourceBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CurrentApplicableResource build() {
    final _$result = _$v ??
        new _$CurrentApplicableResource._(heading: heading, content: content);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
