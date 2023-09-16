import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController{
  var selectedTabIndex=0;
  var scaffoldKey=GlobalKey<ScaffoldState>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void changeTabIndex(int index){
    selectedTabIndex=index;
    update();
  }
}