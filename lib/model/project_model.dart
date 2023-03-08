import 'package:flutter_blog/generated/json/base/json_field.dart';
import 'package:flutter_blog/generated/json/project_model.g.dart';
import 'dart:convert';

@JsonSerializable()
class ProjectModel {

	late bool adminAdd;
	late String apkLink;
	late int audit;
	late String author;
	late bool canEdit;
	late int chapterId;
	late String chapterName;
	late bool collect;
	late int courseId;
	late String desc;
	late String descMd;
	late String envelopePic;
	late bool fresh;
	late String host;
	late int id;
	late bool isAdminAdd;
	late String link;
	late String niceDate;
	late String niceShareDate;
	late String origin;
	late String prefix;
	late String projectLink;
	late int publishTime;
	late int realSuperChapterId;
	late bool route;
	late int selfVisible;
	late int shareDate;
	late String shareUser;
	late int superChapterId;
	late String superChapterName;
	late List<ProjectModelTags> tags;
	late String title;
	late int type;
	late int userId;
	late int visible;
	late int zan;
  
  ProjectModel();

  factory ProjectModel.fromJson(Map<String, dynamic> json) => $ProjectModelFromJson(json);

  Map<String, dynamic> toJson() => $ProjectModelToJson(this);

  ProjectModel copyWith({bool? adminAdd, String? apkLink, int? audit, String? author, bool? canEdit, int? chapterId, String? chapterName, bool? collect, int? courseId, String? desc, String? descMd, String? envelopePic, bool? fresh, String? host, int? id, bool? isAdminAdd, String? link, String? niceDate, String? niceShareDate, String? origin, String? prefix, String? projectLink, int? publishTime, int? realSuperChapterId, bool? route, int? selfVisible, int? shareDate, String? shareUser, int? superChapterId, String? superChapterName, List<ProjectModelTags>? tags, String? title, int? type, int? userId, int? visible, int? zan}) {
      return ProjectModel()..adminAdd= adminAdd ?? this.adminAdd
			..apkLink= apkLink ?? this.apkLink
			..audit= audit ?? this.audit
			..author= author ?? this.author
			..canEdit= canEdit ?? this.canEdit
			..chapterId= chapterId ?? this.chapterId
			..chapterName= chapterName ?? this.chapterName
			..collect= collect ?? this.collect
			..courseId= courseId ?? this.courseId
			..desc= desc ?? this.desc
			..descMd= descMd ?? this.descMd
			..envelopePic= envelopePic ?? this.envelopePic
			..fresh= fresh ?? this.fresh
			..host= host ?? this.host
			..id= id ?? this.id
			..isAdminAdd= isAdminAdd ?? this.isAdminAdd
			..link= link ?? this.link
			..niceDate= niceDate ?? this.niceDate
			..niceShareDate= niceShareDate ?? this.niceShareDate
			..origin= origin ?? this.origin
			..prefix= prefix ?? this.prefix
			..projectLink= projectLink ?? this.projectLink
			..publishTime= publishTime ?? this.publishTime
			..realSuperChapterId= realSuperChapterId ?? this.realSuperChapterId
			..route= route ?? this.route
			..selfVisible= selfVisible ?? this.selfVisible
			..shareDate= shareDate ?? this.shareDate
			..shareUser= shareUser ?? this.shareUser
			..superChapterId= superChapterId ?? this.superChapterId
			..superChapterName= superChapterName ?? this.superChapterName
			..tags= tags ?? this.tags
			..title= title ?? this.title
			..type= type ?? this.type
			..userId= userId ?? this.userId
			..visible= visible ?? this.visible
			..zan= zan ?? this.zan;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ProjectModelTags {

	late String name;
	late String url;
  
  ProjectModelTags();

  factory ProjectModelTags.fromJson(Map<String, dynamic> json) => $ProjectModelTagsFromJson(json);

  Map<String, dynamic> toJson() => $ProjectModelTagsToJson(this);

  ProjectModelTags copyWith({String? name, String? url}) {
      return ProjectModelTags()..name= name ?? this.name
			..url= url ?? this.url;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}