import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:note_app/model/tags_model.dart';
import 'package:note_app/model/user_model.dart';

class NotesModel {
  final String? id;
  final String title;
  final String content;
  final List<TagsModel> tags;
  final bool isFavourite;
  final Timestamp createdTime;
  final Timestamp updateTime;
  final String userId;

  NotesModel({
    this.id,
    required this.title,
    required this.content,
    required this.tags,
    required this.isFavourite,
    required this.createdTime,
    required this.updateTime,
    required this.userId,
  });

  factory NotesModel.fromMap(Map<String, dynamic> json) {
    return NotesModel(
      id : json['id'],
      title :json['title'],
      content :json['content'],
      tags : List<TagsModel>.from(json["tags"].map((x) => TagsModel.fromMap(x))),
      isFavourite:json['isFavourite']??false,
      createdTime:json['created'],
      updateTime:json['update'],
      userId:json['uid'],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "content": content,
    "tags": List<dynamic>.from(tags.map((x) => x.toMap())),
    "isFavourite":isFavourite,
    "created":createdTime,
    "update":updateTime,
    "uid":userId,

  };

}