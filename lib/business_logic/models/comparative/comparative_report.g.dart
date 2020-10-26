// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comparative_report.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ComparativeReport> _$comparativeReportSerializer =
    new _$ComparativeReportSerializer();

class _$ComparativeReportSerializer
    implements StructuredSerializer<ComparativeReport> {
  @override
  final Iterable<Type> types = const [ComparativeReport, _$ComparativeReport];
  @override
  final String wireName = 'ComparativeReport';

  @override
  Iterable<Object> serialize(Serializers serializers, ComparativeReport object,
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
            specifiedType: const FullType(ComparativeResource)));
    }
    return result;
  }

  @override
  ComparativeReport deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ComparativeReportBuilder();

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
                  specifiedType: const FullType(ComparativeResource))
              as ComparativeResource);
          break;
      }
    }

    return result.build();
  }
}

class _$ComparativeReport extends ComparativeReport {
  @override
  final int rc;
  @override
  final String message;
  @override
  final ComparativeResource resource;

  factory _$ComparativeReport(
          [void Function(ComparativeReportBuilder) updates]) =>
      (new ComparativeReportBuilder()..update(updates)).build();

  _$ComparativeReport._({this.rc, this.message, this.resource}) : super._();

  @override
  ComparativeReport rebuild(void Function(ComparativeReportBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ComparativeReportBuilder toBuilder() =>
      new ComparativeReportBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ComparativeReport &&
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
    return (newBuiltValueToStringHelper('ComparativeReport')
          ..add('rc', rc)
          ..add('message', message)
          ..add('resource', resource))
        .toString();
  }
}

class ComparativeReportBuilder
    implements Builder<ComparativeReport, ComparativeReportBuilder> {
  _$ComparativeReport _$v;

  int _rc;
  int get rc => _$this._rc;
  set rc(int rc) => _$this._rc = rc;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  ComparativeResourceBuilder _resource;
  ComparativeResourceBuilder get resource =>
      _$this._resource ??= new ComparativeResourceBuilder();
  set resource(ComparativeResourceBuilder resource) =>
      _$this._resource = resource;

  ComparativeReportBuilder();

  ComparativeReportBuilder get _$this {
    if (_$v != null) {
      _rc = _$v.rc;
      _message = _$v.message;
      _resource = _$v.resource?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ComparativeReport other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ComparativeReport;
  }

  @override
  void update(void Function(ComparativeReportBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ComparativeReport build() {
    _$ComparativeReport _$result;
    try {
      _$result = _$v ??
          new _$ComparativeReport._(
              rc: rc, message: message, resource: _resource?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'resource';
        _resource?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ComparativeReport', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
