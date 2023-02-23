import 'package:flutter_blog/generated/json/base/json_field.dart';
import 'package:flutter_blog/generated/json/user_info.g.dart';
import 'dart:convert';

@JsonSerializable()
class UserInfo {

	late bool admin;
	late List<dynamic> chapterTops;
	late int coinCount;
	late List<int> collectIds;
	late String email;
	late String icon;
	late int id;
	late String nickname;
	late String password;
	late String publicName;
	late String token;
	late int type;
	late String username;
  
  UserInfo();

  factory UserInfo.fromJson(Map<String, dynamic> json) => $UserInfoFromJson(json);

  Map<String, dynamic> toJson() => $UserInfoToJson(this);

  UserInfo copyWith({bool? admin, List<dynamic>? chapterTops, int? coinCount, List<int>? collectIds, String? email, String? icon, int? id, String? nickname, String? password, String? publicName, String? token, int? type, String? username}) {
      return UserInfo()..admin= admin ?? this.admin
			..chapterTops= chapterTops ?? this.chapterTops
			..coinCount= coinCount ?? this.coinCount
			..collectIds= collectIds ?? this.collectIds
			..email= email ?? this.email
			..icon= icon ?? this.icon
			..id= id ?? this.id
			..nickname= nickname ?? this.nickname
			..password= password ?? this.password
			..publicName= publicName ?? this.publicName
			..token= token ?? this.token
			..type= type ?? this.type
			..username= username ?? this.username;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}