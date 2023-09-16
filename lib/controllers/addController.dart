import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:note_app/model/tags_model.dart';

class AddController extends GetxController{

  final storageBox = GetStorage();

  //FORM KEYS
  final nameKey = GlobalKey<FormState>();
  final contentKey = GlobalKey<FormState>();

  //TEXT EDITING CONTROLLERS
  var nameController = TextEditingController();
  var contentController = TextEditingController();

  // VARIABLE
  var name = "".obs;
  var content = "".obs;

  //VALIDATORS
  var isNameValid = false;
  var isContentValid = false;
  var isSelected = false.obs;

  //LIST
  var tagList = <TagsModel>[].obs;

  @override
  void onInit() {
    nameController.text = "";
    contentController.text = "";
    tagList.value=[
      TagsModel(id: 1,tagName: "Rain", isSelectedTag: isSelected.value),
      TagsModel(id: 2,tagName: "inspiration", isSelectedTag: isSelected.value),
      TagsModel(id: 3,tagName: "love", isSelectedTag: isSelected.value),
      TagsModel(id: 4,tagName: "health", isSelectedTag: isSelected.value),
      TagsModel(id: 5,tagName: "motivation", isSelectedTag: isSelected.value),
      TagsModel(id: 6,tagName: "self love", isSelectedTag: isSelected.value),
      TagsModel(id: 7,tagName: "Mental Health", isSelectedTag: isSelected.value),
    ];
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    contentController.dispose();
  }

  String? nameValidator(String value) {
    if (value.isEmpty) {
      return 'Please add a title.';
    }
    return null;
  }

  String? contentValidator(String value) {
    if (value.isEmpty) {
      return 'This field cannot be empty.';
    }
    return null;
  }

  void setTags(bool selectedTag){
    isSelected.value=!selectedTag;

    update();
  }
}