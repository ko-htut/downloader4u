// support.dart
// repo: https://github.com/januwA/p5_object_2_builtvalue
// generate: https://januwa.github.io/p5_object_2_builtvalue/index.html

library support;

import 'dart:convert';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:downloader4u/config/serializers.dart';


part 'support.g.dart';

// [{"name":"Channel Myanmar","keyword":"cmsearch"},{"name":"Gold Channel","keyword":"gcsearch"},{"name":"MMSubtitles","keyword":"mmsearch"},{"name":"Myanmar Asia TV","keyword":"matvsearch"},{"name":"Facebook","keyword":"fb"}]

/// Support
abstract class Support implements Built<Support, SupportBuilder> {
  Support._();

  factory Support([Function(SupportBuilder b) updates]) = _$Support;


  @BuiltValueField(wireName: 'name')
  String get name;


  @BuiltValueField(wireName: 'keyword')
  String get keyword;

  String toJson() {
    return jsonEncode(serializers.serializeWith(Support.serializer, this));
  }

  static Support fromJson(String jsonString) {
    return serializers
        .deserializeWith(Support.serializer, jsonDecode(jsonString))!
        .rebuild((b) => b
          ..name ??= ''
          ..keyword ??= '');
  }

  static List<Support> fromListJson(String jsonString) {
    return jsonDecode(jsonString)
        .map<Support>((e) => fromJson(jsonEncode(e)))
        .toList();
  }

  static Serializer<Support> get serializer => _$supportSerializer;
}
