
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/controllers/addController.dart';
import 'package:note_app/core/app_assets.dart';
import 'package:note_app/core/app_color.dart';
import 'package:note_app/core/app_routes.dart';
import 'package:note_app/core/app_theme.dart';
import 'package:note_app/widgets/dialogs/tags_dialog.dart';

import '../widgets/circular_button.dart';

class AddPage extends StatelessWidget {
  AddPage({Key? key}) : super(key: key);

  final addController = Get.find<AddController>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldDarkBackground,
      /*appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColor.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          "Write a poem",
          style: AppTheme.darkTheme.textTheme.headlineMedium,
        ),
        actions: [],
      ),*/
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40,),
            Text(
              "Write a poem",
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //IMAGE FOR THE NOTE
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Container(
                    height: 100,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20)),
                    child: InkWell(
                        onTap: () {

                        },
                        child: SvgPicture.asset(
                          AppAssets.galleryAdd,
                          color: Theme.of(context).iconTheme.color,
                          height: 40,
                          width: 40,
                        )),
                  ),
                ),
                //NOTE TITLE
                Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColor.secondaryColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Form(
                        key: addController.nameKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: TextFormField(
                          controller: addController.nameController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () =>
                              FocusScope.of(context).nextFocus(),
                          maxLines: 3,
                          style: Theme.of(context).textTheme.labelMedium,
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            labelText: "Your title",
                            floatingLabelStyle: const TextStyle(
                                color: AppColor.accentColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w400
                            ),
                            labelStyle: const TextStyle(
                                color: AppColor.primaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: AppColor.primaryColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: AppColor.accentColor),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                              const BorderSide(color: AppColor.darkError),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                              const BorderSide(color: AppColor.darkError),
                            ),
                          ),
                          onSaved: (String? value) {},
                          validator: (validate){
                            return addController.nameValidator(validate.toString().trim());
                          },
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            //NOTE CONTENT
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.start,
                runAlignment: WrapAlignment.start,
                children: [
                  Form(
                    key: addController.contentKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: TextFormField(
                      controller: addController.contentController,
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () =>
                          FocusScope.of(context).nextFocus(),
                      minLines: 1,
                      maxLines: null,
                        textCapitalization:TextCapitalization.sentences,
                      style: Theme.of(context).textTheme.labelMedium,
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        labelText: "Your poem will be write over here",
                        labelStyle: const TextStyle(
                            color: AppColor.accentColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                        floatingLabelStyle: const TextStyle(
                            color: AppColor.accentColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w400
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: AppColor.primaryColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: AppColor.accentColor),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: AppColor.darkError),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: AppColor.darkError),
                        ),
                      ),
                      onSaved: (String? value) {},
                      validator: (validate){
                        return addController.contentValidator(validate.toString().trim());
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      children: [
                        Text(
                          "Tags :",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        InkWell(
                            onTap: () {
                              Get.toNamed(AppRoutes.tagPage);
                              // showDialog(
                              //     context: context,
                              //     builder: (BuildContext context) {
                              //       return TagsDialog();
                              //     });
                            },
                            child: SvgPicture.asset(
                              AppAssets.hashTagAdd,
                              color: Theme.of(context).iconTheme.color,
                              height: 34,
                              width: 34,
                            )),
                        GetBuilder<AddController>(builder: (addController)=>Flexible(
                          child: Wrap(
                            children: addController.tagList
                                .asMap()
                                .entries
                                .map((e) =>
                            addController.tagList[e.key]
                                .isSelectedTag==true?Container(
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
                                )):const SizedBox.shrink())
                                .toList(),
                          ),
                        )),
                      ],
                    ),
                  )
                ],
              ),
            ),
            //NOTE SUBMISSION BUTTON
            Center(
              child: CircularButton(
                height: 42,
                width: MediaQuery.of(context).size.width * 0.6,
                color: AppColor.accentColor,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                text: "Submit",
                textColor: AppColor.deepBlue,
                onClicked: (){
                  addController.submitNote();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
