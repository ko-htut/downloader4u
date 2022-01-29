import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:downloader4u/model/data/link_model.dart';
import 'package:downloader4u/model/data/support.dart';

part 'serializers.g.dart';

@SerializersFor([
  LinkModel,
  Support,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
