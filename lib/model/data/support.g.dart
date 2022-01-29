// GENERATED CODE - DO NOT MODIFY BY HAND

part of support;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Support> _$supportSerializer = new _$SupportSerializer();

class _$SupportSerializer implements StructuredSerializer<Support> {
  @override
  final Iterable<Type> types = const [Support, _$Support];
  @override
  final String wireName = 'Support';

  @override
  Iterable<Object?> serialize(Serializers serializers, Support object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'keyword',
      serializers.serialize(object.keyword,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Support deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SupportBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'keyword':
          result.keyword = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Support extends Support {
  @override
  final String name;
  @override
  final String keyword;

  factory _$Support([void Function(SupportBuilder)? updates]) =>
      (new SupportBuilder()..update(updates)).build();

  _$Support._({required this.name, required this.keyword}) : super._() {
    BuiltValueNullFieldError.checkNotNull(name, 'Support', 'name');
    BuiltValueNullFieldError.checkNotNull(keyword, 'Support', 'keyword');
  }

  @override
  Support rebuild(void Function(SupportBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SupportBuilder toBuilder() => new SupportBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Support && name == other.name && keyword == other.keyword;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, name.hashCode), keyword.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Support')
          ..add('name', name)
          ..add('keyword', keyword))
        .toString();
  }
}

class SupportBuilder implements Builder<Support, SupportBuilder> {
  _$Support? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _keyword;
  String? get keyword => _$this._keyword;
  set keyword(String? keyword) => _$this._keyword = keyword;

  SupportBuilder();

  SupportBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _keyword = $v.keyword;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Support other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Support;
  }

  @override
  void update(void Function(SupportBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Support build() {
    final _$result = _$v ??
        new _$Support._(
            name:
                BuiltValueNullFieldError.checkNotNull(name, 'Support', 'name'),
            keyword: BuiltValueNullFieldError.checkNotNull(
                keyword, 'Support', 'keyword'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
