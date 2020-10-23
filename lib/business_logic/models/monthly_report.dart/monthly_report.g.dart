// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monthly_report.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MonthlyReport> _$monthlyReportSerializer =
    new _$MonthlyReportSerializer();

class _$MonthlyReportSerializer implements StructuredSerializer<MonthlyReport> {
  @override
  final Iterable<Type> types = const [MonthlyReport, _$MonthlyReport];
  @override
  final String wireName = 'MonthlyReport';

  @override
  Iterable<Object> serialize(Serializers serializers, MonthlyReport object,
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
                BuiltList, const [const FullType(MonthlyResource)])));
    }
    return result;
  }

  @override
  MonthlyReport deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MonthlyReportBuilder();

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
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(MonthlyResource)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$MonthlyReport extends MonthlyReport {
  @override
  final int rc;
  @override
  final String message;
  @override
  final BuiltList<MonthlyResource> resource;

  factory _$MonthlyReport([void Function(MonthlyReportBuilder) updates]) =>
      (new MonthlyReportBuilder()..update(updates)).build();

  _$MonthlyReport._({this.rc, this.message, this.resource}) : super._();

  @override
  MonthlyReport rebuild(void Function(MonthlyReportBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MonthlyReportBuilder toBuilder() => new MonthlyReportBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MonthlyReport &&
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
    return (newBuiltValueToStringHelper('MonthlyReport')
          ..add('rc', rc)
          ..add('message', message)
          ..add('resource', resource))
        .toString();
  }
}

class MonthlyReportBuilder
    implements Builder<MonthlyReport, MonthlyReportBuilder> {
  _$MonthlyReport _$v;

  int _rc;
  int get rc => _$this._rc;
  set rc(int rc) => _$this._rc = rc;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  ListBuilder<MonthlyResource> _resource;
  ListBuilder<MonthlyResource> get resource =>
      _$this._resource ??= new ListBuilder<MonthlyResource>();
  set resource(ListBuilder<MonthlyResource> resource) =>
      _$this._resource = resource;

  MonthlyReportBuilder();

  MonthlyReportBuilder get _$this {
    if (_$v != null) {
      _rc = _$v.rc;
      _message = _$v.message;
      _resource = _$v.resource?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MonthlyReport other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MonthlyReport;
  }

  @override
  void update(void Function(MonthlyReportBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MonthlyReport build() {
    _$MonthlyReport _$result;
    try {
      _$result = _$v ??
          new _$MonthlyReport._(
              rc: rc, message: message, resource: _resource?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'resource';
        _resource?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'MonthlyReport', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
