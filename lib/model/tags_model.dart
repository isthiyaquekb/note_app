class TagsModel {
  final int? id;
  final String tagName;
  bool isSelectedTag;

  TagsModel({
    this.id,
    required this.tagName,
    required this.isSelectedTag,
  });

}