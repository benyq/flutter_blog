import 'package:flutter_blog/generated/json/base/json_convert_content.dart';
import 'package:flutter_blog/model/user_info.dart';

UserInfo $UserInfoFromJson(Map<String, dynamic> json) {
	final UserInfo userInfo = UserInfo();
	final bool? admin = jsonConvert.convert<bool>(json['admin']);
	if (admin != null) {
		userInfo.admin = admin;
	}
	final List<dynamic>? chapterTops = jsonConvert.convertListNotNull<dynamic>(json['chapterTops']);
	if (chapterTops != null) {
		userInfo.chapterTops = chapterTops;
	}
	final int? coinCount = jsonConvert.convert<int>(json['coinCount']);
	if (coinCount != null) {
		userInfo.coinCount = coinCount;
	}
	final List<int>? collectIds = jsonConvert.convertListNotNull<int>(json['collectIds']);
	if (collectIds != null) {
		userInfo.collectIds = collectIds;
	}
	final String? email = jsonConvert.convert<String>(json['email']);
	if (email != null) {
		userInfo.email = email;
	}
	final String? icon = jsonConvert.convert<String>(json['icon']);
	if (icon != null) {
		userInfo.icon = icon;
	}
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		userInfo.id = id;
	}
	final String? nickname = jsonConvert.convert<String>(json['nickname']);
	if (nickname != null) {
		userInfo.nickname = nickname;
	}
	final String? password = jsonConvert.convert<String>(json['password']);
	if (password != null) {
		userInfo.password = password;
	}
	final String? publicName = jsonConvert.convert<String>(json['publicName']);
	if (publicName != null) {
		userInfo.publicName = publicName;
	}
	final String? token = jsonConvert.convert<String>(json['token']);
	if (token != null) {
		userInfo.token = token;
	}
	final int? type = jsonConvert.convert<int>(json['type']);
	if (type != null) {
		userInfo.type = type;
	}
	final String? username = jsonConvert.convert<String>(json['username']);
	if (username != null) {
		userInfo.username = username;
	}
	return userInfo;
}

Map<String, dynamic> $UserInfoToJson(UserInfo entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['admin'] = entity.admin;
	data['chapterTops'] =  entity.chapterTops;
	data['coinCount'] = entity.coinCount;
	data['collectIds'] =  entity.collectIds;
	data['email'] = entity.email;
	data['icon'] = entity.icon;
	data['id'] = entity.id;
	data['nickname'] = entity.nickname;
	data['password'] = entity.password;
	data['publicName'] = entity.publicName;
	data['token'] = entity.token;
	data['type'] = entity.type;
	data['username'] = entity.username;
	return data;
}