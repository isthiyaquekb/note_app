import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:note_app/controllers/dashboard_controller.dart';
import 'package:note_app/core/app_color.dart';
import 'package:note_app/model/notes_model.dart';
import 'package:note_app/model/tag_category_model.dart';
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
  var tagCategoryList = <TagCategoryModel>[].obs;
  //FIRESTORE DECLARED
  FirebaseFirestore? firestore;
  FirebaseAuth? auth;
  var userId="";
  @override
  void onInit() {
    firestore = FirebaseFirestore.instance;
    auth = FirebaseAuth.instance;
    userId=auth!.currentUser!.uid;
    nameController.text = "";
    contentController.text = "";
    tagList.clear();
    getTagCategoryList();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
    // nameController.dispose();
    // contentController.dispose();
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

  void setTags(TagsModel selectedTag){
    selectedTag.isSelectedTag=selectedTag.isSelectedTag;
    log("TAG STATUS IS:${selectedTag.isSelectedTag}");
    update();
  }

  //Submitting note
  void submitNote(){
    //validation
    isNameValid = nameKey.currentState!.validate();
    isContentValid = contentKey.currentState!.validate();
    // Create a list of selected tags
    List<TagsModel> selectedTagList = tagList.value
        .where((tag) => tag.isSelectedTag)
        .toList();
    Get.focusScope!.unfocus();
    if (isNameValid && isContentValid) {
      nameKey.currentState!.save();
      contentKey.currentState!.save();
      createNote(nameController.text, contentController.text,selectedTagList);
    }
  }

  void createNote(String title, String content,List<TagsModel> tagList) async {
    try {
      log("NAME $title");
      log("CONTENT $content");
      log("TAGS $tagList");
      var noteDate = NotesModel(id: "${DateTime.now().millisecondsSinceEpoch}",title: title, content: content, tags: tagList,isFavourite: false, createdTime: Timestamp.now(),updateTime: Timestamp.now(), userId: userId);
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
  
  void getTagCategoryList()async{
    final categoryRef = firestore!.collection("poem-category");
    final querySnapshot = await categoryRef.get();
    tagCategoryList.clear();
    log("QUERY SNAPSHOT OF POEM CATEGORY: ${querySnapshot.docs}");
    for (var itemDocument in querySnapshot.docs) {
      log("DOCUMENT POEM CATEGORY: ${itemDocument.data()}");

      // Access the document data
      var documentData = itemDocument.data();

      // Create an initial model without tags
      var tagCategory = TagCategoryModel.fromMap(documentData);

      // Fetch the tags subcollection
      var tagsSnapshot = await itemDocument.reference.collection("tags").get();
      var tags = tagsSnapshot.docs.map((tagDoc) {
        return TagsModel.fromMap(tagDoc.data(),tagDoc.id);
      }).toList();

      // Add tags to the model
      var tagCategoryWithTags = tagCategory.copyWithTags(tags);

      // Log and add to the list
      log("TAG CATEGORY NAME: ${tagCategoryWithTags.name}");
      log("TAGS COUNT: ${tagCategoryWithTags.tags.length}");
      tagCategoryList.add(tagCategoryWithTags);
    }

    update();
  }

  void tagSelectedUpdate(String categoryId,String docId, bool isSelectedTag) async {
    final tagRef = firestore!
        .collection("poem-category")
        .doc(categoryId) // Category ID
        .collection("tags")
        .doc(docId); // Tag ID

    log("TAG REF:${tagRef.id}");

    try {
      // Update Firestore
      await tagRef.update({"isSelectedTag": !isSelectedTag});
      log("Tag updated successfully.");
      getTagCategoryList();
      // Optionally refresh the UI or local state
      update();
    } catch (error) {
      log("Error updating tag: $error");
    }

  }

  void getTagList(){
    for (var elementCategory in tagCategoryList) {
      for (var element in elementCategory.tags) {
        if(element.isSelectedTag){
          tagList.add(element);
        }
      }
    }
    update();
  }
}
