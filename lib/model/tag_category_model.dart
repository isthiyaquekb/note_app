// To parse this JSON data, do
//
//     final tagCategoryModel = tagCategoryModelFromMap(jsonString);

import 'dart:convert';

import 'package:note_app/model/tags_model.dart';

TagCategoryModel tagCategoryModelFromMap(String str) => TagCategoryModel.fromMap(json.decode(str));

String tagCategoryModelToMap(TagCategoryModel data) => json.encode(data.toMap());

class TagCategoryModel {
  String name;
  String id;
  final List<TagsModel> tags;

  TagCategoryModel({
    required this.name,
    required this.id,
    required this.tags,
  });

  factory TagCategoryModel.fromMap(Map<String, dynamic> json) => TagCategoryModel(
    name: json["name"],
    id: json["id"],
    tags: [],
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "id": id,
    "tags": tags,
  };

  TagCategoryModel copyWithTags(List<TagsModel> tags) {
    return TagCategoryModel(
      id: id,
      name: name,
      tags: tags,
    );
  }
}
