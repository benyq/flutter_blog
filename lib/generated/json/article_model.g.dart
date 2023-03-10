import 'package:flutter_blog/generated/json/base/json_convert_content.dart';
import 'package:flutter_blog/model/article_model.dart';

ArticleModel $ArticleModelFromJson(Map<String, dynamic> json) {
	final ArticleModel articleModel = ArticleModel();
	final bool? adminAdd = jsonConvert.convert<bool>(json['adminAdd']);
	if (adminAdd != null) {
		articleModel.adminAdd = adminAdd;
	}
	final String? apkLink = jsonConvert.convert<String>(json['apkLink']);
	if (apkLink != null) {
		articleModel.apkLink = apkLink;
	}
	final int? audit = jsonConvert.convert<int>(json['audit']);
	if (audit != null) {
		articleModel.audit = audit;
	}
	final String? author = jsonConvert.convert<String>(json['author']);
	if (author != null) {
		articleModel.author = author;
	}
	final bool? canEdit = jsonConvert.convert<bool>(json['canEdit']);
	if (canEdit != null) {
		articleModel.canEdit = canEdit;
	}
	final int? chapterId = jsonConvert.convert<int>(json['chapterId']);
	if (chapterId != null) {
		articleModel.chapterId = chapterId;
	}
	final String? chapterName = jsonConvert.convert<String>(json['chapterName']);
	if (chapterName != null) {
		articleModel.chapterName = chapterName;
	}
	final bool? collect = jsonConvert.convert<bool>(json['collect']);
	if (collect != null) {
		articleModel.collect = collect;
	}
	final int? courseId = jsonConvert.convert<int>(json['courseId']);
	if (courseId != null) {
		articleModel.courseId = courseId;
	}
	final String? desc = jsonConvert.convert<String>(json['desc']);
	if (desc != null) {
		articleModel.desc = desc;
	}
	final String? descMd = jsonConvert.convert<String>(json['descMd']);
	if (descMd != null) {
		articleModel.descMd = descMd;
	}
	final String? envelopePic = jsonConvert.convert<String>(json['envelopePic']);
	if (envelopePic != null) {
		articleModel.envelopePic = envelopePic;
	}
	final bool? fresh = jsonConvert.convert<bool>(json['fresh']);
	if (fresh != null) {
		articleModel.fresh = fresh;
	}
	final String? host = jsonConvert.convert<String>(json['host']);
	if (host != null) {
		articleModel.host = host;
	}
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		articleModel.id = id;
	}
	final bool? isAdminAdd = jsonConvert.convert<bool>(json['isAdminAdd']);
	if (isAdminAdd != null) {
		articleModel.isAdminAdd = isAdminAdd;
	}
	final String? link = jsonConvert.convert<String>(json['link']);
	if (link != null) {
		articleModel.link = link;
	}
	final String? niceDate = jsonConvert.convert<String>(json['niceDate']);
	if (niceDate != null) {
		articleModel.niceDate = niceDate;
	}
	final String? niceShareDate = jsonConvert.convert<String>(json['niceShareDate']);
	if (niceShareDate != null) {
		articleModel.niceShareDate = niceShareDate;
	}
	final String? origin = jsonConvert.convert<String>(json['origin']);
	if (origin != null) {
		articleModel.origin = origin;
	}
	final String? prefix = jsonConvert.convert<String>(json['prefix']);
	if (prefix != null) {
		articleModel.prefix = prefix;
	}
	final String? projectLink = jsonConvert.convert<String>(json['projectLink']);
	if (projectLink != null) {
		articleModel.projectLink = projectLink;
	}
	final int? publishTime = jsonConvert.convert<int>(json['publishTime']);
	if (publishTime != null) {
		articleModel.publishTime = publishTime;
	}
	final int? realSuperChapterId = jsonConvert.convert<int>(json['realSuperChapterId']);
	if (realSuperChapterId != null) {
		articleModel.realSuperChapterId = realSuperChapterId;
	}
	final bool? route = jsonConvert.convert<bool>(json['route']);
	if (route != null) {
		articleModel.route = route;
	}
	final int? selfVisible = jsonConvert.convert<int>(json['selfVisible']);
	if (selfVisible != null) {
		articleModel.selfVisible = selfVisible;
	}
	final int? shareDate = jsonConvert.convert<int>(json['shareDate']);
	if (shareDate != null) {
		articleModel.shareDate = shareDate;
	}
	final String? shareUser = jsonConvert.convert<String>(json['shareUser']);
	if (shareUser != null) {
		articleModel.shareUser = shareUser;
	}
	final int? superChapterId = jsonConvert.convert<int>(json['superChapterId']);
	if (superChapterId != null) {
		articleModel.superChapterId = superChapterId;
	}
	final String? superChapterName = jsonConvert.convert<String>(json['superChapterName']);
	if (superChapterName != null) {
		articleModel.superChapterName = superChapterName;
	}
	final List<ArticleModelTags>? tags = jsonConvert.convertListNotNull<ArticleModelTags>(json['tags']);
	if (tags != null) {
		articleModel.tags = tags;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		articleModel.title = title;
	}
	final int? type = jsonConvert.convert<int>(json['type']);
	if (type != null) {
		articleModel.type = type;
	}
	final int? userId = jsonConvert.convert<int>(json['userId']);
	if (userId != null) {
		articleModel.userId = userId;
	}
	final int? visible = jsonConvert.convert<int>(json['visible']);
	if (visible != null) {
		articleModel.visible = visible;
	}
	final int? zan = jsonConvert.convert<int>(json['zan']);
	if (zan != null) {
		articleModel.zan = zan;
	}
	return articleModel;
}

Map<String, dynamic> $ArticleModelToJson(ArticleModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['adminAdd'] = entity.adminAdd;
	data['apkLink'] = entity.apkLink;
	data['audit'] = entity.audit;
	data['author'] = entity.author;
	data['canEdit'] = entity.canEdit;
	data['chapterId'] = entity.chapterId;
	data['chapterName'] = entity.chapterName;
	data['collect'] = entity.collect;
	data['courseId'] = entity.courseId;
	data['desc'] = entity.desc;
	data['descMd'] = entity.descMd;
	data['envelopePic'] = entity.envelopePic;
	data['fresh'] = entity.fresh;
	data['host'] = entity.host;
	data['id'] = entity.id;
	data['isAdminAdd'] = entity.isAdminAdd;
	data['link'] = entity.link;
	data['niceDate'] = entity.niceDate;
	data['niceShareDate'] = entity.niceShareDate;
	data['origin'] = entity.origin;
	data['prefix'] = entity.prefix;
	data['projectLink'] = entity.projectLink;
	data['publishTime'] = entity.publishTime;
	data['realSuperChapterId'] = entity.realSuperChapterId;
	data['route'] = entity.route;
	data['selfVisible'] = entity.selfVisible;
	data['shareDate'] = entity.shareDate;
	data['shareUser'] = entity.shareUser;
	data['superChapterId'] = entity.superChapterId;
	data['superChapterName'] = entity.superChapterName;
	data['tags'] =  entity.tags.map((v) => v.toJson()).toList();
	data['title'] = entity.title;
	data['type'] = entity.type;
	data['userId'] = entity.userId;
	data['visible'] = entity.visible;
	data['zan'] = entity.zan;
	return data;
}

ArticleModelTags $ArticleModelTagsFromJson(Map<String, dynamic> json) {
	final ArticleModelTags articleModelTags = ArticleModelTags();
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		articleModelTags.name = name;
	}
	final String? url = jsonConvert.convert<String>(json['url']);
	if (url != null) {
		articleModelTags.url = url;
	}
	return articleModelTags;
}

Map<String, dynamic> $ArticleModelTagsToJson(ArticleModelTags entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['name'] = entity.name;
	data['url'] = entity.url;
	return data;
}