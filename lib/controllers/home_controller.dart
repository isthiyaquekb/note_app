import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/model/notes_model.dart';

class HomeController extends GetxController with GetSingleTickerProviderStateMixin{

  late TabController tabController;
  late PageController pageController;
  var currentPageIndex = 1.obs;
  var pageRotationValue = 0.0.obs;
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Today'.toUpperCase()),
    Tab(text: 'Pinned'.toUpperCase()),
  ];
  //FIRESTORE DECLARED
  FirebaseFirestore? firestore;

  //LIST OF NOTES
  var noteList=<NotesModel>[].obs;

  var noDataFound=false.obs;

  @override
  void onInit() {
    firestore = FirebaseFirestore.instance;
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
    pageController = PageController(initialPage: 0,viewportFraction: 0.8);
    getAllNotes();

    super.onInit();
  }

  @override
  void dispose() {
    tabController.dispose();
    pageController.dispose();
    super.dispose();
  }

  void changePageIndex(int index){
    currentPageIndex.value=index;
    update();
  }

  void setNotFound(bool notFound){
    noDataFound.value=notFound;
    update();
  }


  Stream<List<NotesModel>>? getAllNotes() {
    try{
      var response=firestore
          ?.collection("Notes").orderBy('created', descending: false).snapshots().map((event) => event.docs.map((e) => NotesModel.fromMap(e.data())).toList());
      log("GET RESPONSE$response");

      return response;
    }catch(error, stackTrace){
      log("Error $error, $stackTrace");
    }
    return null;
  }

  
}