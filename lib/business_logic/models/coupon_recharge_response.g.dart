// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon_recharge_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CouponRechargeResponse> _$couponRechargeResponseSerializer =
    new _$CouponRechargeResponseSerializer();

class _$CouponRechargeResponseSerializer
    implements StructuredSerializer<CouponRechargeResponse> {
  @override
  final Iterable<Type> types = const [
    CouponRechargeResponse,
    _$CouponRechargeResponse
  ];
  @override
  final String wireName = 'CouponRechargeResponse';

  @override
  Iterable<Object> serialize(
      Serializers serializers, CouponRechargeResponse object,
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
    return result;
  }

  @override
  CouponRechargeResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CouponRechargeResponseBuilder();

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
      }
    }

    return result.build();
  }
}

class _$CouponRechargeResponse extends CouponRechargeResponse {
  @override
  final int rc;
  @override
  final String message;

  factory _$CouponRechargeResponse(
          [void Function(CouponRechargeResponseBuilder) updates]) =>
      (new CouponRechargeResponseBuilder()..update(updates)).build();

  _$CouponRechargeResponse._({this.rc, this.message}) : super._();

  @override
  CouponRechargeResponse rebuild(
          void Function(CouponRechargeResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CouponRechargeResponseBuilder toBuilder() =>
      new CouponRechargeResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CouponRechargeResponse &&
        rc == other.rc &&
        message == other.message;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, rc.hashCode), message.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CouponRechargeResponse')
          ..add('rc', rc)
          ..add('message', message))
        .toString();
  }
}

class CouponRechargeResponseBuilder
    implements Builder<CouponRechargeResponse, CouponRechargeResponseBuilder> {
  _$CouponRechargeResponse _$v;

  int _rc;
  int get rc => _$this._rc;
  set rc(int rc) => _$this._rc = rc;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  CouponRechargeResponseBuilder();

  CouponRechargeResponseBuilder get _$this {
    if (_$v != null) {
      _rc = _$v.rc;
      _message = _$v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CouponRechargeResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CouponRechargeResponse;
  }

  @override
  void update(void Function(CouponRechargeResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CouponRechargeResponse build() {
    final _$result =
        _$v ?? new _$CouponRechargeResponse._(rc: rc, message: message);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
