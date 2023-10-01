import 'dart:convert';

import 'package:crafty_bay/data/models/category_data.dart';
/// msg : "success"
/// data : [{"id":1,"categoryName":"Electronics","categoryImg":"https://photo.teamrabbil.com/images/2023/04/04/Group-1058.png","created_at":"2023-02-19T09:03:01.000000Z","updated_at":"2023-04-04T15:23:17.000000Z"},{"id":2,"categoryName":"Food","categoryImg":"https://photo.teamrabbil.com/images/2023/04/04/Group-1059.png","created_at":"2023-02-19T09:03:01.000000Z","updated_at":"2023-04-04T15:23:17.000000Z"},{"id":3,"categoryName":"Fashion","categoryImg":"https://photo.teamrabbil.com/images/2023/04/04/Group-1060.png","created_at":"2023-02-19T09:03:01.000000Z","updated_at":"2023-04-04T15:23:17.000000Z"},{"id":4,"categoryName":"Furniture","categoryImg":"https://photo.teamrabbil.com/images/2023/04/04/Group-1061.png","created_at":"2023-02-19T09:03:01.000000Z","updated_at":"2023-04-04T15:23:17.000000Z"}]

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));
String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());
class CategoryModel {
  CategoryModel({
      String? msg, 
      List<CategoryData>? data,}){
    _msg = msg;
    _data = data;
}

  CategoryModel.fromJson(dynamic json) {
    _msg = json['msg'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(CategoryData.fromJson(v));
      });
    }
  }
  String? _msg;
  List<CategoryData>? _data;
CategoryModel copyWith({  String? msg,
  List<CategoryData>? data,
}) => CategoryModel(  msg: msg ?? _msg,
  data: data ?? _data,
);
  String? get msg => _msg;
  List<CategoryData>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['msg'] = _msg;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// categoryName : "Electronics"
/// categoryImg : "https://photo.teamrabbil.com/images/2023/04/04/Group-1058.png"
/// created_at : "2023-02-19T09:03:01.000000Z"
/// updated_at : "2023-04-04T15:23:17.000000Z"

CategoryData dataFromJson(String str) => CategoryData.fromJson(json.decode(str));
String dataToJson(CategoryData data) => json.encode(data.toJson());
