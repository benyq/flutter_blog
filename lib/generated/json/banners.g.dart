import 'package:flutter_blog/generated/json/base/json_convert_content.dart';
import 'package:flutter_blog/model/banners.dart';

Banners $BannersFromJson(Map<String, dynamic> json) {
	final Banners banners = Banners();
	final String? desc = jsonConvert.convert<String>(json['desc']);
	if (desc != null) {
		banners.desc = desc;
	}
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		banners.id = id;
	}
	final String? imagePath = jsonConvert.convert<String>(json['imagePath']);
	if (imagePath != null) {
		banners.imagePath = imagePath;
	}
	final int? isVisible = jsonConvert.convert<int>(json['isVisible']);
	if (isVisible != null) {
		banners.isVisible = isVisible;
	}
	final int? order = jsonConvert.convert<int>(json['order']);
	if (order != null) {
		banners.order = order;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		banners.title = title;
	}
	final int? type = jsonConvert.convert<int>(json['type']);
	if (type != null) {
		banners.type = type;
	}
	final String? url = jsonConvert.convert<String>(json['url']);
	if (url != null) {
		banners.url = url;
	}
	return banners;
}

Map<String, dynamic> $BannersToJson(Banners entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['desc'] = entity.desc;
	data['id'] = entity.id;
	data['imagePath'] = entity.imagePath;
	data['isVisible'] = entity.isVisible;
	data['order'] = entity.order;
	data['title'] = entity.title;
	data['type'] = entity.type;
	data['url'] = entity.url;
	return data;
}