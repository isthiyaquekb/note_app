import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with GetSingleTickerProviderStateMixin{

  late TabController tabController;
  late PageController pageController;
  var currentPageIndex = 1.obs;
  var pageRotationValue = 0.0.obs;
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Today'.toUpperCase()),
    Tab(text: 'Pinned'.toUpperCase()),
  ];

  @override
  void onInit() {
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
    pageController = PageController(initialPage: 2,viewportFraction: 0.8);


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



  
}