import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/controllers/addController.dart';
import 'package:note_app/core/app_color.dart';

class TagsDialog extends StatelessWidget {
  TagsDialog({super.key});

  final addController = Get.find<AddController>();

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState)=> Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      elevation: 0,
      insetPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.only(top: 16),
        height: MediaQuery
            .of(context)
            .size
            .height,
        width: MediaQuery
            .of(context)
            .size
            .width * 0.90,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(padding: const EdgeInsets.only(top: 20),onPressed: (){
                Get.back();
              }, icon: const Icon(Icons.close,color: Colors.red,)),
            ),
            Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.10,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30))),
              child: const Center(
                child: Text(
                  "Available Tags",
                  style: TextStyle(
                      color: AppColor.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
              ),
            ),
            Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.65,
                width: double.maxFinite,
                decoration: const BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  const SizedBox(
                  height: 30,
                ),
                Obx(() => Flexible(
                  child: Wrap(
                    children: addController.tagList
                        .asMap()
                        .entries
                        .map((e) =>
                        InkWell(
                          onTap: () {

                            setState(() {
                              addController.tagList[e.key].isSelectedTag =
                              !addController.tagList[e.key].isSelectedTag;
                              log("TAG IS SELECTED:${addController.tagList[e
                                  .key].isSelectedTag}");
                            });
                            // addController.setTags(addController.tagList[e.key].isSelectedTag);
                          },
                          child: Container(
                              height: 40,
                              margin: const EdgeInsets.all(4.0),
                              decoration: BoxDecoration(
                                  color: addController.tagList[e.key]
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
                                  fontSize:  addController.tagList[e.key]
                                      .isSelectedTag?14:16,
                                  fontWeight: addController.tagList[e.key]
                                      .isSelectedTag
                                      ? FontWeight.w400:FontWeight.w700,
                                  color: addController.tagList[e.key]
                                      .isSelectedTag
                                      ? AppColor.black
                                      : AppColor.white
                                ),),
                              )),
                        ))
                        .toList(),
                  ),
                )),
          ],
        ),
      ),
      ],
    ),)
    ,
    ));
  }
}
