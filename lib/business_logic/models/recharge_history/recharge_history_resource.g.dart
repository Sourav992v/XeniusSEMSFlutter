// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recharge_history_resource.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RechargeHistoryResource> _$rechargeHistoryResourceSerializer =
    new _$RechargeHistoryResourceSerializer();

class _$RechargeHistoryResourceSerializer
    implements StructuredSerializer<RechargeHistoryResource> {
  @override
  final Iterable<Type> types = const [
    RechargeHistoryResource,
    _$RechargeHistoryResource
  ];
  @override
  final String wireName = 'RechargeHistoryResource';

  @override
  Iterable<Object> serialize(
      Serializers serializers, RechargeHistoryResource object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.coupon_id != null) {
      result
        ..add('coupon_id')
        ..add(serializers.serialize(object.coupon_id,
            specifiedType: const FullType(String)));
    }
    if (object.amount != null) {
      result
        ..add('amount')
        ..add(serializers.serialize(object.amount,
            specifiedType: const FullType(String)));
    }
    if (object.recharge_time != null) {
      result
        ..add('recharge_time')
        ..add(serializers.serialize(object.recharge_time,
            specifiedType: const FullType(String)));
    }
    if (object.mode != null) {
      result
        ..add('mode')
        ..add(serializers.serialize(object.mode,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  RechargeHistoryResource deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RechargeHistoryResourceBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'coupon_id':
          result.coupon_id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'amount':
          result.amount = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'recharge_time':
          result.recharge_time = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'mode':
          result.mode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$RechargeHistoryResource extends RechargeHistoryResource {
  @override
  final String coupon_id;
  @override
  final String amount;
  @override
  final String recharge_time;
  @override
  final String mode;

  factory _$RechargeHistoryResource(
          [void Function(RechargeHistoryResourceBuilder) updates]) =>
      (new RechargeHistoryResourceBuilder()..update(updates)).build();

  _$RechargeHistoryResource._(
      {this.coupon_id, this.amount, this.recharge_time, this.mode})
      : super._();

  @override
  RechargeHistoryResource rebuild(
          void Function(RechargeHistoryResourceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RechargeHistoryResourceBuilder toBuilder() =>
      new RechargeHistoryResourceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RechargeHistoryResource &&
        coupon_id == other.coupon_id &&
        amount == other.amount &&
        recharge_time == other.recharge_time &&
        mode == other.mode;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, coupon_id.hashCode), amount.hashCode),
            recharge_time.hashCode),
        mode.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RechargeHistoryResource')
          ..add('coupon_id', coupon_id)
          ..add('amount', amount)
          ..add('recharge_time', recharge_time)
          ..add('mode', mode))
        .toString();
  }
}

class RechargeHistoryResourceBuilder
    implements
        Builder<RechargeHistoryResource, RechargeHistoryResourceBuilder> {
  _$RechargeHistoryResource _$v;

  String _coupon_id;
  String get coupon_id => _$this._coupon_id;
  set coupon_id(String coupon_id) => _$this._coupon_id = coupon_id;

  String _amount;
  String get amount => _$this._amount;
  set amount(String amount) => _$this._amount = amount;

  String _recharge_time;
  String get recharge_time => _$this._recharge_time;
  set recharge_time(String recharge_time) =>
      _$this._recharge_time = recharge_time;

  String _mode;
  String get mode => _$this._mode;
  set mode(String mode) => _$this._mode = mode;

  RechargeHistoryResourceBuilder();

  RechargeHistoryResourceBuilder get _$this {
    if (_$v != null) {
      _coupon_id = _$v.coupon_id;
      _amount = _$v.amount;
      _recharge_time = _$v.recharge_time;
      _mode = _$v.mode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RechargeHistoryResource other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$RechargeHistoryResource;
  }

  @override
  void update(void Function(RechargeHistoryResourceBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RechargeHistoryResource build() {
    final _$result = _$v ??
        new _$RechargeHistoryResource._(
            coupon_id: coupon_id,
            amount: amount,
            recharge_time: recharge_time,
            mode: mode);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
