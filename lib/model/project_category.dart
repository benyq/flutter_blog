import 'package:flutter_blog/generated/json/base/json_field.dart';
import 'package:flutter_blog/generated/json/project_category.g.dart';
import 'dart:convert';

@JsonSerializable()
class ProjectCategory {

	late List<dynamic> articleList;
	late String author;
	late List<dynamic> children;
	late int courseId;
	late String cover;
	late String desc;
	late int id;
	late String lisense;
	late String lisenseLink;
	late String name;
	late int order;
	late int parentChapterId;
	late int type;
	late bool userControlSetTop;
	late int visible;
  
  ProjectCategory();

  factory ProjectCategory.fromJson(Map<String, dynamic> json) => $ProjectCategoryFromJson(json);

  Map<String, dynamic> toJson() => $ProjectCategoryToJson(this);

  ProjectCategory copyWith({List<dynamic>? articleList, String? author, List<dynamic>? children, int? courseId, String? cover, String? desc, int? id, String? lisense, String? lisenseLink, String? name, int? order, int? parentChapterId, int? type, bool? userControlSetTop, int? visible}) {
      return ProjectCategory()..articleList= articleList ?? this.articleList
			..author= author ?? this.author
			..children= children ?? this.children
			..courseId= courseId ?? this.courseId
			..cover= cover ?? this.cover
			..desc= desc ?? this.desc
			..id= id ?? this.id
			..lisense= lisense ?? this.lisense
			..lisenseLink= lisenseLink ?? this.lisenseLink
			..name= name ?? this.name
			..order= order ?? this.order
			..parentChapterId= parentChapterId ?? this.parentChapterId
			..type= type ?? this.type
			..userControlSetTop= userControlSetTop ?? this.userControlSetTop
			..visible= visible ?? this.visible;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}