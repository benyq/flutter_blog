import 'package:flutter_blog/generated/json/base/json_field.dart';
import 'package:flutter_blog/generated/json/banners.g.dart';
import 'dart:convert';

@JsonSerializable()
class Banners {

	late String desc;
	late int id;
	late String imagePath;
	late int isVisible;
	late int order;
	late String title;
	late int type;
	late String url;
  
  Banners();

  factory Banners.fromJson(Map<String, dynamic> json) => $BannersFromJson(json);

  Map<String, dynamic> toJson() => $BannersToJson(this);

  Banners copyWith({String? desc, int? id, String? imagePath, int? isVisible, int? order, String? title, int? type, String? url}) {
      return Banners()..desc= desc ?? this.desc
			..id= id ?? this.id
			..imagePath= imagePath ?? this.imagePath
			..isVisible= isVisible ?? this.isVisible
			..order= order ?? this.order
			..title= title ?? this.title
			..type= type ?? this.type
			..url= url ?? this.url;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}