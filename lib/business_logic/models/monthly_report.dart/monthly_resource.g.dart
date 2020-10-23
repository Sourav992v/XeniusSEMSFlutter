// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monthly_resource.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MonthlyResource> _$monthlyResourceSerializer =
    new _$MonthlyResourceSerializer();

class _$MonthlyResourceSerializer
    implements StructuredSerializer<MonthlyResource> {
  @override
  final Iterable<Type> types = const [MonthlyResource, _$MonthlyResource];
  @override
  final String wireName = 'MonthlyResource';

  @override
  Iterable<Object> serialize(Serializers serializers, MonthlyResource object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.date != null) {
      result
        ..add('date')
        ..add(serializers.serialize(object.date,
            specifiedType: const FullType(String)));
    }
    if (object.dg_unit != null) {
      result
        ..add('dg_unit')
        ..add(serializers.serialize(object.dg_unit,
            specifiedType: const FullType(String)));
    }
    if (object.grid_unit != null) {
      result
        ..add('grid_unit')
        ..add(serializers.serialize(object.grid_unit,
            specifiedType: const FullType(String)));
    }
    if (object.dg_amt != null) {
      result
        ..add('dg_amt')
        ..add(serializers.serialize(object.dg_amt,
            specifiedType: const FullType(double)));
    }
    if (object.grid_amt != null) {
      result
        ..add('grid_amt')
        ..add(serializers.serialize(object.grid_amt,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  MonthlyResource deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MonthlyResourceBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'dg_unit':
          result.dg_unit = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'grid_unit':
          result.grid_unit = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'dg_amt':
          result.dg_amt = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'grid_amt':
          result.grid_amt = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
      }
    }

    return result.build();
  }
}

class _$MonthlyResource extends MonthlyResource {
  @override
  final String date;
  @override
  final String dg_unit;
  @override
  final String grid_unit;
  @override
  final double dg_amt;
  @override
  final double grid_amt;

  factory _$MonthlyResource([void Function(MonthlyResourceBuilder) updates]) =>
      (new MonthlyResourceBuilder()..update(updates)).build();

  _$MonthlyResource._(
      {this.date, this.dg_unit, this.grid_unit, this.dg_amt, this.grid_amt})
      : super._();

  @override
  MonthlyResource rebuild(void Function(MonthlyResourceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MonthlyResourceBuilder toBuilder() =>
      new MonthlyResourceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MonthlyResource &&
        date == other.date &&
        dg_unit == other.dg_unit &&
        grid_unit == other.grid_unit &&
        dg_amt == other.dg_amt &&
        grid_amt == other.grid_amt;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, date.hashCode), dg_unit.hashCode),
                grid_unit.hashCode),
            dg_amt.hashCode),
        grid_amt.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MonthlyResource')
          ..add('date', date)
          ..add('dg_unit', dg_unit)
          ..add('grid_unit', grid_unit)
          ..add('dg_amt', dg_amt)
          ..add('grid_amt', grid_amt))
        .toString();
  }
}

class MonthlyResourceBuilder
    implements Builder<MonthlyResource, MonthlyResourceBuilder> {
  _$MonthlyResource _$v;

  String _date;
  String get date => _$this._date;
  set date(String date) => _$this._date = date;

  String _dg_unit;
  String get dg_unit => _$this._dg_unit;
  set dg_unit(String dg_unit) => _$this._dg_unit = dg_unit;

  String _grid_unit;
  String get grid_unit => _$this._grid_unit;
  set grid_unit(String grid_unit) => _$this._grid_unit = grid_unit;

  double _dg_amt;
  double get dg_amt => _$this._dg_amt;
  set dg_amt(double dg_amt) => _$this._dg_amt = dg_amt;

  double _grid_amt;
  double get grid_amt => _$this._grid_amt;
  set grid_amt(double grid_amt) => _$this._grid_amt = grid_amt;

  MonthlyResourceBuilder();

  MonthlyResourceBuilder get _$this {
    if (_$v != null) {
      _date = _$v.date;
      _dg_unit = _$v.dg_unit;
      _grid_unit = _$v.grid_unit;
      _dg_amt = _$v.dg_amt;
      _grid_amt = _$v.grid_amt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MonthlyResource other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MonthlyResource;
  }

  @override
  void update(void Function(MonthlyResourceBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MonthlyResource build() {
    final _$result = _$v ??
        new _$MonthlyResource._(
            date: date,
            dg_unit: dg_unit,
            grid_unit: grid_unit,
            dg_amt: dg_amt,
            grid_amt: grid_amt);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
