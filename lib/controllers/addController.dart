import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:note_app/controllers/dashboard_controller.dart';
import 'package:note_app/core/app_color.dart';
import 'package:note_app/model/notes_model.dart';
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
  //FIRESTORE DECLARED
  FirebaseFirestore? firestore;

  @override
  void onInit() {
    firestore = FirebaseFirestore.instance;
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

  //Submitting note
  void submitNote(){
    //validation
    isNameValid = nameKey.currentState!.validate();
    isContentValid = contentKey.currentState!.validate();
    Get.focusScope!.unfocus();
    if (isNameValid && isContentValid) {
      nameKey.currentState!.save();
      contentKey.currentState!.save();
      // Create a list of selected tags
      List<TagsModel> selectedTagList = tagList.value
          .where((tag) => tag.isSelectedTag)
          .toList();
      createNote(nameController.text, contentController.text,selectedTagList);
    }
  }

  void createNote(String title, String content,List<TagsModel> tagList) async {
    try {
      log("NAME $title");
      log("CONTENT $content");
      log("TAGS $tagList");
      var noteDate = NotesModel(id: "${DateTime.now().millisecondsSinceEpoch}",title: title, content: content, tags: tagList);
      log("INSERT INTO FIRE STORE $noteDate");

      await firestore
          ?.collection("Notes")
          .add(noteDate.toJson())
          .whenComplete(() {
        Get.snackbar(
          "Success",
          "Your note has been created",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.shade100,
          colorText: AppColor.black,
        );
        nameController.dispose();
        contentController.dispose();
        Get.find<DashboardController>().changeTabIndex(0);
      });
    } catch (error, stackTrace) {
      log("Error $error, $stackTrace");
      Get.snackbar(
        "Error",
        "Something went wrong",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade100,
        colorText: AppColor.black,
      );
    }
  }
}