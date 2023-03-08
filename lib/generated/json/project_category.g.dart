import 'package:flutter_blog/generated/json/base/json_convert_content.dart';
import 'package:flutter_blog/model/project_category.dart';

ProjectCategory $ProjectCategoryFromJson(Map<String, dynamic> json) {
	final ProjectCategory projectCategory = ProjectCategory();
	final List<dynamic>? articleList = jsonConvert.convertListNotNull<dynamic>(json['articleList']);
	if (articleList != null) {
		projectCategory.articleList = articleList;
	}
	final String? author = jsonConvert.convert<String>(json['author']);
	if (author != null) {
		projectCategory.author = author;
	}
	final List<dynamic>? children = jsonConvert.convertListNotNull<dynamic>(json['children']);
	if (children != null) {
		projectCategory.children = children;
	}
	final int? courseId = jsonConvert.convert<int>(json['courseId']);
	if (courseId != null) {
		projectCategory.courseId = courseId;
	}
	final String? cover = jsonConvert.convert<String>(json['cover']);
	if (cover != null) {
		projectCategory.cover = cover;
	}
	final String? desc = jsonConvert.convert<String>(json['desc']);
	if (desc != null) {
		projectCategory.desc = desc;
	}
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		projectCategory.id = id;
	}
	final String? lisense = jsonConvert.convert<String>(json['lisense']);
	if (lisense != null) {
		projectCategory.lisense = lisense;
	}
	final String? lisenseLink = jsonConvert.convert<String>(json['lisenseLink']);
	if (lisenseLink != null) {
		projectCategory.lisenseLink = lisenseLink;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		projectCategory.name = name;
	}
	final int? order = jsonConvert.convert<int>(json['order']);
	if (order != null) {
		projectCategory.order = order;
	}
	final int? parentChapterId = jsonConvert.convert<int>(json['parentChapterId']);
	if (parentChapterId != null) {
		projectCategory.parentChapterId = parentChapterId;
	}
	final int? type = jsonConvert.convert<int>(json['type']);
	if (type != null) {
		projectCategory.type = type;
	}
	final bool? userControlSetTop = jsonConvert.convert<bool>(json['userControlSetTop']);
	if (userControlSetTop != null) {
		projectCategory.userControlSetTop = userControlSetTop;
	}
	final int? visible = jsonConvert.convert<int>(json['visible']);
	if (visible != null) {
		projectCategory.visible = visible;
	}
	return projectCategory;
}

Map<String, dynamic> $ProjectCategoryToJson(ProjectCategory entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['articleList'] =  entity.articleList;
	data['author'] = entity.author;
	data['children'] =  entity.children;
	data['courseId'] = entity.courseId;
	data['cover'] = entity.cover;
	data['desc'] = entity.desc;
	data['id'] = entity.id;
	data['lisense'] = entity.lisense;
	data['lisenseLink'] = entity.lisenseLink;
	data['name'] = entity.name;
	data['order'] = entity.order;
	data['parentChapterId'] = entity.parentChapterId;
	data['type'] = entity.type;
	data['userControlSetTop'] = entity.userControlSetTop;
	data['visible'] = entity.visible;
	return data;
}