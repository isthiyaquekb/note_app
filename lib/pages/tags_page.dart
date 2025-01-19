
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/controllers/addController.dart';
import 'package:note_app/core/app_color.dart';
import 'package:note_app/widgets/circular_button.dart';

class TagsPage extends StatelessWidget {
  const TagsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            GetBuilder<AddController>(builder: (controller) => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: controller.tagCategoryList.map((element) => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(element.name,style: Theme.of(context).textTheme.displayMedium,),
                  Wrap(
                    children: element.tags
                        .asMap()
                        .entries
                        .map((e) =>
                      InkWell(
                        onTap: ()async{
                          log("YOU SELECTED NAME:${e.value.tagName}");
                          log("YOU SELECTED ID:${e.value.id}");
                          log("YOU SELECTED BOOLEAN:${e.value.isSelectedTag}");
                          //i want to update isSelectedTag to true
                          controller.tagSelectedUpdate(element.id,e.value.docId.toString(),e.value.isSelectedTag);
                        },
                        child: Container(
                          height: 40,
                          margin: const EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                              color: element.tags[e.key]
                                  .isSelectedTag
                                  ? AppColor.primaryColor
                                  : AppColor.accentColor,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              e.value.tagName.toString(),
                              textAlign: TextAlign.center,style: GoogleFonts.quantico(
                                fontSize:  element.tags[e.key]
                                    .isSelectedTag?14:16,
                                fontWeight: element.tags[e.key]
                                    .isSelectedTag
                                    ? FontWeight.w400:FontWeight.w700,
                                color: element.tags[e.key]
                                    .isSelectedTag
                                    ? AppColor.black
                                    : AppColor.white
                            ),),
                          )),
                      ))
                        .toList(),
                  )
                ]
              )).toList(),
            ),),
            GetBuilder<AddController>(builder: (controller) => Center(
              child: CircularButton(
                height: 42,
                width: MediaQuery.of(context).size.width * 0.6,
                color: AppColor.primaryColor,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                text: "Submit",
                textColor: AppColor.deepBlue,
                onClicked: (){
                  Get.back();
                  controller.getTagList();
                },
              ),
            ),)
          ],
        )
      ),
    );
  }
}
