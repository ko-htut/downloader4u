library link_model;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:downloader4u/config/serializers.dart';

part 'link_model.g.dart';

abstract class LinkModel implements Built<LinkModel, LinkModelBuilder> {
  LinkModel._();

  factory LinkModel([updates(LinkModelBuilder b)]) = _$LinkModel;
  
  @BuiltValueField(wireName: 'status')
  String? get status;
  @BuiltValueField(wireName: 'source')
  String? get source;
  @BuiltValueField(wireName: 'title')
  String? get title;
  @BuiltValueField(wireName: 'image')
  String? get image;
  @BuiltValueField(wireName: 'download_urls')
  BuiltList<String?>? get downloadUrls;
  String toJson() {
    return json.encode(serializers.serializeWith(LinkModel.serializer, this));
  }

  static LinkModel fromJson(String jsonString) {
    return serializers.deserializeWith(
        LinkModel.serializer, json.decode(jsonString))!;
  }

  static Serializer<LinkModel> get serializer => _$linkModelSerializer;
}

