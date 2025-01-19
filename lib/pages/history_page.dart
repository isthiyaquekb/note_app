import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:note_app/controllers/history_controller.dart';
import 'package:note_app/core/app_assets.dart';
import 'package:note_app/core/app_color.dart';
import 'package:note_app/core/app_theme.dart';
import 'package:spring/spring.dart';


class HistoryPage extends StatelessWidget {
  HistoryPage({Key? key}) : super(key: key);

  final historyController = Get.find<HistoryController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldDarkBackground,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 60,
              ),
              GetBuilder(init: historyController,builder: (controller) =>  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.amber.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4.0),
                      child: DropdownButton(
                        value: controller.selectedDate.value,
                        borderRadius: BorderRadius.circular(4),
                        dropdownColor: Colors.amber.shade50,
                        underline: const SizedBox.shrink(),
                        isDense: true,
                        items: controller.filterByDay
                            .map((e) => DropdownMenuItem<String>(
                            value: e,
                            child: Text(e)))
                            .toList(),
                        onChanged: (value) {
                          controller.setFilterDate(value.toString());
                        },
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      historyController.resetFilter();
                    },
                      child: Text("Reset",style: Theme.of(context).textTheme.labelMedium,)),
                ],
              ),),
              Padding(
                padding: const EdgeInsets.only(
                    top: 20.0, left: 16.0,),
                child: Text("Today's Post",
                    style: AppTheme.darkTheme.textTheme.bodySmall),
              ),
              Expanded(child: GetBuilder<HistoryController>(builder: (historyController)=>
                  NoteListComponent(controller: historyController,noteList: historyController.historyFilterNotes.isNotEmpty?historyController.historyFilterNotes:historyController.allNotes,),)),
            ],
          ),
        ),
      ),
    );
  }
}

class NoteListComponent extends StatelessWidget {
  final List<DocumentSnapshot<Object?>> noteList;
  final HistoryController controller;
  const NoteListComponent( {
    required this.noteList,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    physics: const ClampingScrollPhysics(),
    itemCount: noteList.length,
    itemBuilder: (context, index) {
      return Spring.slide(
        slideType: SlideType.slide_in_right,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 0.0, vertical: 4),
          child: Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
                color: AppColor.cardBg,
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(noteList[index].get("title"),style: AppTheme
                          .darkTheme
                          .textTheme
                          .displayLarge,),
                      InkWell(
                        onTap: (){
                          controller.deletePost(noteList[index].id);
                        },
                          child: const Icon(Icons.delete,color: AppColor.errorColor,))
                      // SvgPicture.asset(AppAssets.deleteIcon,height: 24,width: 24,colorFilter: const ColorFilter.mode(AppColor.lightError, BlendMode.srcIn),),
                    ],
                  ),
                  Text(noteList[index].get("content"),style: AppTheme
                      .darkTheme
                      .textTheme
                      .bodyMedium,),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
