// GENERATED CODE - DO NOT MODIFY BY HAND

part of link_model;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LinkModel> _$linkModelSerializer = new _$LinkModelSerializer();

class _$LinkModelSerializer implements StructuredSerializer<LinkModel> {
  @override
  final Iterable<Type> types = const [LinkModel, _$LinkModel];
  @override
  final String wireName = 'LinkModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, LinkModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.source;
    if (value != null) {
      result
        ..add('source')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.downloadUrls;
    if (value != null) {
      result
        ..add('download_urls')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType.nullable(String)])));
    }
    return result;
  }

  @override
  LinkModel deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LinkModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'source':
          result.source = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'download_urls':
          result.downloadUrls.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType.nullable(String)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$LinkModel extends LinkModel {
  @override
  final String? status;
  @override
  final String? source;
  @override
  final String? title;
  @override
  final String? image;
  @override
  final BuiltList<String?>? downloadUrls;

  factory _$LinkModel([void Function(LinkModelBuilder)? updates]) =>
      (new LinkModelBuilder()..update(updates)).build();

  _$LinkModel._(
      {this.status, this.source, this.title, this.image, this.downloadUrls})
      : super._();

  @override
  LinkModel rebuild(void Function(LinkModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LinkModelBuilder toBuilder() => new LinkModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LinkModel &&
        status == other.status &&
        source == other.source &&
        title == other.title &&
        image == other.image &&
        downloadUrls == other.downloadUrls;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, status.hashCode), source.hashCode), title.hashCode),
            image.hashCode),
        downloadUrls.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LinkModel')
          ..add('status', status)
          ..add('source', source)
          ..add('title', title)
          ..add('image', image)
          ..add('downloadUrls', downloadUrls))
        .toString();
  }
}

class LinkModelBuilder implements Builder<LinkModel, LinkModelBuilder> {
  _$LinkModel? _$v;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _source;
  String? get source => _$this._source;
  set source(String? source) => _$this._source = source;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  ListBuilder<String?>? _downloadUrls;
  ListBuilder<String?> get downloadUrls =>
      _$this._downloadUrls ??= new ListBuilder<String?>();
  set downloadUrls(ListBuilder<String?>? downloadUrls) =>
      _$this._downloadUrls = downloadUrls;

  LinkModelBuilder();

  LinkModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _source = $v.source;
      _title = $v.title;
      _image = $v.image;
      _downloadUrls = $v.downloadUrls?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LinkModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LinkModel;
  }

  @override
  void update(void Function(LinkModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LinkModel build() {
    _$LinkModel _$result;
    try {
      _$result = _$v ??
          new _$LinkModel._(
              status: status,
              source: source,
              title: title,
              image: image,
              downloadUrls: _downloadUrls?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'downloadUrls';
        _downloadUrls?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'LinkModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
