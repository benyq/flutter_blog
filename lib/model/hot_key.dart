import 'package:flutter_blog/generated/json/base/json_field.dart';
import 'package:flutter_blog/generated/json/hot_key.g.dart';
import 'dart:convert';

@JsonSerializable()
class HotKey {

	late int id;
	late String link;
	late String name;
	late int order;
	late int visible;
  
  HotKey();

  factory HotKey.fromJson(Map<String, dynamic> json) => $HotKeyFromJson(json);

  Map<String, dynamic> toJson() => $HotKeyToJson(this);

  HotKey copyWith({int? id, String? link, String? name, int? order, int? visible}) {
      return HotKey()..id= id ?? this.id
			..link= link ?? this.link
			..name= name ?? this.name
			..order= order ?? this.order
			..visible= visible ?? this.visible;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}