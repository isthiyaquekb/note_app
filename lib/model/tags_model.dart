
class TagsModel {
  final String docId; // Firestore document ID
  final String? id;
  final String tagName;
  bool isSelectedTag;

  TagsModel({
    required this.docId,
    this.id,
    required this.tagName,
    required this.isSelectedTag,
  });

  factory TagsModel.fromMap(Map<String, dynamic> json,String docId) => TagsModel(
    docId: docId,
    id: json["tag-id"],
    tagName: json["tag-name"]??"",
    isSelectedTag: json["isSelectedTag"]??false,
  );

  Map<String, dynamic> toMap() => {
    "tag-id": id,
    "tag-name": tagName,
    "isSelectedTag": isSelectedTag,
  };
}