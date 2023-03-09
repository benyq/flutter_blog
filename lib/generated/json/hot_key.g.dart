import 'package:flutter_blog/generated/json/base/json_convert_content.dart';
import 'package:flutter_blog/model/hot_key.dart';

HotKey $HotKeyFromJson(Map<String, dynamic> json) {
	final HotKey hotKey = HotKey();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		hotKey.id = id;
	}
	final String? link = jsonConvert.convert<String>(json['link']);
	if (link != null) {
		hotKey.link = link;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		hotKey.name = name;
	}
	final int? order = jsonConvert.convert<int>(json['order']);
	if (order != null) {
		hotKey.order = order;
	}
	final int? visible = jsonConvert.convert<int>(json['visible']);
	if (visible != null) {
		hotKey.visible = visible;
	}
	return hotKey;
}

Map<String, dynamic> $HotKeyToJson(HotKey entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['link'] = entity.link;
	data['name'] = entity.name;
	data['order'] = entity.order;
	data['visible'] = entity.visible;
	return data;
}