
class TagsModel {
  final int? id;
  final String tagName;
  bool isSelectedTag;

  TagsModel({
    this.id,
    required this.tagName,
    required this.isSelectedTag,
  });

  factory TagsModel.fromMap(Map<String, dynamic> json) => TagsModel(
    id: json["id"],
    tagName: json["tagName"],
    isSelectedTag: json["isSelectedTag"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "tagName": tagName,
    "isSelectedTag": isSelectedTag,
  };
}