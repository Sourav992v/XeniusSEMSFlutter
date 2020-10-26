// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comparative_resource.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ComparativeResource> _$comparativeResourceSerializer =
    new _$ComparativeResourceSerializer();

class _$ComparativeResourceSerializer
    implements StructuredSerializer<ComparativeResource> {
  @override
  final Iterable<Type> types = const [
    ComparativeResource,
    _$ComparativeResource
  ];
  @override
  final String wireName = 'ComparativeResource';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ComparativeResource object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.previous_month != null) {
      result
        ..add('previous_month')
        ..add(serializers.serialize(object.previous_month,
            specifiedType: const FullType(String)));
    }
    if (object.previous_dg_unit != null) {
      result
        ..add('previous_dg_unit')
        ..add(serializers.serialize(object.previous_dg_unit,
            specifiedType: const FullType(String)));
    }
    if (object.previous_grid_unit != null) {
      result
        ..add('previous_grid_unit')
        ..add(serializers.serialize(object.previous_grid_unit,
            specifiedType: const FullType(String)));
    }
    if (object.previous_dg_amt != null) {
      result
        ..add('previous_dg_amt')
        ..add(serializers.serialize(object.previous_dg_amt,
            specifiedType: const FullType(double)));
    }
    if (object.previous_grid_amt != null) {
      result
        ..add('previous_grid_amt')
        ..add(serializers.serialize(object.previous_grid_amt,
            specifiedType: const FullType(double)));
    }
    if (object.current_month != null) {
      result
        ..add('current_month')
        ..add(serializers.serialize(object.current_month,
            specifiedType: const FullType(String)));
    }
    if (object.current_dg_unit != null) {
      result
        ..add('current_dg_unit')
        ..add(serializers.serialize(object.current_dg_unit,
            specifiedType: const FullType(String)));
    }
    if (object.current_grid_unit != null) {
      result
        ..add('current_grid_unit')
        ..add(serializers.serialize(object.current_grid_unit,
            specifiedType: const FullType(String)));
    }
    if (object.current_dg_amt != null) {
      result
        ..add('current_dg_amt')
        ..add(serializers.serialize(object.current_dg_amt,
            specifiedType: const FullType(double)));
    }
    if (object.current_grid_amt != null) {
      result
        ..add('current_grid_amt')
        ..add(serializers.serialize(object.current_grid_amt,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  ComparativeResource deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ComparativeResourceBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'previous_month':
          result.previous_month = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'previous_dg_unit':
          result.previous_dg_unit = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'previous_grid_unit':
          result.previous_grid_unit = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'previous_dg_amt':
          result.previous_dg_amt = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'previous_grid_amt':
          result.previous_grid_amt = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'current_month':
          result.current_month = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'current_dg_unit':
          result.current_dg_unit = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'current_grid_unit':
          result.current_grid_unit = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'current_dg_amt':
          result.current_dg_amt = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'current_grid_amt':
          result.current_grid_amt = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
      }
    }

    return result.build();
  }
}

class _$ComparativeResource extends ComparativeResource {
  @override
  final String previous_month;
  @override
  final String previous_dg_unit;
  @override
  final String previous_grid_unit;
  @override
  final double previous_dg_amt;
  @override
  final double previous_grid_amt;
  @override
  final String current_month;
  @override
  final String current_dg_unit;
  @override
  final String current_grid_unit;
  @override
  final double current_dg_amt;
  @override
  final double current_grid_amt;

  factory _$ComparativeResource(
          [void Function(ComparativeResourceBuilder) updates]) =>
      (new ComparativeResourceBuilder()..update(updates)).build();

  _$ComparativeResource._(
      {this.previous_month,
      this.previous_dg_unit,
      this.previous_grid_unit,
      this.previous_dg_amt,
      this.previous_grid_amt,
      this.current_month,
      this.current_dg_unit,
      this.current_grid_unit,
      this.current_dg_amt,
      this.current_grid_amt})
      : super._();

  @override
  ComparativeResource rebuild(
          void Function(ComparativeResourceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ComparativeResourceBuilder toBuilder() =>
      new ComparativeResourceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ComparativeResource &&
        previous_month == other.previous_month &&
        previous_dg_unit == other.previous_dg_unit &&
        previous_grid_unit == other.previous_grid_unit &&
        previous_dg_amt == other.previous_dg_amt &&
        previous_grid_amt == other.previous_grid_amt &&
        current_month == other.current_month &&
        current_dg_unit == other.current_dg_unit &&
        current_grid_unit == other.current_grid_unit &&
        current_dg_amt == other.current_dg_amt &&
        current_grid_amt == other.current_grid_amt;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc($jc(0, previous_month.hashCode),
                                        previous_dg_unit.hashCode),
                                    previous_grid_unit.hashCode),
                                previous_dg_amt.hashCode),
                            previous_grid_amt.hashCode),
                        current_month.hashCode),
                    current_dg_unit.hashCode),
                current_grid_unit.hashCode),
            current_dg_amt.hashCode),
        current_grid_amt.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ComparativeResource')
          ..add('previous_month', previous_month)
          ..add('previous_dg_unit', previous_dg_unit)
          ..add('previous_grid_unit', previous_grid_unit)
          ..add('previous_dg_amt', previous_dg_amt)
          ..add('previous_grid_amt', previous_grid_amt)
          ..add('current_month', current_month)
          ..add('current_dg_unit', current_dg_unit)
          ..add('current_grid_unit', current_grid_unit)
          ..add('current_dg_amt', current_dg_amt)
          ..add('current_grid_amt', current_grid_amt))
        .toString();
  }
}

class ComparativeResourceBuilder
    implements Builder<ComparativeResource, ComparativeResourceBuilder> {
  _$ComparativeResource _$v;

  String _previous_month;
  String get previous_month => _$this._previous_month;
  set previous_month(String previous_month) =>
      _$this._previous_month = previous_month;

  String _previous_dg_unit;
  String get previous_dg_unit => _$this._previous_dg_unit;
  set previous_dg_unit(String previous_dg_unit) =>
      _$this._previous_dg_unit = previous_dg_unit;

  String _previous_grid_unit;
  String get previous_grid_unit => _$this._previous_grid_unit;
  set previous_grid_unit(String previous_grid_unit) =>
      _$this._previous_grid_unit = previous_grid_unit;

  double _previous_dg_amt;
  double get previous_dg_amt => _$this._previous_dg_amt;
  set previous_dg_amt(double previous_dg_amt) =>
      _$this._previous_dg_amt = previous_dg_amt;

  double _previous_grid_amt;
  double get previous_grid_amt => _$this._previous_grid_amt;
  set previous_grid_amt(double previous_grid_amt) =>
      _$this._previous_grid_amt = previous_grid_amt;

  String _current_month;
  String get current_month => _$this._current_month;
  set current_month(String current_month) =>
      _$this._current_month = current_month;

  String _current_dg_unit;
  String get current_dg_unit => _$this._current_dg_unit;
  set current_dg_unit(String current_dg_unit) =>
      _$this._current_dg_unit = current_dg_unit;

  String _current_grid_unit;
  String get current_grid_unit => _$this._current_grid_unit;
  set current_grid_unit(String current_grid_unit) =>
      _$this._current_grid_unit = current_grid_unit;

  double _current_dg_amt;
  double get current_dg_amt => _$this._current_dg_amt;
  set current_dg_amt(double current_dg_amt) =>
      _$this._current_dg_amt = current_dg_amt;

  double _current_grid_amt;
  double get current_grid_amt => _$this._current_grid_amt;
  set current_grid_amt(double current_grid_amt) =>
      _$this._current_grid_amt = current_grid_amt;

  ComparativeResourceBuilder();

  ComparativeResourceBuilder get _$this {
    if (_$v != null) {
      _previous_month = _$v.previous_month;
      _previous_dg_unit = _$v.previous_dg_unit;
      _previous_grid_unit = _$v.previous_grid_unit;
      _previous_dg_amt = _$v.previous_dg_amt;
      _previous_grid_amt = _$v.previous_grid_amt;
      _current_month = _$v.current_month;
      _current_dg_unit = _$v.current_dg_unit;
      _current_grid_unit = _$v.current_grid_unit;
      _current_dg_amt = _$v.current_dg_amt;
      _current_grid_amt = _$v.current_grid_amt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ComparativeResource other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ComparativeResource;
  }

  @override
  void update(void Function(ComparativeResourceBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ComparativeResource build() {
    final _$result = _$v ??
        new _$ComparativeResource._(
            previous_month: previous_month,
            previous_dg_unit: previous_dg_unit,
            previous_grid_unit: previous_grid_unit,
            previous_dg_amt: previous_dg_amt,
            previous_grid_amt: previous_grid_amt,
            current_month: current_month,
            current_dg_unit: current_dg_unit,
            current_grid_unit: current_grid_unit,
            current_dg_amt: current_dg_amt,
            current_grid_amt: current_grid_amt);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
